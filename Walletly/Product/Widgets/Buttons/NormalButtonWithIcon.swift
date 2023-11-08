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
    var imageLeadingPadding: CGFloat
    var textLeadingPadding : CGFloat
    var body: some View {
            Button{
                onTap()
            }label: {

                HStack(alignment: .center){
                    Spacer()
                    Image(iconName)
                        .frame(width: width,height: height)
                        .padding()
                        .padding(.leading,imageLeadingPadding)
                    
                    Text(title.locale())
                        .tint(textColor)
                        .modifier(BoldNormalTitle())
                        .padding(.leading,textLeadingPadding)
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
        
    }, title: LocalKeys.Auth.signInWithFacebook.rawValue, iconName: ProjectImages.GeneralImages.icFacebook.rawValue,backgroundColor: Color.blue,textColor: Color.white,width: 0.5,height: 0.5,imageLeadingPadding: 6,textLeadingPadding: 6)
}
