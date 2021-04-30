//
//  ContentView.swift
//  tempetureConversion
//
//  Created by Eya Nasri on 30/4/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = 1
    @State private var outputUnit = 1
    @State private var inputValue = ""
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    
    var outputValue : Double{
        
        //let inputUnit = units[inputUnit]
        //let outputUnit = units[outputUnit]
        let inputValue = Double(inputValue) ?? 0
        
        var middleTempeture = 0.0
        
        var finalTempeture = 0.0
        
        if (inputUnit == 0){
            middleTempeture = (inputValue * 9/5) + 32
        }
        
        else if (inputUnit == 2){
            middleTempeture = (inputValue - 273.15) * 9/5 + 32
        }
        else {
            middleTempeture = inputValue
        }
        
        
        if (outputUnit == 0){
            finalTempeture = (middleTempeture - 32) * 5/9
        }
        
        else if (outputUnit == 2){
            finalTempeture = (middleTempeture - 32) * 5/9 + 273.15
        }
        else {
            finalTempeture = middleTempeture
        }
        
        return finalTempeture
        
    }
    

    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("input unit")){
                    Picker("input unit", selection: $inputUnit){
                        ForEach(0 ..< units.count){
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }.textCase(nil)
                
                
                Section(header: Text("output unit")){
                    Picker("output unit", selection: $outputUnit){
                        ForEach(0 ..< units.count){
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }.textCase(nil)
                
                
                Section(header: Text("the tempeture to change")){
                    TextField("intput tempeture", text: $inputValue)
                        .keyboardType(.decimalPad)
                }.textCase(nil)
                
                
                Section(header: Text("output tempeture")){
                    Text("\(outputValue, specifier: "%.2f")°")
                }.textCase(nil)

            }.navigationBarTitle("Tempature Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
