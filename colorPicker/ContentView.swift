//
//  ContentView.swift
//  colorPicker
//
//  Created by vitasiy on 14.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    @State private var inputRedValue: String = ""
    @State private var inputGreenValue: String = ""
    @State private var inputBlueValue: String = ""
    
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            
            ColorView(color: UIColor(red: CGFloat(redSliderValue / 255),
                                     green: CGFloat(greenSliderValue / 255),
                                     blue: CGFloat(blueSliderValue / 255),
                                     alpha: 1))
                .padding(.bottom, 50)
                
            
            HStack {
                ColorSlider(value: $redSliderValue, textColor: .red)
                    .onChange(of: redSliderValue) { newValue in
                        inputRedValue = "\(lround(newValue))"
                    }
                
                TextField("\(lround(redSliderValue))", text: $inputRedValue)
                    .bordered()
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Wrong Format!"),
                              message: Text("Input number from 0 to 255!"))
                    }
                    .onChange(of: inputRedValue) { newValue in
                        ChackInputValue(newValue: newValue)
                        redSliderValue = Double(newValue) ?? 0.0
                    }
                
            }
            HStack {
                ColorSlider(value: $greenSliderValue, textColor: .green)
                    .onChange(of: greenSliderValue) { newValue in
                        inputGreenValue = "\(lround(newValue))"
                    }
                
                TextField("\(lround(greenSliderValue))", text: $inputGreenValue)
                    .bordered()
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Wrong Format!"),
                              message: Text("Input number from 0 to 255!"))
                    }
                    .onChange(of: inputGreenValue) { newValue in
                        ChackInputValue(newValue: newValue)
                        greenSliderValue = Double(newValue) ?? 0.0
                    }
                
            }
            HStack {
                ColorSlider(value: $blueSliderValue, textColor: .blue)
                    .onChange(of: blueSliderValue) { newValue in
                        inputBlueValue = "\(lround(newValue))"
                    }
                
                TextField("\(lround(blueSliderValue))", text: $inputBlueValue)
                    .bordered()
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Wrong Format!"),
                              message: Text("Input number from 0 to 255!"))
                    }
                    
                    .onChange(of: inputBlueValue) { newValue in
                        ChackInputValue(newValue: newValue)
                        blueSliderValue = Double(newValue) ?? 0.0
                    }
                
            }
            Spacer()
        }
        .padding(.top, 10.0)
        
        
    }
    
    private func ChackInputValue(newValue: String) {
        if (Double(newValue) == nil) {
            showAlert = true
            inputRedValue = ""
        }
    }
}


struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value, in: 0...255, step: 1)
            Text("255").foregroundColor(textColor)
        }
        .padding(.horizontal)
    }
}

struct BorderedVieweModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.trailing)
            .frame(minWidth: 50, idealWidth: 50, maxWidth: 50)
            .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
    }
}

extension View {
    func bordered() -> some View {
        ModifiedContent(content: self, modifier: BorderedVieweModifier())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
