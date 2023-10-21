//
//  ProjectPadings.swift
//  Walletly
//
//  Created by Gokhan Kaya on 4.10.2023.
//

import Foundation

struct ProjectPaddings{
    enum All:Double{
        case small = 10
        case normal = 20
        case large = 30
    }
    enum Top:Double{
        case small = 16
        case normal = 30
        case veryLarge = 40
    }
    
    enum Bottom:Double{
        case small = 16
        case normal = 30
        case veryLarge = 40
    }
    
    enum Horizontal: Double{
        case small = 11
    }
    
    enum Vertical: Double{
        case normal = 30
    }
}
