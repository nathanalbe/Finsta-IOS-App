//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Nathan Albe on 8/8/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var showEditProfile = false
    @EnvironmentObject var viewModel: PostGridViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            //pic and status
            HStack {
                CircularProfileImageView(user: viewModel.user, size: .large)
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStatView(value: viewModel.postsCount, title: "Posts")
                    
                    UserStatView(value: 1, title: "Followers")
                    
                    UserStatView(value: 2, title: "Following")
                    
                }
            }
            .padding(.horizontal)
            
            //name and bio
            VStack(alignment:.leading, spacing: 4) {
                if let fullname = viewModel.user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                if let bio = viewModel.user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal)
            
            //action button
            
            Button {
                if viewModel.user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("follow user")
                }
            } label: {
                Text(viewModel.user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(viewModel.user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(viewModel.user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(viewModel.user.isCurrentUser ? .gray : .clear, lineWidth: 1))
            }

            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: viewModel.user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
