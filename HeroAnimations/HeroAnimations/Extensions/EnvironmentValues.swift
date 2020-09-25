//
//  EnvironmentValues.swift
//  HeroAnimations
//
//  Created by Viktor Shurapov on 9/25/20.
//

import SwiftUI

extension EnvironmentValues {
    var polygonSides: Double {
        get { return self[PolygonSidesKey.self] }
        set { self[PolygonSidesKey.self] = newValue }
    }
}

public struct PolygonSidesKey: EnvironmentKey {
    public static let defaultValue: Double = 4
}
