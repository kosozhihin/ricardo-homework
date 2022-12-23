//
//  CenteredScrollView.swift
//  ricardo-homework-swiftui
//
//  Created by Zsolt Kovacs on 24.09.22.
//

import SwiftUI

struct CenteredScrollView<Content>: View where Content: View {
    @ViewBuilder let content: Content

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                content
                    .frame(width: geometry.size.width)
                    .frame(minHeight: geometry.size.height)
            }
        }
    }

}

struct CenteredScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CenteredScrollView {
            Text("Content")
        }
    }
}
