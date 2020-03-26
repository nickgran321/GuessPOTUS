//
//  ContentView.swift
//  PresidentsTimePeriods
//
//  Created by Nicholas Grant on 3/23/20.
//  Copyright © 2020 nicholasgrant. All rights reserved.
//

import SwiftUI

struct BottomBar: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.blue
    }
    
    var body: some View {
        TabView {
            FirstPeriod().tabItem {
                Image(systemName: "person")
                Text("1789-1849")
            }.tag(1)
            
            SecondPeriod().tabItem {
                Image(systemName: "person")
                Text("1849-1889")
            }.tag(2)
            
            ThirdPeriod().tabItem {
                Image(systemName: "person")
                Text("1889-1961")
                
            }.tag(3)
            
            FourthPeriod().tabItem {
                Image(systemName: "person")
                Text("1961-2017")
                
            }.tag(4)
            
            AllPeriods().tabItem {
                Image(systemName: "person")
                Text("1789-2017")
                
            }.tag(5)
        }
        .accentColor(.white)
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
