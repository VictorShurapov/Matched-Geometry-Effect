//
//  Polygon.swift
//  HeroAnimations
//
//  Created by Viktor Shurapov on 9/25/20.
//

import SwiftUI

struct Polygon: View {
    @Environment(\.polygonSides) var sides: Double
    let color: Color
    
    var body: some View {
        Group {
            if sides >= 30 {
                Circle()
                    .stroke(color, lineWidth: 10)
            } else {
                PolygonShape(sides: sides)
                    .stroke(color, lineWidth: 10)
            }
        }
    }
    
    struct PolygonShape: Shape {
        var sides: Double
        
        func path(in rect: CGRect) -> Path {
            let h = Double(min(rect.size.width, rect.size.height)) / 2.0
            let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
            var path = Path()
            let extra: Int = Double(sides) != Double(Int(sides)) ? 1 : 0
            
            for i in 0..<Int(sides) + extra {
                let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180
                
                let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
                
                if i == 0 {
                    path.move(to: pt) // move to first vertex
                } else {
                    path.addLine(to: pt) // draw line to next vertex
                }
            }
            
            path.closeSubpath()
            
            return path
        }
    }
}
