//
//  ContentView.swift
//  Calculator App
//
//  Created by Martin Bock on 21.12.21.
//

import SwiftUI
import Combine

struct CustomeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 20, idealWidth: 30, maxWidth: 30, minHeight: 20, alignment: .center)
            .padding(.all)
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .cornerRadius(20)
            .scaledToFill()

    }
}

struct ContentView: View {
    @State private var calculationText = ""
    @State private var result = ""
    let spaceBetween = 5.0
    
    func checkChar(_ char: Substring) -> Bool {
        ".+-/*".contains(char)
    }
    
    func checkForDot(_ string: String) -> Bool {
        if string.suffix(1) == "." {
            if !string.isEmpty {
                
            var stringhelp = string
            stringhelp.removeLast()
            
            let i = stringhelp.lastIndex(where: {$0 == "."})
                if i != nil {
                    let substring = stringhelp.suffix(from: i!)
                    let charset = CharacterSet(charactersIn: "/*+-")
                    if substring.rangeOfCharacter(from: charset) != nil {
                        return false
                    } else {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func firstCalc (string: String, char: Character) -> String {
        let index = string.firstIndex(of: char)!
        let firstPart = string[..<index]
        return String(firstPart)
    }
    
    func secondCalc (string: String, char: Character) -> String {
        let index = string.firstIndex(of: char)!
        var secondPart = string[index...]
        secondPart.removeFirst()
        return String(secondPart)
    }
    
    func calculate(_ string: String) -> Double {
        if string.contains("+") {
            return calculate(firstCalc(string: string, char: "+")) + calculate(secondCalc(string: string, char: "+"))
        }
        else if string.contains("-") {
            return calculate(firstCalc(string: string, char: "-")) - calculate(secondCalc(string: string, char: "-"))
        }
        else if string.contains("*") {
            return calculate(firstCalc(string: string, char: "*")) * calculate(secondCalc(string: string, char: "*"))
        }
        else if string.contains("/") {
            return calculate(firstCalc(string: string, char: "/")) / calculate(secondCalc(string: string, char: "/"))
        }
        else {
            return Double(string)!
        }
    }

       var body: some View {
           VStack{
           Text("Calculator")
           Spacer()
           
               TextField("Calculation", text: $calculationText)
                   .keyboardType(.default)
                   .onReceive(Just(calculationText)) { newValue in
                       var filtered = newValue.filter { "0123456789.+-*/".contains($0) }
                       if filtered.count == 1 && ".+-*/".contains(filtered){
                           filtered = ""
                       }
                       if filtered.count >= 2 {
                       let lastTwoChars = filtered.suffix(_:2)
                           if checkChar(lastTwoChars.prefix(1)) && checkChar(lastTwoChars.suffix(1)) {
                               filtered.removeLast(2)
                               filtered += lastTwoChars.suffix(1)
                           }
                       }
                       if checkForDot(filtered) {
                           filtered.removeLast()
                       }
                       if filtered != newValue {
                           self.calculationText = filtered
                       }
                            
                       if !filtered.isEmpty && !"+-*/.".contains(filtered.last!) {
                           print(calculate(filtered))
                           result = String(calculate(filtered))
                       }
                       if calculationText.isEmpty {
                           result = ""
                       }
                       
               }
               HStack {
                   Text("Result: ")
                   Text(result)
               }
           
               VStack(spacing: spaceBetween) {
                   HStack(spacing: spaceBetween) {
                       ForEach(1..<4) { number in
                           Button(String(number)) {
                               calculationText += String(number)
                           }
                           .buttonStyle(CustomeButton())
                       }
                       Button("+") {
                           calculationText += "+"
                       }
                       .buttonStyle(CustomeButton())
                   }
                   HStack(spacing: spaceBetween) {
                       ForEach(4..<7) { number in
                           Button(String(number)) {
                               calculationText += String(number)
                           }
                           .buttonStyle(CustomeButton())
                       }
                       Button("-") {
                           calculationText += "-"
                       }
                       .buttonStyle(CustomeButton())
                   }
                   HStack(spacing: spaceBetween) {
                       ForEach(7..<10) { number in
                           Button(String(number)) {
                               calculationText += String(number)
                           }
                           .buttonStyle(CustomeButton())
                       }
                       Button("*") {
                           calculationText += "*"
                       }
                       .buttonStyle(CustomeButton())
                   }
                   HStack(spacing: spaceBetween) {

                       Button("C"){
                           calculationText = ""
                       }
                       .buttonStyle(CustomeButton())
               
                       Button("0") {
                           calculationText += "0"
                       }
                       .buttonStyle(CustomeButton())
                
                       Button(".") {
                           calculationText += "."
                       }
                       .buttonStyle(CustomeButton())
                       Button("/") {
                           calculationText += "/"
                       }
                       .buttonStyle(CustomeButton())
                   }
               }
               Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
