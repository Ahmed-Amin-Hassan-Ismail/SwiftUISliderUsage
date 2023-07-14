//
//  LoanFilterView.swift
//  SwiftUISliderUsage
//
//  Created by Ahmed Amin on 14/07/2023.
//

import SwiftUI

struct LoanFilterView: View {
    
    //MARK: - Attribute
    
    @EnvironmentObject private var viewModel: LoanViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    private let minAmount: Double = 0
    private let maxAmount: Double = 10_000
    private let sliderStep: Double = 100
    
    var body: some View {
        
        VStack(alignment: .trailing) {
            
            
            HStack {
                
               clearButton
                
                Spacer()
                
                dismissButton
                
            }
            
            Spacer()
            
            filterView
                .frame(maxHeight: .infinity)
        }
        .padding()
    }
}


extension LoanFilterView {
    
    private var dismissButton: some View {
        Button {
            
            presentationMode.wrappedValue.dismiss()
            
        } label: {
            
            Image(systemName: "xmark")
                .font(.system(.title, design: .rounded))
                .foregroundColor(.primary)
        }
    }
    
    private var clearButton: some View {
        Button {
         
            viewModel.filterReset()
            
        } label: {
            Text("Clear")
                .font(.system(.title2, design: .rounded))
                .foregroundColor(.purple)
        }
    }
    
    private var filterView: some View {
        VStack(alignment: .leading) {
            
            Text("Show loan amount below $\(Int(viewModel.maxAmount))")
                .font(.system(.headline, design: .rounded))
            
            HStack {
                
                Slider(value: $viewModel.maxAmount, in: minAmount...maxAmount, step: sliderStep, onEditingChanged: { _ in
                    viewModel.filterLoanAmount(amount: Int(viewModel.maxAmount))
                    
                })
                    .accentColor(.purple)
                
            }
            
            HStack {
                
                Text("\(Int(minAmount))")
                
                Spacer()
                
                Text("\(Int(maxAmount))")
                
            }
            .font(.system(.footnote, design: .rounded))
        }
    }
}

struct LoanFilterView_Previews: PreviewProvider {
    static var previews: some View {
        LoanFilterView()
            .environmentObject(LoanViewModel())
    }
}
