//
//  FeedView.swift
//  InstagramClone
//
//  Created by Nathan Albe on 8/5/23.
//

import SwiftUI

struct FeedView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var viewModel = FeedViewModel()
    
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(viewModel.posts) {post in
                        FeedCell(post: post, user: user) {
                            Task {
                                try await viewModel.toggleLike(postId: post.id, uid: user.id)
                            }
                        }
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(colorScheme == .light ? "instagram-black" : "instagram-white")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 32)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
            .onAppear {
                Task {
                    try await viewModel.fetchPosts()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(user: User.MOCK_USERS[0])
    }
}
