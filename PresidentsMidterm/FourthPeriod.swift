//
//  FourthPeriod.swift
//  PresidentsTimePeriods
//
//  Created by Nicholas Grant on 3/23/20.
//  Copyright © 2020 nicholasgrant. All rights reserved.
//

import SwiftUI

struct FourthPeriod: View {
    
    @State var showScore = false
    @State var presidentNumber =  1
    @State var scoreTitle = ""
    @State var alertMessage = ""
    
    @State var presidents  = ["Dwight D. Eisenhower", "John F. Kennedy", "Lyndon B. Johnson", "Richard M. Nixon", "Gerald R. Ford", "Ronald Reagan", "George H. W. Bush", "Bill Clinton", "George W. Bush", "Barack Obama", "Donald Trump"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    @State var score = UserDefaults.standard.integer(forKey: "ScoreFourthPeriod")
    @State var rotation = 1
    @State var selectedCorrectPresident = true
    @State var showListScreen = false
    @State var userLevel = UserDefaults.standard.integer(forKey: "LevelFourthPeriod")
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.red, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Text("Tap the portrait of")
                        .foregroundColor(.white)
                        .padding(.top, 8)
                        .font(.custom("American Typewriter", size: 20))
                    
                    Text(presidents[correctAnswer])
                        .padding(.top, 5)
                        .foregroundColor(.white)
                        .font(.custom("American Typewriter", size: 30))
                    
                }
                ForEach(0  ..< 3) { number in
                    Button(action: {
                        
                        if self.selectedCorrectPresident {
                            withAnimation(.interpolatingSpring(mass: 40, stiffness: 500, damping: 200, initialVelocity: 2.2)) {
                                self.rotation += 360
                            }
                        }
                        self.presidentTapped(number)
                    }) {
                        Image(self.presidents[number])
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 155, height: 200)
                            .clipShape(Capsule())
                            .overlay(Capsule()
                                .stroke(Color.black,
                                        lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                        
                    .rotation3DEffect(.degrees((number == self.correctAnswer) ? Double(self.rotation) : 0), axis: (x: 1, y: 0, z: 0))
                    
                }.frame(minWidth: 0, maxWidth: 600, minHeight: 0, maxHeight: 400)
                    .padding(.leading)
                    .padding(.trailing)
                
                HStack {
                    
                    Text("Points: \(score)")
                        .font(.custom("American Typewriter", size: 15))
                        .foregroundColor(.white)
                        .frame(width: 80, height: 20, alignment: .leading)
                        .padding(.top, 3)
                        .padding(.bottom, 3)
                        .padding(.trailing)
                        .padding(.leading)
                        .background(Color.red)
                        .cornerRadius(15)
                        .shadow(color: .black, radius: 2)
                    
                    Spacer()
                    
                    Text("Level: \(userLevel)")
                        .font(.custom("American Typewriter", size: 15))
                        .foregroundColor(.white)
                        .frame(width: 80, height: 20, alignment: .leading)
                        .padding(.top, 3)
                        .padding(.bottom, 3)
                        .padding(.trailing)
                        .padding(.leading)
                        .background(Color.red)
                        .cornerRadius(15)
                        .shadow(color: .black, radius: 2)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        self.showListScreen.toggle()
                    }, label: {
                        Image(systemName: "rectangle.stack.person.crop")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.gray)
                            .clipShape(Circle())
                            .shadow(color: .black, radius: 3)
                        
                    }).sheet(isPresented: $showListScreen, content: { ListScreen() })
                }
                .padding(.leading)
                .padding(.trailing)
                
                Spacer()
            }
        }
        .alert(isPresented: $showScore) {
            Alert(title: Text(scoreTitle), message: Text(alertMessage), dismissButton: .default(Text("CONTINUE")) {
                self.askQuestion()
                })
        }
    }
    
    func presidentTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!✅ +30 points"
            alertMessage = "That's the portrait of \(presidents[number])"
            score += 30
            UserDefaults.standard.set(self.score, forKey: "ScoreFourthPeriod")
            
            if score >= 300 {
                userLevel += 1
                UserDefaults.standard.set(self.score, forKey: "ScoreFourthPeriod")
                score = 0
                UserDefaults.standard.set(self.score, forKey: "ScoreFourthPeriod")
            }
            
        } else {
            scoreTitle = "Wrong!🛑 -15 points"
            alertMessage = "That's the portrait of \(presidents[number])"
            score -= 15
            UserDefaults.standard.set(self.score, forKey: "ScoreFourthPeriod")
        }
        
        showScore = true
    }
    
    func askQuestion() {
        presidents.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}


struct FourthPeriod_Previews: PreviewProvider {
    static var previews: some View {
        FourthPeriod()
    }
}
