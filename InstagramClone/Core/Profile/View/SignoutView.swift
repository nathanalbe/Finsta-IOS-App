//
//  SignoutView.swift
//  InstagramClone
//
//  Created by Nathan Albe on 8/13/23.
//

import SwiftUI

struct SignoutView: View {
    @Binding var isPresented: Bool
    @State private var logout = false
    
    var body: some View {
        NavigationStack() {
            VStack() {
                Rectangle()
                    .frame(width: 40, height: 5)
                    .cornerRadius(2.5)
                    .foregroundColor(Color.gray)
                HStack() {
                    Image(systemName: "gear")
                        .frame(width: 40, height: 40)
                        .foregroundColor(.primary)
                    
                    NavigationLink(destination: LogoutView(isPresented: $isPresented), label: {
                        Text("Settings and Privacy")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(.primary)
                    })
                    Spacer()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(UIColor.systemBackground))
            .padding()
            .gesture(DragGesture().onEnded { value in
                if value.translation.height > 50 {
                    withAnimation {
                        isPresented = false
                    }
                }
            })
            Spacer()
        }
    }
}

struct SignoutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignoutView(isPresented: .constant(true))
        }
    }
}
