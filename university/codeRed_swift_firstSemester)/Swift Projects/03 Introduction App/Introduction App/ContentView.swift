//
//  ContentView.swift
//  Introduction App
//
//  Created by Martin Bock on 20.12.21.
//

import SwiftUI

struct AdaptiveStack<Content: View>: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
        }
    }
}

struct ContentStruct {
    let imageCircle: String
    let activity: String
    let location: String
    let date: String
}

struct ContentView: View {
    
    let contentCollection = [
        ContentStruct(imageCircle: "hiking", activity: "Hiking", location: "Habichtswald, Kassel", date: "2020"),
        ContentStruct(imageCircle: "forest", activity: "Photo Shooting", location: "Reinhardswald, Kassel", date: "2020"),
        ContentStruct(imageCircle: "kitesurfen", activity: "Kitesurfing", location: "Egypt, Hurgarda", date: "2019"),
        ContentStruct(imageCircle: "Portrait", activity: "School", location: "Herderschule Kassel", date: "2020"),
        ContentStruct(imageCircle: "wakeboarden", activity: "Wakeboarding", location: "Wakeport, Frankfurt", date: "2020"),
    ]
  
    @State private var i = 0
    @State private var slidervalue = 0.0
    @State private var bg = Color.white
    @State private var textred = Color.orange
    @State private var textblack = Color.black
        
    var body: some View {
        AdaptiveStack {
            
            Section(header: ListHeader(), footer: ListFooter(i: $i, slidervalue: $slidervalue, bg: $bg, textblack: $textblack)){
                
                VStack {
                    Spacer()
                
            
                    Text("Martin Bock")
                        .fontWeight(.bold)
                        .foregroundColor(textred)
                
                    
                    HStack {
                        Spacer()
                    
                        Button(action: {
                        i = (i == 0) ? 4 : (i - 1)
                        slidervalue = Double(i)
                        }, label: {
                        Image(systemName: "chevron.left").foregroundColor(textred)
                        })
                    
                        Spacer()
                    
                        Image(contentCollection[i].imageCircle)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200.0, height: 200.0)
                                .clipShape(Circle())
                    
                        Spacer()
                    
                        Button(action: {
                            i = (i == 4) ? 0 : (i + 1)
                            slidervalue = Double(i)
                        }, label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(textred)
                        })
                    
                        Spacer()
                    }
                    
                    Spacer()
                
                GroupBox{
                    VStack(alignment: .leading, spacing: 20){
                        Label(contentCollection[i].activity, systemImage: "waveform.path.ecg")
                        
                        Label(contentCollection[i].location, systemImage: "mappin.and.ellipse")
                        
                        Label(contentCollection[i].date, systemImage: "calendar")
                    }.frame(width: 200)
                }

                Spacer()
                }
                
            }
        }.background(bg)
    }
}


struct ListHeader: View {
    var body: some View {
       
        Text("Introduction App")
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
        
        
    }
}

struct ListFooter: View {
    
    @Binding var i:Int
    @Binding var slidervalue:Double
    @Binding var bg:Color
    @Binding var textblack:Color
    
    @State private var speed = 1.0
    @State private var colorMode = true
    
    func slide(_ change: Bool){
        if change == false {
            i = Int(slidervalue)
        }
    }
    
    var body: some View {
        HStack{
        
            Slider(
                value: $slidervalue,
                in: 0...4
                ) {
                    Text("Speed")
                }minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("4")
                }
                onEditingChanged: { editing in
                    slide(editing)
                }.foregroundColor(textblack)
            
            Image(systemName: colorMode ? "sun.max" : "moon")
                .foregroundColor(textblack)
            
            Toggle("",isOn: $colorMode)
                .labelsHidden()
                .onChange(of: colorMode) {
                    _colorMode in
                    bg = !_colorMode ? Color.black : Color.white
                    textblack = !_colorMode ? Color.white : Color.black
                }
                
        }
        .padding(15.0)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
