//
//  HolidayViewModel.swift
//  SampleAPIRequest
//
//  Created by Erantha Welikala on 11/5/21.
//

import Foundation
import UIKit

class HolidayViewModel {
    
    var holidayListDidSet: (()->Void)?
    var holidayList = [HolidayViewModelObject]() {
        didSet {
            if let didSetHandler = holidayListDidSet {
                didSetHandler()
            }
        }
    }
    
    init(didSetHandler: @escaping (()->Void)) {
        holidayListDidSet = didSetHandler
    }
    
    func retrieveHolidays(searchTerm: String, completion: @escaping (()->Void) = {}) {
        let holidayRequest = HolidayRequest(countryCode: searchTerm)
        holidayRequest.retrieveHolidays(completion: {
            [weak self] result in
            switch result {
            case .success(let holidays):
                self?.holidayList = holidays.map({return HolidayViewModelObject(holiday: $0)})
            case .failure(let error):
                print(error)
            }
            completion()
        })
    }
}

class HolidayViewModelObject {
    let name: String
    let date: String
    
    init(holiday: Holiday) {
        name = holiday.name
        date = holiday.date.iso
    }
}
