//
//  LoanRequest.swift
//  SwiftUISliderUsage
//
//  Created by Ahmed Amin on 14/07/2023.
//

import Foundation


struct LoanRequest: Codable {
    
    var paging: Paging?
    var loans: [Loan]?
}


struct Paging: Codable {
    
    var page: Int?
    var total: Int?
    var pageSize: Int?
    var pages: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case total
        case pageSize = "page_size"
        case pages
    }
}


