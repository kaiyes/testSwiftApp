import SwiftUI

struct ContentView: View {
    @State var isOpen: Bool = false
    @State var popOpener: Bool = false

    var body: some View {
        VStack {
            HStack {
                Text("Click It")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.orange)
                Text("100")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.orange)
            }

            HStack {
                Text("1")
                Slider(value: .constant(10))
                Text("100")
            }

                                            Button(action: {
                                                print("yet")
                                                self.isOpen = true
                                            }) { Text("hit me")}
            // scores
            HStack {
                Button(action: {
                    print("button start over")
                }) { Text("Start Over") }
                Spacer()
                Text("Score:")
                Text("9999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {
                    print("button info")
                }) { Text("info") }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}