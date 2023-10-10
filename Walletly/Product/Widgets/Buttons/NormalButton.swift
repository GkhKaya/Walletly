//
//  NormalButton.swift
//  Walletly
//
//  Created by Gokhan Kaya on 4.10.2023.
//

import SwiftUI

struct NormalButton: View {
    var onTap: () -> Void
    var title : String
    var body: some View {
        Button{
            onTap()
        }label: {
            HStack{
                Spacer()
                Text(title.locale())
                    .tint(.black)
                    .modifier(BoldNormalTitle())
                    .padding(.all,ProjectPaddings.All.normal.rawValue)
                Spacer()
                
            }
            
                .buttonBorderShape(.roundedRectangle)
                .controlSize(.large)
                .background(Color.orange)
                .cornerRadius(ProjectRadius.smallRadius)
            
            
        }
        
    }
    
    struct NormalButton_Previews: PreviewProvider {
        static var previews: some View {
            NormalButton(onTap: {
                
            }, title: LocalKeys.Auth.signIn.rawValue)
        }
    }
}
