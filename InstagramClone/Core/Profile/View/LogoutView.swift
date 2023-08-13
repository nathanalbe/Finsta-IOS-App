//
//  LogoutView.swift
//  InstagramClone
//
//  Created by Nathan Albe on 8/13/23.
//

import SwiftUI

struct LogoutView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Log Out")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Are you sure you want to log out?")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Button(action: {
                AuthService.shared.signOut()
                withAnimation {
                    isPresented = false
                }
            }) {
                Text("Confirm Log Out")
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding()
        .navigationBarTitle("Settings and Privacy", displayMode: .inline)
    }
}

struct LogoutView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutView(isPresented: .constant(true))
    }
}
