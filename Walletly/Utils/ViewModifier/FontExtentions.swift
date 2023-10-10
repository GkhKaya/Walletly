//
//  FontExtentions.swift
//  Walletly
//
//  Created by Gokhan Kaya on 4.10.2023.
//

import Foundation
import SwiftUI

struct LargeTitleModifier : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Bold", size: FontSizes.large))
    }
}

struct ButtonTitle : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Bold", size: FontSizes.normal))
    }
}

struct BoldNormalTitle : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Bold", size: FontSizes.normal))
    }
}

struct MediumNormalTitle : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.custom("HelveticaNeue-Regular", size: FontSizes.normal))
    }
}

