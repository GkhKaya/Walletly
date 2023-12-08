//
//  ProjectPadings.swift
//  Walletly
//
//  Created by Gokhan Kaya on 4.10.2023.
//

import Foundation

struct ProjectPaddings{
    enum All:Double{
        case extraSmall = 10
        case normal = 20
        case large = 30
    }
    enum Top:Double{
        case small = 16
        case normal = 30
        case veryLarge = 44
        case hugeLarge = 62
    }
    
    enum Bottom:Double{
        case extraSmall = 10
        case small = 16
        case normal = 30
        case veryLarge = 40
    }
    
    enum Horizontal: Double{
        case small = 10
    }
    
    enum Vertical: Double{
        case extraSmall = 16;
        case normal = 30
    }
    enum Leading : Double{
        case normal = 20
    }
    
    enum Trailing : Double{
        case normal = 20
        case hugeLarge  = 90
    }
}
