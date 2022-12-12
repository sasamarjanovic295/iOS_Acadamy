//
//  LoginView.swift
//  Birdy (iOS)
//
//  Created by Saša Marjanović on 12.12.2022..
//

import SwiftUI

struct LoginView: View {
    
    @Binding var username: String
    @Binding var isPresented: Bool
    
    var body: some View {
        
        VStack{
            Spacer()
            HStack{
                Image("crow")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                
                Text("Birdy")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading, 20)
            }
            
            TextField("Username", text: $username)
                .padding(.leading, 100)
                .padding(.trailing, 100)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
            
            Button(action: {
                isPresented = false
            }){
                Text("Log In")
            }
            
            Spacer()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: Binding.constant(""), isPresented: Binding.constant(true))
    }
}
