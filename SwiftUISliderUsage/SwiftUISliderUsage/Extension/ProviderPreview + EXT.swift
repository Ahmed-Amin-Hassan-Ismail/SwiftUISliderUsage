//
//  ProviderPreview + EXT.swift
//  SwiftUISliderUsage
//
//  Created by Ahmed Amin on 14/07/2023.
//

import SwiftUI


extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        
        return DeveloperPreview.instance
    }
}


final class DeveloperPreview {
    
    //MARK: - Singleton
    
    static let instance = DeveloperPreview()
    
    private init() { }

    let loan = Loan(
        name: "Petronala's Group",
        description: Description(languages: ["en"]),
        status: "fundraising",
        fundedAmount: 0,
        baskedAmount: 0,
        loanImage: LoanImage(templateId: 1),
        activity: "Farming",
        sector: "Agriculture",
        themes: ["Rural Exclusion","Crop Insurance"],
        use: "to gain access to cost-efficient hybrid seeds and fertilizer to grow maize.",
        location: Location(
            countryCode: "KE",
            country: "Kenya",
            town: "Gem",
            geo: Geo(level: "town",
                     pairs: "-0.023559 37.906193",
                     type: "point")),
        partnerId: 202,
        postedDate: "2023-07-14T18:10:12Z",
        plannedEXpirationDate: "2023-08-18T18:10:12Z",
        loanAmount: 775,
        borrowerCount: 8,
        lenderCount: 0,
        bonusCreditEligibility: true, tags: [
            Tag(name: "#Woman-Owned Business"),
            Tag(name: "#Eco-friendly"),
            Tag(name: "#Parent"),
            Tag(name: "#Schooling")
        ]
    )
    
    
    
    
}
