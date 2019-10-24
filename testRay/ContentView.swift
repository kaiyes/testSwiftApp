import SwiftUI

struct ContentView: View {
    @State var isOpen: Bool = false
    @State var sliderValue: Double = 50
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Click It")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.orange)
                Text("100")
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
                print("yet")
                self.isOpen = true
            }) { Text("hit me") }
                .alert(isPresented: $isOpen) {
                    () -> Alert in
                    return Alert (title: "slider value",
                                  message: "value is \(self.sliderValue)", dismissButton: .default(Text("nice")))
            }
            // scores
            Spacer()
            HStack {
                Button(action: {
                    print("button start over")
                }) { Text("Start Over") }
                Spacer()
                Text("Score:")
                Text ("\(self.sliderValue)")
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
