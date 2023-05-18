import SwiftUI

struct ContentView: View {
    @State var picker:Bool = false
    var body: some View {
        NavigationView{
            VStack{
                Text("Study Buddy")
                HStack{
                NavigationLink {
                    createView(term1: "", definition1: "")
                } label: {
                    Text("Make a Set")
                        .frame(width: 100, height: 100)
                        .background(.mint)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous))
                        .padding()
                    NavigationLink {
                        setView(term1: "", definition1: "")
                    } label: {
                        Text("View your set")
                            .frame(width: 100, height: 100)
                            .background(.mint)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous))
                            .padding()
                    }
                }
                }
            }
        }
        .navigationViewStyle(.stack)
        
    }
}
