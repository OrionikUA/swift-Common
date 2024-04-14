import Foundation

public extension String {
    var separatedWordsWithoutParentheses: String {
        let firstNil = self.split(separator: "(").first
        guard let first = firstNil else {
            return self
        }
        
        let withSpaces = first.enumerated().reduce("") { result, current in
            if current.offset > 0 && current.element.isUppercase {
                return "\(result) \(current.element)"
            } else {
                return "\(result)\(current.element)"
            }
        }
        
        return withSpaces
    }
    
    var splitWithLine: [String] {
        self.split(separator: "|").map({ String($0) })
    }
    
    func removePrefixIfNeeded(_ str2: String) -> String {
        if self.hasPrefix(str2) {
            let range = self.range(of: str2)!
            return self.replacingCharacters(in: range, with: "")
        }
        return self
    }
    
    func removePrefixIfNeeded(_ strs: [String]) -> String {
        var input = self
        for str in strs {
            input = input.removePrefixIfNeeded(str)
        }
        return input
    }
    
    func getPrefix(_ prefix: [String]) -> String? {
        for prf in prefix {
            if (self.hasPrefix(prf)) {
                return prf
            }
        }
        return nil
    }
}
