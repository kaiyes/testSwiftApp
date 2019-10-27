import SwiftUI

struct ContentView: View {
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1 ... 100)
    @State var totalScore: Int = 0
    @State var rounds: Int = 0
    @State var isRoundOver: Bool = false

    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .foregroundColor(Color.black)
                .shadow(color: Color.yellow, radius: 5, x: 2, y: 2)
                .font(Font.custom("Arial Rouned MT Bold", size: 22))
        }
    }

    struct NumberStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.red)
                .shadow(color: Color.orange, radius: 5, x: 2, y: 2)
                .font(Font.custom("Al Nile", size: 34))
        }
    }

    func currentScore() -> Int {
        100 - abs(target - Int(sliderValue.rounded()))
    }

    func startOver() {
        rounds = 0
        totalScore = 0
        target = Int.random(in: 1 ... 100)
        sliderValue = 50
    }

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Click It")
                    .modifier(LabelStyle())
                Text("\(target)")
                    .modifier(LabelStyle())
            }
            Spacer()
            HStack {
                Text("1").modifier(NumberStyle())
                Slider(value: $sliderValue, in: 1 ... 100)
                Text("100").modifier(NumberStyle())
            }
            Spacer()
            Button(action: {
                self.totalScore += self.currentScore()
                self.rounds += 1
                self.target = Int.random(in: 1 ... 100)
            }) { Text("hit me").modifier(LabelStyle()) }

            // scores
            Spacer()
            HStack {
                Button(action: {
                    self.startOver()
                }) { Text("Start Over") }
                Spacer()
                Text("Total Score:").modifier(LabelStyle())
                Text("\(totalScore)").modifier(NumberStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(rounds)").modifier(LabelStyle())
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
