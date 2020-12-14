//
//  ColorView.swift
//  colorPicker
//
//  Created by vitasiy on 15.12.2020.
//

import SwiftUI

struct ColorView: View {
    let color: UIColor
    
    var body: some View {
        Color(color)
            .frame(width: 350, height: 200)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.black, lineWidth: 5))
            
    }
}

struct LightView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(color: .green)
    }
}
