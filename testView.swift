//
//  testView.swift
//  CurrencyConverter
//
//  Created by James Howard on 4/26/23.
//

import Foundation
import SwiftUI
//
struct TestView: View {
    
    @State var term1:String
    @State var definition1: String
    var body: some View {
        VStack{
            flipcard(term1: "", definition1: "", flipped: false)
                .frame(width: 300, height: 200)
            setCreator()
        }
        .onAppear(perform: {
            term1 = UserDefaults.standard.string(forKey: "term") ?? ""
            definition1 = UserDefaults.standard.string(forKey: "definition") ?? ""
        }) 
    }
}

