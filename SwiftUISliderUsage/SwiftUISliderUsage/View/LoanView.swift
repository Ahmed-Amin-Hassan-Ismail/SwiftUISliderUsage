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
                ForEach(viewModel.filterdLoans ?? []) { loan in
                    LoanCellView(loan: loan)
                }
            }
            .listStyle(.plain)
            .fullScreenCover(isPresented: $viewModel.showFilterView, content: {
                LoanFilterView()
                    .environmentObject(viewModel)
                })
            .navigationTitle("Kiva Loan")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing,
                            content: {filterButtonView})
            }
        }
    }
}


extension LoanView {
    
    private var filterButtonView: some View {
        
        Button {
            
            viewModel.showFilterView.toggle()
            
        } label: {
            Text("Filter")
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.primary)
        }

    }
}

struct LoanView_Previews: PreviewProvider {
    static var previews: some View {
        LoanView()
            .preferredColorScheme(.dark)
    }
}
