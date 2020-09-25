//
//  ContentView.swift
//  HeroAnimations
//
//  Created by Viktor Shurapov on 9/25/20.
//

import SwiftUI

struct ContentView: View {
    
    @Namespace var nspace
    @State private var flag: Bool = true
    
    var body: some View {
        HStack {
            if flag {
                Rectangle().fill(Color.green)
                    .matchedGeometryEffect(id: "geoeffect1", in: nspace)
                    .frame(width: 100, height: 100)
            }
            
            Spacer()
            
            Button("Magic Switch") { withAnimation(.easeInOut(duration: 2.0)) {
            self.flag.toggle() }}
            
            Spacer()
            
            VStack {
                Rectangle().fill(Color.yellow).frame(width: 50, height: 50)
                
                if !flag {
                    Circle()
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: "geoeffect1", in: nspace)
                        .frame(width: 50, height: 50)
                        .border(Color.black)
                        .zIndex(1)
                }
                
                Rectangle().fill(Color.yellow).frame(width: 50, height: 50)
            }
        }
        .frame(width: 300)
        .padding(10)
        .border(Color.gray, width: 3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
