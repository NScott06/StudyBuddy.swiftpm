import SwiftUI

struct colorPicker: View {
    @State var flashcardcolor1: Color = .mint
    var body: some View {
        VStack{
            ColorPicker("Change Flashcard Color", selection: $flashcardcolor1)
                .onSubmit {
                    flashcardcolor1 = flashcardcolor1
                }
        }
    }
}
