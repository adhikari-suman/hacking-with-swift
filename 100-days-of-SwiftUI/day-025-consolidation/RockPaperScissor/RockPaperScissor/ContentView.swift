//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Suman Adhikari on 9/27/24.
//

import SwiftUI

struct ContentView: View {

    var moves = ["🪨", "📄", "✂"]

    @State var playerScore = 0
    @State var cpuScore = 0

    @State var result: String?
    @State var isGameOver: Bool = false

    var body: some View {
        ZStack {

            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: .white, location: -1.6),
                    .init(color: .black, location: 2.5)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                Spacer()

                Text("Rock Paper Scissors")
                    .font(.largeTitle.weight(.bold))


                Spacer()
                Text(result ?? "Select a move to start the game.")

                Spacer()


                HStack(alignment: .center,spacing: 10) {
                    Spacer()

                    ForEach(Array(moves.enumerated()), id: \.element){ move, moveName in
                        Button() {
                            selectMove(move)
                        } label: {
                            Text(moveName)
                                .font(.system(size: 60))
                        }
                        .buttonStyle(.bordered)

                        Spacer()


                    }
                }
                .padding()

                Spacer()

                VStack (spacing: 10){
                    Text("Scores")
                        .font(.title.weight(.bold))

                    Text("Player: \(playerScore) CPU: \(cpuScore)")
                        .fontWeight(.bold)
                }

                Spacer()
                Spacer()
            }
                .foregroundStyle(.white)
        }
        .alert("Game Over", isPresented: $isGameOver) {
            Button("Play Again", role: .none) {
                resetGame()
            }
        } message: {
            if let result = result {
                Text(result)
            }
        }

    }

    func selectMove(_ move: Int) {
        let playerMove = move
        let cpuMove = Int.random(in: 0..<3)

        updateResults(playerMove: playerMove, cpuMove: cpuMove)
    }

    func updateResults(playerMove: Int, cpuMove: Int) {
        if isGameOver{
            return
        }

        if playerMove == cpuMove {

        } else if playerMove == 0 && cpuMove == 1 || playerMove == 1 && cpuMove == 2 || playerMove == 2 && cpuMove == 0 {
            cpuScore += 1
        } else if playerMove == 0 && cpuMove == 2 || playerMove == 1 && cpuMove == 0 || playerMove == 2 && cpuMove == 1 {
            playerScore += 1
        }

        updateResultText(playerMove: playerMove, cpuMove: cpuMove)
    }

    func updateResultText(playerMove: Int, cpuMove: Int) {
        result = "You picked \(moves[playerMove]) and CPU picked \(moves[cpuMove])"

        if playerScore == 10 || cpuScore == 10 {
            if playerScore > cpuScore {
                result = "You won the game!"
            } else {
                result = "CPU won the game!"
            }

            isGameOver = true
        }
    }

    func resetGame() {
        playerScore = 0
        cpuScore = 0
        result = nil
    }
}

#Preview {
    ContentView()
}
