import SwiftUI

struct ContentView: View {
    @State var sliderValue: Double = 50
    @State var target: Int = Int.random(in: 1 ... 100)
    @State var totalScore: Int = 0
    @State var rounds: Int = 0


    func currentScore() -> Int {
        let difference: Int
        let roundedVal = Int(sliderValue.rounded())
        if target > roundedVal {
            difference = target - roundedVal
        } else if roundedVal > target {
            difference = roundedVal - target
        } else {
            difference = 0
        }
        return 100 - difference
    }
    
    func startOver() -> Bool {
        self.rounds = 0
        self.totalScore = 0
        self.target = Int.random(in: 1...100)
        self.sliderValue = 50
        return true
    }

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Click It")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.orange)
                Text("\(self.target)")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.orange)
            }
            Spacer()
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1 ... 100)
                Text("100")
            }
            Spacer()
            Button(action: {
                self.target = Int.random(in: 1 ... 100)
                self.totalScore += self.currentScore()
                self.rounds += 1
            }) { Text("hit me") }

            // scores
            Spacer()
            HStack {
                Button(action: {
                    self.startOver()
                }) { Text("Start Over") }
                Text("Currnet Score:")
                Text("\(currentScore())")

                Text("Total Score:")
                Text("\(self.totalScore)")
                Spacer()
                Text("Round:")
                Text("\(self.rounds)")
                Spacer()
                Button(action: {
                    print("button info")
                }) { Text("info") }
            }.padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
