//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Nathan Albe on 8/5/23.
//

import SwiftUI
import Kingfisher
import Firebase

struct FeedCell: View {
    
    let post: Post
    let user: User
    let onLikeTapped: () -> Void
    
    var body: some View {
        VStack {
            // image with username
            NavigationStack {
                HStack {
                    if let user = post.user {
                        NavigationLink(destination: ProfileView(user: user), label: {
                            CircularProfileImageView(user: user, size: .xSmall); Text(user.username)
                                .font(.footnote)
                                .fontWeight(.semibold)
                        })
                    }
                    
                    Spacer()
                    
                }
                .padding(.leading, 10)
            }
            
            // post image
            
            KFImage(URL(string: post.imageUrl)!)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            //action buttons
            HStack(spacing: 16) {
                Button {
                    onLikeTapped()
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                        .symbolVariant(post.liked?.contains(user.id) ?? false ? .fill : .none)
                        .foregroundColor(post.liked?.contains(user.id) ?? false ? Color(.systemRed) : .primary)
                }
                
                Button {
                    print("Comment on post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    print("Share post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
                
            }
            .padding(.leading, 10)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            // likes label
            
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            // caption label
            NavigationStack {
                HStack {
                    NavigationLink(destination: ProfileView(user: user), label: {
                        Text("\(post.user?.username ?? "") ").fontWeight(.semibold) +
                        Text(post.caption)
                    })
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .padding(.leading, 10)
                .padding(.top, 1)
            }
            
            Text(post.timestamp.dateValue().elapsedTime())
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray)
                .padding(.leading, 10)
                .padding(.top, 1)
            
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POST[0], user: User.MOCK_USERS[0]) {
            print("On Like Tapped")
        }
    }
}
