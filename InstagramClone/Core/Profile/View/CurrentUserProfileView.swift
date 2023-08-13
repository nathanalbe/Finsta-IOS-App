//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Nathan Albe on 8/8/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    @State private var isSignoutViewPresented = false
    
    var body: some View {
        NavigationStack {
            ProfileView(user: user)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isSignoutViewPresented.toggle()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.primary)
                        }
                    }
                }
        }
        .sheet(isPresented: $isSignoutViewPresented, content: {
            SignoutView(isPresented: $isSignoutViewPresented)
        })
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[1])
    }
}
