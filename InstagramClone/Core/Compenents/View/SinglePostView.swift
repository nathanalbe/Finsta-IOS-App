//
//  SinglePostView.swift
//  InstagramClone
//
//  Created by Nathan Albe on 8/12/23.
//

import SwiftUI

struct SinglePostView: View {
    @StateObject var viewModel = SinglePostViewModel()

    @EnvironmentObject var contentViewModel: ContentViewModel

    let postId: String
    
    var body: some View {
        VStack {
            if let post = viewModel.post {
                FeedCell(post: post, user: contentViewModel.currentUser!) {
                Task {
                    try await viewModel.toggleLike(uid: contentViewModel.currentUser!.id)
                }
            }
            Spacer()
            } else {
                ProgressView()
            }
        }
        .onAppear {
            Task {
                try await viewModel.fetchPostData(postId: postId)
            }
        }
    }
}

struct SinglePostView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePostView(postId: Post.MOCK_POST[0].id)
    }
}
