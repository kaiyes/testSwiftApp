import SwiftUI

struct ContentView: View {
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1 ... 100)
    @State var totalScore: Int = 0
    @State var rounds: Int = 0
    @State var isRoundOver: Bool = false


    func currentScore() -> Int {
        return 100 - abs(target - Int(sliderValue.rounded()))
    }
    
    func startOver() -> Int {
        rounds = 0
        totalScore = 0
        target = Int.random(in: 1...100)
        sliderValue = 50
        return 0
    }

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Click It")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.orange)
                Text("\(target)")
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
                self.totalScore += self.currentScore()
                self.rounds += 1
                self.target = Int.random(in: 1 ... 100)
            }) { Text("hit me") }

            // scores
            Spacer()
            HStack {
                Button(action: {
                    self.startOver()
                }) { Text("Start Over") }
                Spacer()
                Text("Total Score:")
                Text("\(totalScore)")
                Text("\(currentScore())")
                Spacer()
                Text("Round:")
                Text("\(rounds)")
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
