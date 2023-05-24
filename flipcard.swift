//
//  flipcard.swift
//  CurrencyConverter
//
//  Created by Nick Scott on 4/26/23.
//

import Foundation
import SwiftUI

struct flipcard: View {
    
    @State var frontCardColor = Color.red
    @State var backCardColor = Color.blue
    @State var flipped = false // state variable used to update the card
    @State var number23432 = 0
    
    
    var body: some View {
//        ScrollView{}

            if let data = UserDefaults.standard.value(forKey: "pair") as? Data {
                if var dataDecoded = try? JSONDecoder().decode([pairs].self, from: data){
                    ForEach(dataDecoded, id: \.self) { pair2 in
//                        ScrollView{}
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(self.flipped ? frontCardColor : backCardColor)
                                    .padding()
                                    .rotation3DEffect(self.flipped ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                                    .animation(.default)
                                    .onTapGesture {
                                        self.flipped.toggle()
                                    }
                                Text(flipped ? pair2.term2 : pair2.definition2 )
                                    .rotation3DEffect(self.flipped ? Angle(degrees: 0): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                                    .animation(.default)
                                    .onTapGesture {
                                        self.flipped.toggle()
                                    }
                            }
                        }
                    
                        ColorPicker("Change Back Flashcard Color", selection: $frontCardColor)
                        ColorPicker("Change Front Flashcard Color", selection: $backCardColor)
                        
                    }
                }
            }
        }

