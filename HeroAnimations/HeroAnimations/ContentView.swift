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
                VStack {
                    Polygon(color: Color.green)
                        .matchedGeometryEffect(id: "geoeffect1", in: nspace)
                        .frame(width: 200, height: 200)
                }
                .transition(.polygonTriangle)
            }
            
            Spacer()
            
            Button("Switch") { withAnimation(.easeInOut(duration: 2.0)) { flag.toggle() } }
            
            Spacer()

            if !flag {
                VStack {
                    Polygon(color: Color.blue)
                        .matchedGeometryEffect(id: "geoeffect1", in: nspace)
                        .frame(width: 200, height: 200)
                }
                .transition(.polygonCircle)
            }
        }
        .padding(50)
        .frame(width: 400)
        .border(Color.gray, width: 3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
