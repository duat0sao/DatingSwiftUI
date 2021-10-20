//
//  DiscoverView.swift
//  DatingSwiftUI
//
//  Created by Mobile World on 10/19/21.
//

import SwiftUI
import QGrid

struct DiscoverView: View {
    var people = [
        Person(name: "Elise", image: "https://i.pravatar.cc/500?img=1"),
        Person(
            name:"Haley", image: "https://i.pravatar.cc/500?img=2"),
        Person(
            name:"Elinora", image: "https://i.pravatar.cc/500?img=5")
        ,
        Person(
            name:"Martine", image: "https://i.pravatar.cc/500?img=9"),
        Person(name:"Mie",
            image: "https://i.pravatar.cc/500?img=10"),
        Person(name:"Angelina",
            image: "https://i.pravatar.cc/500?img=16"),
        Person(name:"Sara",
            image: "https://i.pravatar.cc/500?img=19"),
        Person(name:"Frida",
            image: "https://i.pravatar.cc/500?img=20"),
        Person(name:"Kari",
            image: "https://i.pravatar.cc/500?img=21"),
        Person(name:"Mirana",
            image: "https://i.pravatar.cc/500?img=49"),
        Person(name:"Mia",
            image: "https://i.pravatar.cc/500?img=23"),
        Person(name:"Nora",
            image: "https://i.pravatar.cc/500?img=24")
        ,
        Person(name:"Maya",
            image: "https://i.pravatar.cc/500?img=25")
        ,
        Person(name:"Oliva",
            image: "https://i.pravatar.cc/500?img=26")
        ,
        Person(name:"Emma",
            image: "https://i.pravatar.cc/500?img=27")
        ,
        Person(name:"Ava",
            image: "https://i.pravatar.cc/500?img=28")
        ,
        Person(name:"Charlotte",
            image: "https://i.pravatar.cc/500?img=29")
        ,
        Person(name:"Sophia",
            image: "https://i.pravatar.cc/500?img=30")
        ,
        Person(name:"Amelia",
            image: "https://i.pravatar.cc/500?img=31")
        ,
        Person(name:"Isabella",
            image: "https://i.pravatar.cc/500?img=32")
        ,
        Person(name:"Evelyn",
            image: "https://i.pravatar.cc/500?img=34")
        ,
        Person(name:"Harper",
            image: "https://i.pravatar.cc/500?img=34")
        ,
        Person(name:"Camila",
            image: "https://i.pravatar.cc/500?img=35")
        ,
        Person(name:"Gianna",
            image: "https://i.pravatar.cc/500?img=36")
        ,
        Person(name:"Abigail",
            image: "https://i.pravatar.cc/500?img=37")
        ,
        Person(name:"Luna",
            image: "https://i.pravatar.cc/500?img=38")
        ,
        Person(name:"Ella",
            image: "https://i.pravatar.cc/500?img=39")
        ,
        Person(name:"Elizabeth",
            image: "https://i.pravatar.cc/500?img=40")
        ,
        Person(name:"Sofia",
            image: "https://i.pravatar.cc/500?img=41")
        ,
        Person(name:"Emily",
            image: "https://i.pravatar.cc/500?img=42"),
        Person(name:"Avery",
            image: "https://i.pravatar.cc/500?img=43")
        ,
        Person(name:"Scarlett",
            image: "https://i.pravatar.cc/500?img=44")
        ,
        Person(name:"Eleanor",
            image: "https://i.pravatar.cc/500?img=45")
        ,
        Person(name:"Madison",
            image: "https://i.pravatar.cc/500?img=46")
        ,
        Person(name:"Layla",
            image: "https://i.pravatar.cc/500?img=47")
        ,
        Person(name:"Penelope",
            image: "https://i.pravatar.cc/500?img=48"),
    ]
    
    @State private var maxDistance = 40.0
    @State private var age = 25.0
    @State private var isEditing = false
    @State private var isShowingSheet = false
    @State private var isShowingDetails = false

    var body: some View {
        VStack {
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button("NEARBY") {
                            print("Button tapped!")
                        }.foregroundColor(.secondary).padding([.leading, .trailing], 10)
                        Button("DISCOVERY") {
                            print("Button tapped!")
                        }.foregroundColor(.secondary).padding([.leading, .trailing], 10)
                        Button("NEW") {
                            print("Button tapped!")
                        }.foregroundColor(.secondary).padding([.leading, .trailing], 10)
                        Button("NEARBY") {
                            print("Button tapped!")
                        }.foregroundColor(.secondary).padding([.leading, .trailing], 10)
                        Button("DISCOVERY") {
                            print("Button tapped!")
                        }.foregroundColor(.secondary).padding([.leading, .trailing], 10)
                        Button("NEW") {
                            print("Button tapped!")
                        }.foregroundColor(.secondary).padding([.leading, .trailing], 10)
                    }
                }
                Button(action: {
                    isShowingSheet.toggle()
                }, label: {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                })
            }
            QGrid(people, columns: 3) { GridCell(person: $0) }
        }
        .padding([.leading, .trailing], 10)
        .sheet(isPresented: $isShowingSheet, onDismiss: didDismiss) {
            GeometryReader { geometry in
                BottomSheetView(
                    isOpen: self.$isShowingSheet,
                    maxHeight: 320
                ) {
                    VStack {
                        HStack {
                            Text("Maximum distance, km")
                            Spacer()
                            Text("\(Int(round(maxDistance)))")
                        }
                        Slider(
                            value: $maxDistance,
                            in: 0...100,
                            onEditingChanged: { editing in
                                isEditing = editing
                            }
                        )
                        HStack {
                            Text("Age")
                            Spacer()
                            Text("\(Int(round(age)))")
                        }
                        Slider(
                            value: $age,
                            in: 18...80,
                            onEditingChanged: { editing in
                                isEditing = editing
                            }
                        ).padding([.bottom], 20)
                        Button {
                            isShowingSheet.toggle()
                        } label: {
                            HStack {
                                Spacer()
                                Text("DONE")
                                Spacer()
                            }
                        }
                        .foregroundColor(.white)
                        .padding(.all)
                        .background(Color.init(hex: 0xfc5363))
                        .cornerRadius(15)

                    }
                    .padding([.leading, .trailing], 20)
                }
            }.edgesIgnoringSafeArea(.all).background(BackgroundClearView())
        }
        
        
    }
    struct BackgroundClearView: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            let view = UIView()
            DispatchQueue.main.async {
                view.superview?.superview?.backgroundColor = .clear
            }
            return view
        }

        func updateUIView(_ uiView: UIView, context: Context) {}
    }

    func didDismiss() {
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
