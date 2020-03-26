//
//  ListDetailView.swift
//  PresidentsTimePeriods
//
//  Created by Nicholas Grant on 3/23/20.
//  Copyright © 2020 nicholasgrant. All rights reserved.
//

import SwiftUI

struct ListDetailView: View {
    
    var item: ListElement
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(item.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }.frame(minWidth: 0, maxWidth: .infinity)
                Image(item.image)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                
                Text(item.text)
                    .padding(.horizontal, 20)
            }
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(item: ListElement(icon: "", image: "", title: "", text: ""))
    }
}
