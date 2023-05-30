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

extension Array where Element: Hashable {

    func next(item: Element) -> Element? {
        if let index = self.index(of: item), index + 1 <= self.count {
            return index + 1 == self.count ? self[0] : self[index + 1]
        }
        return nil
    }

    func prev(item: Element) -> Element? {
        if let index = self.index(of: item), index >= 0 {
            return index == 0 ? self.last : self[index - 1]
        }
        return nil
    }
    
}
