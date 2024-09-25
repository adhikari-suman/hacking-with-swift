//
//  ContentView.swift
//  Project-0001-WeSplit
//
//  Created by Suman Adhikari on 9/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var chequeAmount:Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Double = 0.0
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages: [Double] = [0.10, 0.15, 0.20, 0.25, 0]
    
     private var totalPerPerson: Double {
         let peopleCount = Double(numberOfPeople)
         let tipSelection = tipPercentage
         
         let tipValue = chequeAmount * tipSelection
         let grandTotal = chequeAmount + tipValue
         let amountPerPerson = grandTotal / peopleCount
         
         return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("Amount",value: $chequeAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100, id: \.self){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(Array(stride(from: 0.0, through: 1.0, by: 0.01)), id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
