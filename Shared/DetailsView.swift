//
//  DetailsView.swift
//  DatingSwiftUI
//
//  Created by Mobile World on 10/20/21.
//

import SwiftUI

struct DetailsView: View {
    var person: Person?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            AsyncImage(
                url: URL(string: person!.image),
                       content: { image in
                           image.resizable()
                               .aspectRatio(contentMode: .fill)
                               .edgesIgnoringSafeArea(.all)
                               .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.height, alignment: .center)
            },placeholder: {
                VStack {
                    ProgressView()
                }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .center)
            })
            DetailOverlay(name: person!.name, presentationMode: _presentationMode)
            VStack {
                Spacer()
                LinearGradient(gradient: Gradient(colors: [.black.opacity(0),.black.opacity(1)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical).frame(width: UIScreen.main.bounds.width, height: 80, alignment: .bottom)
            }
        }
    }
}
struct DetailOverlay: View {
    var name: String
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark").resizable().foregroundColor(.white).frame(width: 25, height: 25, alignment: .center)
                }).padding([.top], 40).padding(.leading, 20)
                Spacer()
                Button(action: {
                    print("button clicked")
                }, label: {
                    Image(systemName: "heart").resizable().foregroundColor(.white).frame(width: 25, height: 25, alignment: .center)
                }).padding([.top], 40).padding(.trailing, 20)
            }
            Spacer()
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(name).foregroundColor(.white).font(.system(size: 30))
                        Spacer()
                        Button(action: {
                            print("button clicked")
                        }, label: {
                            Image(systemName: "heart").resizable().foregroundColor(.red).frame(width: 30, height: 30, alignment: .center)
                        })
                        Button(action: {
                            print("button clicked")
                        }, label: {
                            Image(systemName: "message").resizable().foregroundColor(.red).frame(width: 30, height: 30, alignment: .center)
                        }).padding([.trailing, .leading], 20)
                    }
                    HStack {
                        Image(systemName: "location").foregroundColor(.white)
                        Text("10 km away").foregroundColor(.white)
                    }.padding(.top, 10)
                    HStack {
                        Text("•").font(.system(size: 30)).foregroundColor(.yellow)
                        Text("Recently active").foregroundColor(.white)
                    }
                    Text("text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text ").foregroundColor(.white)
                }.padding([.leading, .trailing], 20).padding(.bottom, 30).padding(.top, UIScreen.main.bounds.height * 0.6)
            }
        }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .center)
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
