//
//  AnyTransition.swift
//  HeroAnimations
//
//  Created by Viktor Shurapov on 9/25/20.
//

import SwiftUI

extension AnyTransition {
    static var polygonTriangle: AnyTransition {
        AnyTransition.modifier(
            active: PolygonModifier(sides: 30, opacity: 0),
            identity: PolygonModifier(sides: 3, opacity: 1)
        )
    }

    static var polygonCircle: AnyTransition {
        AnyTransition.modifier(
            active: PolygonModifier(sides: 3, opacity: 0),
            identity: PolygonModifier(sides: 30, opacity: 1)
        )
    }

    struct PolygonModifier: AnimatableModifier {
        var sides, opacity: Double
        
        var animatableData: Double {
            get { sides }
            set { sides = newValue }
        }
        
        func body(content: Content) -> some View {
            return content
                .environment(\.polygonSides, sides)
                .opacity(opacity)
        }
    }
}
