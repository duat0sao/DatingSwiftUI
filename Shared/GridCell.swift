//
//  GridCell.swift
//  DatingSwiftUI
//
//  Created by Mobile World on 10/19/21.
//

import SwiftUI

struct GridCell: View {
  var person: Person
    @State private var isShowingDetails = false
    
  var body: some View {
    AsyncImage(
        url: URL(string: person.image),
               content: { image in
        image.resizable()
            .scaledToFit()
            .cornerRadius(15)
            .overlay(TextOverlay(name: person.name), alignment: .bottomLeading)
            .padding([.horizontal, .top], 7)
            .gesture(TapGesture().onEnded({ _ in
                isShowingDetails.toggle()
            }))
            
    },placeholder: {
        VStack {
            ProgressView()
        }.frame(width: UIScreen.main.bounds.size.width / 3 , height: UIScreen.main.bounds.size.width / 3, alignment: .center)
    })
    .fullScreenCover(isPresented: $isShowingDetails) {
        DetailsView(person: person)
    }
  }
}

struct TextOverlay: View {
    var name: String
    var body: some View {
        Spacer()
        HStack {
            Text(name).foregroundColor(.white).padding([.leading],7)
            Text("•").font(.system(size: 30)).foregroundColor(.yellow)
            Spacer()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.black.opacity(0),.black.opacity(1)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.vertical)
        ).cornerRadius(radius: 15, corners: [.bottomLeft, .bottomRight])
            
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}
