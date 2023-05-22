//
//  flipcard.swift
//  CurrencyConverter
//
//  Created by Nick Scott on 4/26/23.
//

import Foundation
import SwiftUI

struct flipcard: View {
    
    @State var term1:String
    @State var definition1: String
    @State var frontCardColor = Color.red
    @State var backCardColor = Color.blue
    @State var flipped = false // state variable used to update the card
    
    
    
    var body: some View {
        
        if let data = UserDefaults.standard.value(forKey: "pair") as? Data {
            if var dataDecoded = try? JSONDecoder().decode([pairs].self, from: data){
                
                ForEach(dataDecoded, id: \.self) { pair2 in
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(self.flipped ? Color.red : Color.blue)
                            .padding()
                            .rotation3DEffect(self.flipped ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                            .animation(.default)
                            .onTapGesture {
                                self.flipped.toggle()
                            }
                        Text(flipped ? pair2.term2 : pair2.definition2 )
                        //                        Text(flipped ? "hi" : "bye" )
                            .rotation3DEffect(self.flipped ? Angle(degrees: 0): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                            .animation(.default)
                            .onTapGesture {
                                self.flipped.toggle()
                            }
                    }
                }
//                VStack{
//                    Button {
//                        dataDecoded.shuffle()
//                    } label: {
//                        Text("next")
//                    }
//                }

            }
        }
    }
}
