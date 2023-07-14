//
//  LoanView.swift
//  SwiftUISliderUsage
//
//  Created by Ahmed Amin on 14/07/2023.
//

import SwiftUI

struct LoanView: View {
    
    @StateObject private var viewModel = LoanViewModel()
    
    var body: some View {
        
        NavigationView {
           
            List {
                ForEach(viewModel.loans ?? []) { loan in
                    LoanCellView(loan: loan)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Kiva Loan")
        }
    }
}

struct LoanView_Previews: PreviewProvider {
    static var previews: some View {
        LoanView()
    }
}
