//
//  Slider.swift
//  colorPicker
//
//  Created by vitasiy on 14.12.2020.
//

import SwiftUI

struct Slider: View {
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

    struct Slider_Previews: PreviewProvider {
        static var previews: some View {
            Slider(value: con, textColor: .red)
        }
    }
