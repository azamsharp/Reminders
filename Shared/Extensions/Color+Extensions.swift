//
//  Color+Extensions.swift
//  Reminders
//
//  Created by Mohammad Azam on 2/17/22.
//

import SwiftUI

extension Color {
    
    var hex: String {
        
        var components: [CGFloat]?
        
        #if os(macOS)
            let nsColor = NSColor(self)
            components = nsColor.cgColor.components
        #elseif os(iOS)
            let uiColor = UIColor(self)
            components = uiColor.cgColor.components
        #endif 
        
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0
        
        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        
        return hexString
    }
    
    static func colorFromHex(_ hex: String) -> Color {
        
        var colorString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        colorString = colorString.replacingOccurrences(of: "#", with: "").uppercased()
        
        let alpha: CGFloat = 1.0
        let red: CGFloat = self.colorComponentFrom(colorString: colorString, start: 0, length: 2)
        let green: CGFloat = self.colorComponentFrom(colorString: colorString, start: 2, length: 2)
        let blue: CGFloat = self.colorComponentFrom(colorString: colorString, start: 4, length: 2)
        
        let cgColor = CGColor(red: red, green: green, blue: blue, alpha: alpha)
        return Color(cgColor)
    }
    
    static func colorComponentFrom(colorString: String, start: Int, length: Int) -> CGFloat {

        let startIndex = colorString.index(colorString.startIndex, offsetBy: start)
        let endIndex = colorString.index(startIndex, offsetBy: length)
        let subString = colorString[startIndex..<endIndex]
        let fullHexString = length == 2 ? subString : "\(subString)\(subString)"
        var hexComponent: UInt64 = 0
        
        guard Scanner(string: String(fullHexString)).scanHexInt64(&hexComponent) else {
            return 0
        }

        let hexFloat: CGFloat = CGFloat(hexComponent)
        let floatValue: CGFloat = CGFloat(hexFloat / 255.0)
        
        return floatValue
    }
    
}
