import SwiftUI

struct pairs:Hashable, Encodable, Decodable {
    var term2:String
    var definition2:String
}

struct set1: Identifiable {
    var id: Int
    var pairs:[pairs]
    var desription:String
}
