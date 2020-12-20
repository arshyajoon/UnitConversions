//
//  ContentView.swift
//  UnitConversions.swift
//
//  Created by Arshya GHAVAMI on 12/17/20.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    @State private var temperature = ""
    var results = 0
    
    var conversion: Double {
        let unitConversion = Double(temperature) ?? 0
        switch(inputUnit, outputUnit) {
        case(0,1):
            return unitConversion * 1.8 + 32
        case(0,2):
            return unitConversion + 273.15
        case(1,0):
            return (unitConversion - 32) * 1.8
        case(1,2):
            return (unitConversion - 32) * 1.8 + 273.15
        case(2,0):
            return unitConversion - 273.15
        case(2,1):
            return (unitConversion - 273.15) * 1.8 + 32
        default:
            return unitConversion
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
        Picker(selection: $inputUnit, label: Text("Choose the input unit")) {
            Text("Celsius").tag(0)
            Text("Fahrenhit").tag(1)
            Text("Kelvin").tag(2)
        }.pickerStyle(SegmentedPickerStyle())
        Picker(selection: $outputUnit, label: Text("Choose the output unit")) {
            Text("Celsius").tag(0)
            Text("Fahrenhit").tag(1)
            Text("Kelvin").tag(2)
        }.pickerStyle(SegmentedPickerStyle())
        TextField("Enter the temperature", text: $temperature).keyboardType(.numberPad).textFieldStyle(RoundedBorderTextFieldStyle())
        Text("\(conversion, specifier: "%.2f")")
            }
            .padding()
            .navigationBarTitle("Converting temperatures", displayMode: .inline)
        }
       
            
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
