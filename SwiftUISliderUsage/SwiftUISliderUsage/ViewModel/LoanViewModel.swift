//
//  LoanViewModel.swift
//  SwiftUISliderUsage
//
//  Created by Ahmed Amin on 14/07/2023.
//

import Foundation


final class LoanViewModel: ObservableObject {
    
    @Published private var loans: [Loan]?
    @Published var filterdLoans: [Loan]?
    @Published var showFilterView: Bool = false
    @Published var maxAmount: Double = 10_000
    
    
    init() {
        
        fetchLoanData()
    }
    
    
    private func fetchLoanData() {
        
        guard let url = URL(string: "https://api.kivaws.org/v1/loans/newest.json") else { return }
        
        NetworkRequest<LoanRequest>.requestLoans(url: url) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                
                self.loans = model.loans
                self.filterdLoans = model.loans
            }
        }
    }
    
    func filterLoanAmount(amount: Int) {
        
        
        filterdLoans = loans?.filter({ ($0.loanAmount ?? 0) <= amount})
    }
    
    func filterReset() {
        
        maxAmount = 10_000
        filterdLoans = loans
    }
}
