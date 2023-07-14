//
//  Loan.swift
//  SwiftUISliderUsage
//
//  Created by Ahmed Amin on 14/07/2023.
//

import Foundation



struct Loan: Codable, Identifiable {
    
    var id = UUID()
    var name: String?
    var description: Description?
    var status: String?
    var fundedAmount: Int?
    var baskedAmount: Int?
    var loanImage: LoanImage?
    var activity: String?
    var sector: String?
    var themes: [String]?
    var use: String?
    var location: Location?
    var partnerId: Int?
    var postedDate: String?
    var plannedEXpirationDate: String?
    var loanAmount: Int?
    var borrowerCount: Int?
    var lenderCount: Int?
    var bonusCreditEligibility: Bool?
    var tags: [Tag]?
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case status
        case fundedAmount = "funded_amount"
        case baskedAmount = "basket_amount"
        case loanImage = "image"
        case activity
        case sector
        case themes
        case use
        case location
        case partnerId = "partner_id"
        case postedDate = "posted_date"
        case plannedEXpirationDate = "planned_expiration_date"
        case loanAmount = "loan_amount"
        case borrowerCount = "borrowerCount"
        case lenderCount = "lender_count"
        case bonusCreditEligibility = "bonus_credit_eligibility"
        case tags
    }
}


struct Description: Codable {
    
    var languages: [String]?
}

struct LoanImage: Codable, Identifiable {
    
    var id = UUID()
    var templateId: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case templateId = "template_id"
    }
}

struct Location: Codable {
    
    var countryCode: String?
    var country: String?
    var town: String?
    var geo: Geo?
    
    
    enum CodingKeys: String, CodingKey {
        
        case countryCode = "country_code"
        case country
        case town
        case geo
    }
    
}


struct Geo: Codable {
    
    var level: String?
    var pairs: String?
    var type: String?
}

struct Tag: Codable, Identifiable {
    var id = UUID().uuidString
    var name: String?
}
