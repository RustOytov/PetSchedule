//
//  Extensions.swift
//  PetSchedule
//
//  Created by Polaroytov on 1/21/26.
//

import SwiftUI

enum AppFontWeight: String {
    case black = "Blak"
    case bold = "Bold"
    case medium = "Medium"
    case regular = "Regular"
}

extension Font {
    static func alegreya(weight: AppFontWeight, size: CGFloat) -> Font {
        return .custom("AlegreyaSC-\(weight).ttf", size: size)
    }
}
