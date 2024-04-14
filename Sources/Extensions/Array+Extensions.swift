public extension Array where Element == String {
    func removeDuplicates() -> [String] {
        var seen = Set<String>()
        return self.filter { seen.insert($0).inserted }
    }
    
    var joinedWithLine: String {
        self.joined(separator: "|")
    }
    
    var areAllValuesUnique: Bool {
        return self.count == Set(self).count
    }
}
