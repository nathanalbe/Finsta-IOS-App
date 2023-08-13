//
//  UserStatView.swift
//  InstagramClone
//
//  Created by Nathan Albe on 8/5/23.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 10, title: "Posts")
    }
}
