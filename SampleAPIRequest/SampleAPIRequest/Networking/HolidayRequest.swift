//
//  HolidayRequest.swift
//  SampleAPIRequest
//
//  Created by Erantha Welikala on 11/5/21.
//

import Foundation

struct HolidayRequest {
    let resourceURL: URL
    
    init(countryCode: String) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        let resourceString: String = "\(Constants.SERVICE_URL)/\(Constants.ENDPOINTS["holidays"] ?? "holidays")?api_key=\(Constants.API_KEY)&country=\(countryCode)&year=\(currentYear)"
        
        guard  let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        self.resourceURL = resourceURL
    }
    
    func retrieveHolidays(completion: @escaping(Result<[Holiday], Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {
            data, response, error in
            guard let jsonData = data else {
                completion(.failure(error!))
                return
            }
            do {
                let decorder = JSONDecoder()
                let holidayResponse = try decorder.decode(HolidayResponse.self, from: jsonData)
                let holidays = holidayResponse.response.holidays
                completion(.success(holidays))
            }
            catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}
