import SwiftUI

struct ContentView: View {
    @State var sliderValue: Double = 50
    @State var target: Int = Int.random(in: 1...100)
    @State var totalScore: Int = 0
    
    func currentScore() -> Int {
        let difference: Int
        let roundedVal = Int(self.sliderValue.rounded())
        if self.target > roundedVal {
            difference = self.target - roundedVal
        } else if roundedVal > self.target {
            difference = roundedVal - self.target
        } else {
            difference = 0
        }
        return 100-difference
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
                self.target = Int.random(in: 1...100)
            }) { Text("hit me") }
               
            // scores
            Spacer()
            HStack {
                Button(action: {
                    print("button start over")
                }) { Text("Start Over") }
                Spacer()
                Text("Score:")
                Text("\(self.sliderValue)")
                Spacer()
                Text("Round:")
                Text("999")
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
