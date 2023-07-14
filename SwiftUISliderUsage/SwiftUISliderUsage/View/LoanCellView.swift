//
//  LoanCellView.swift
//  SwiftUISliderUsage
//
//  Created by Ahmed Amin on 14/07/2023.
//

import SwiftUI

struct LoanCellView: View {
    
    //MARK: - Attribute
    
    let loan: Loan
    
    
    //MARK: - Init
    
    init(loan: Loan) {
        self.loan = loan
    }
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            VStack(alignment: .leading) {
                Text(loan.name ?? "")
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.bold)
                
                Text(loan.location?.country ?? "")
                    .font(.system(.subheadline, design: .rounded))
                
                Text(loan.use ?? "")
                    .font(.system(.callout, design: .rounded))
                    .foregroundColor(.gray)
                
                
            }
            
            Spacer()
            
            Text("$\(loan.loanAmount ?? 0)")
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
            
        }
    }
}

struct LoanCellView_Previews: PreviewProvider {
    static var previews: some View {
        LoanCellView(loan: dev.loan)
    }
}
