//
//  ListScreen.swift
//  PresidentsTimePeriods
//
//  Created by Nicholas Grant on 3/23/20.
//  Copyright © 2020 nicholasgrant. All rights reserved.
//

import SwiftUI

struct ListScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    struct HeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.primary)
                .padding(.bottom, 20)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
        }
    }
    
    struct TextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(.white)
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .padding(.bottom, 20)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
        }
    }
    
    let backgroundColor = Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 255.0 / 255.0)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            Group {
                VStack {
                    
                    Spacer()
                    
                    Text("Guess the Portraits")        .font(.custom("American Typewriter", size: 30))
                        .padding(10)
                        .foregroundColor(.white)
                    Text("Gain 30 points by picking the correct portrait! Each wrong answer is a loss of 15 points. If you have more than 300 points, you level up. Review them below. ").font(.custom("American Typewriter", size: 15))
                        .foregroundColor(.white)
                        .frame(width: 400)
                        .multilineTextAlignment(.center)
                    
                    NavigationView {
                        List(Service.listData) { item in
                            NavigationLink(destination: ListDetailView(item: item)) {
                                ListElementView(item: item)
                            }
                        }.navigationBarTitle("The Presidents")
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
