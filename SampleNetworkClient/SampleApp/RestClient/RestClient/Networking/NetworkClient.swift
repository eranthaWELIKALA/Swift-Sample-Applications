//
//  NetworkClient.swift
//  RestClient
//
//  Created by Erantha Welikala on 11/22/21.
//

import Foundation

public typealias JSON = [String: Any]
public typealias HTTPHeaders = [String: String]

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

extension URL {
    init<A, E>(baseURL: String, resource: Resource<A, E>) {
        var components = URLComponents(string: baseURL)!
        let resourceComponents = URLComponents(string: resource.path.absolutePath)!
        
        components.path = Path(components.path).appending(path: Path(resourceComponents.path)).absolutePath
        components.queryItems = resourceComponents.queryItems
        
        switch resource.method {
        case .get, .delete:
            var queryItems = components.queryItems ?? []
            queryItems.append(contentsOf: resource.params.map {
                URLQueryItem(name: $0.key, value: String(describing: $0.value))
            })
            components.queryItems = queryItems
        default:
            break
        }
        
        self = components.url!
    }
}

extension URLRequest {
    init<A, E>(baseURL: String, resource: Resource<A, E>) {
        let url = URL(baseURL: baseURL, resource: resource)
        self.init(url: url)
        
        httpMethod = resource.method.rawValue
        resource.headers.forEach{
            setValue($0.value, forHTTPHeaderField: $0.key)
        }
        switch resource.method {
        case .post, .put:
            httpBody = try! JSONSerialization.data(withJSONObject: resource.params, options: [])
        default:
            break
        }
    }
}

public final class NetworkClient {
    private var baseURL: String
    
    public var commonParams: JSON = [:]
    
    public static let shared: NetworkClient = {
        let client = NetworkClient(baseURL: "")
        return client
    }()
    
    private init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    public func setBaseURL(url : String) {
        self.baseURL = url
    }
    
    public func load<A, CustomError>(resource: Resource<A, CustomError>,
                              completion: @escaping(Result<A, CustomError>) -> ()) -> URLSessionTask? {
        if !Reachability.isConnectedToNetwork() {
            completion(.failure(.NoInternetConnection))
            return nil
        }
        
        var newResource = resource
        newResource.params = newResource.params.merging(commonParams) {
            spec, common in
            return spec
        }
        
        let request = URLRequest(baseURL: baseURL, resource: newResource)
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, _ in
            // Parsing Incoming Data
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.Other))
                return
            }
            if (200..<300) ~= response.statusCode {
                completion(Result(value: data.flatMap(resource.parse), or: .Other))
            }
            else if response.statusCode == 401 {
                completion(.failure(.UnAuthorized))
            }
            else {
                completion(.failure(data.flatMap(resource.parseError).map({.Custom($0)}) ?? .Other))
            }
        }
        task.resume()
        return task
    }
}
