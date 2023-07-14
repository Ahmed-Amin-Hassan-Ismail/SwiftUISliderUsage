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
        
        let requst = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: requst) { [weak self] data, response, error in
            
            guard let self = self else { return }
            
            if let error = error {
                print(error)
                return
            }
            
            do {
                
                guard let data = data else { return }
                
                let model = try JSONDecoder().decode(LoanRequest.self, from: data)
                
                DispatchQueue.main.async {
                    
                    self.loans = model.loans
                    self.filterdLoans = model.loans
                }
                
            } catch (let error) {
                
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    func filterLoanAmount(amount: Int) {
        
        
        filterdLoans = loans?.filter({ ($0.loanAmount ?? 0) <= amount})
    }
}
