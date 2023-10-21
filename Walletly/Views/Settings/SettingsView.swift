//
//  SettingsView.swift
//  Walletly
//
//  Created by Gokhan Kaya on 19.10.2023.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel = SettingsViewViewModel()
    @State var ison: Bool = false
    @State var ison2: Bool = false
    @State var selectedItem :String = " "
    var body: some View {
        NavigationStack{
                VStack{
                    Spacer()
                    List{
                        Section(LocalKeys.Settings.interface.rawValue.locale()){
                          
                            Toggle(isOn: $ison) {
                                SettingsViewItem(title: LocalKeys.Settings.darkMode.rawValue.locale(), iconName: "moon.fill")
                            }
                            Toggle(isOn: $ison2){
                                SettingsViewItem(title: LocalKeys.Settings.notifications.rawValue.locale(), iconName: "bell.fill")
                            }
                        }
                        Section(LocalKeys.Settings.account.rawValue.locale()){
                            HStack{
                                NavigationLink{
                                    UpdateEmailView()
                                }label: {
                                    SettingsViewItem(title: LocalKeys.Settings.updateEmail.rawValue.locale(), iconName: "envelope.fill")
                                    
                                }
                                
                            }
                            
                            NavigationLink{
                                UpdateEmailView()
                            }label: {
                               
                                    SettingsViewItem(title: LocalKeys.Settings.updatePassword.rawValue.locale(), iconName: "lock.fill")
                                   
                                
                            }
                            
                            NavigationLink{
                                SignInView()
                            }label: {
                                SettingsViewItem(title: LocalKeys.Settings.signOut.rawValue.locale(), iconName: "person.fill.badge.minus").onTapGesture {
                                    Task{
                                        do{
                                            try await viewModel.signOut()
                                        }catch{
                                            print(error)
                                        }
                                    }
                                }
                            }
                            

                        }
                    }
                    Spacer()
                }.navigationTitle(LocalKeys.Settings.settings.rawValue.locale()).navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
            }
        }
    }


#Preview {
    SettingsView().ignoresSafeArea()
}
