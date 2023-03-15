//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Bukhari Sani on 14/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var computerPoints = 0
    @State var humanPoints = 0
    @State var computerImage = "Rock"
    @State var humanImage = "Rock"
    @State var totalPoints = 0
    @State var showingScore = false
    
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Text("Rock-Paper-Scissors")
                    .font(.system(size:30))
                    .bold()
                Spacer()
                
                
                VStack {
                    Spacer()
                    //Computer Points
                    Text("Points: \(computerPoints)")
                        .font(.system(size: 20))
                    
                    //Computer Image
                    Image(computerImage)
                    Spacer()
                    
                    //Player Image
                    Image(humanImage)
                        .onTapGesture {
                            let computerTap = Int.random(in: 1...3)
                            computerImage = imageGenerator(computerTap)
                            
                            let humanTap = Int.random(in: 1...3)
                            humanImage = imageGenerator(humanTap)
                            
                            pointCalculator(humanTap, computerTap)
                        }
                    
                    //Player Points
                    Text("Points: \(humanPoints)")
                        .font(.system(size: 20))
                    Spacer()
                }
            }
        }
        
        .alert(isPresented: $showingScore) {
            if totalPoints == 10 {
                return Alert(title: Text("Your final score is: \(humanPoints)"), message: nil, dismissButton: .default(Text("Restart"), action: restartGame))
            } else {
                return Alert(title: Text("Game over"), message: Text("Your final score is: \(humanPoints)"), dismissButton: .default(Text("Restart"), action: restartGame))
            }
        }
    }
    func imageGenerator(_ num: Int) -> String {
        if num == 1 {
            return "Rock"
        } else if num == 2 {
            return "Paper"
        } else if num == 3 {
            return "Scissors"
        }
        return ""
    }
    // 1 rock, 2 paper, 3 scissors.
    func pointCalculator(_ human: Int, _ computer: Int) {
        if human == 1 && computer == 2 {
            computerPoints = computerPoints + 1
        }
        if human == 1 && computer == 3 {
            humanPoints = humanPoints + 1
        }
        if human == 2 && computer == 1 {
            humanPoints = humanPoints + 1
        }
        if human == 2 && computer == 3 {
            computerPoints = computerPoints + 1
        }
        if human == 3 && computer == 1 {
            computerPoints = computerPoints + 1
        }
        if human == 3 && computer == 2 {
            humanPoints = humanPoints + 1
        }
    }
    
    func restartGame() {
        computerPoints = 0
        humanPoints = 0
        totalPoints = 0
        computerImage = "Rock"
        humanImage = "Rock"
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
