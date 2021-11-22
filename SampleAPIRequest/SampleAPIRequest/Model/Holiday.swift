//
//  Holiday.swift
//  SampleAPIRequest
//
//  Created by Erantha Welikala on 11/5/21.
//

import Foundation

struct Holiday: Codable {
    let name: String
    let description: String
    let date: HolidayDate
}

// Codable is feature coming with Swift5
struct HolidayDate: Codable {
    let iso: String
    let datetime: HolidayDateInfo
}

struct HolidayDateInfo: Codable {
    let year: Int
    let month: Int
    let day: Int
}

struct HolidayList: Codable {
    let holidays: [Holiday]
}

struct HolidayResponse: Codable {
    let response: HolidayList
}
