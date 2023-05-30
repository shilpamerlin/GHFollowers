//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Shilpa Joy on 2023-05-30.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
