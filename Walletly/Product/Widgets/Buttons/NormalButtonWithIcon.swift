//
//  NormalButtonWithIcon.swift
//  Walletly
//
//  Created by Gokhan Kaya on 25.10.2023.
//

import SwiftUI

struct NormalButtonWithIcon: View {
    var onTap: () -> Void
    var title: String
    var iconName : String
    var backgroundColor : Color
    var textColor : Color
    var width: CGFloat
    var height : CGFloat
    var body: some View {
            Button{
                onTap()
            }label: {
                HStack(alignment: .center){
                    Image(iconName)
                        .frame(width: width,height: height)
                        .padding()
                    Text(title.locale())
                        .tint(textColor)
                        .modifier(BoldNormalTitle())
                    Spacer()
                }
                
                .buttonBorderShape(.roundedRectangle)
                .background(backgroundColor)
                .cornerRadius(ProjectRadius.smallRadius)

        }
    }
}

#Preview {
    NormalButtonWithIcon(onTap: {
        
    }, title: LocalKeys.Auth.signInWithGoogle.rawValue, iconName: ProjectImages.GeneralImages.icGoogle.rawValue,backgroundColor: Color.blue,textColor: Color.white,width: 0.5,height: 0.5)
}
