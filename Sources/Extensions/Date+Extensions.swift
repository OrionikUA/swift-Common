import Foundation

public extension Date {
    
    static func create(day: Int, month: Int, year: Int) -> Date {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        let customDate = calendar.date(from: dateComponents)!
        return customDate
    }
    
    static func isMore(obj1: Date, obj2: Date) -> Bool {
        return obj1.year > obj2.year || obj1.month > obj2.month || obj1.day > obj2.day
    }
    
    var month: Int {
        get {
            let month = Calendar.current.component(.month, from: self)
            return month
        }
    }
    
    var day: Int {
        get {
            let day = Calendar.current.component(.day, from: self)
            return day
        }
    }
    
    var year: Int {
        get {
            let year = Calendar.current.component(.year, from: self)
            return year
        }
    }
    
    var hour: Int {
        get {
            let year = Calendar.current.component(.hour, from: self)
            return year
        }
    }
    
    var minute: Int {
        get {
            let year = Calendar.current.component(.minute, from: self)
            return year
        }
    }
    
    var second: Int {
        get {
            let year = Calendar.current.component(.second, from: self)
            return year
        }
    }
    
    var notionDateFormat: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: self)
        }
    }
    
    var toString: String {
        let str = "\(String(format: "%02d", self.day)).\(String(format: "%02d", self.month)).\(String(format: "%04d", self.year))"
        return str
    }
    
    var dayString: String {
        let str = "\(String(format: "%04d", self.year))-\(String(format: "%02d", self.month))-\(String(format: "%02d", self.day))"
        return str
    }
    
    var dayMonthString: String {
        let str = "\(String(format: "%02d", self.day)).\(String(format: "%02d", self.month))"
        return str
    }
    
    func isSameDay(date: Date) -> Bool {
        let date1 = Calendar.current.startOfDay(for: self)
        let date2 = Calendar.current.startOfDay(for: date)
        let diff = Calendar.current.dateComponents([.day, .month, .year], from: date1, to: date2)
        return diff.day == 0 && diff.month == 0 && diff.year == 0
    }
    
    func previousDay(_ i: Int = 1) -> Date {
        return Calendar.current.date(byAdding: .day, value: -i, to: self)!
    }
    
    func nextDay(i: Int = 1) -> Date {
        return Calendar.current.date(byAdding: .day, value: i, to: self)!
    }
    
    func previousHour(_ i: Int = 1) -> Date {
        return Calendar.current.date(byAdding: .hour, value: -i, to: self)!
    }
    
    func nextHour(_ i: Int = 1) -> Date {
        return Calendar.current.date(byAdding: .hour, value: i, to: self)!
    }
    
    static var today: Date {
        Calendar.current.startOfDay(for: Date())
    }
    
    var time: String {
        let str = "\(String(format: "%02d", self.hour)):\(String(format: "%02d", self.minute)):\(String(format: "%02d", self.second))"
        return str
    }
    
    var getMonday: Date {
        let cal = Calendar.current
        var comps = cal.dateComponents([.weekOfYear, .yearForWeekOfYear], from: self)
        comps.weekday = 2
        let mondayInWeek = cal.date(from: comps)!
        return mondayInWeek
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
    
    var startOfMonth: Date {
        let calendar = Calendar.current
        let today = self
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: calendar.startOfDay(for: today)))!
        return startOfMonth
    }
    
    var endOfTheMonth: Date {
        let calendar = Calendar.current
        let today = self
        let range = calendar.range(of: .day, in: .month, for: today)!
        let numDays = range.count
        let endOfMonth = calendar.date(byAdding: DateComponents(day: numDays-1), to: today.startOfMonth)!
        return endOfMonth
    }
    
    var startOfTheYear: Date {
        let calendar = Calendar.current
        let today = self
        let startOfYear = calendar.date(from: calendar.dateComponents([.year], from: calendar.startOfDay(for: today)))!
        return startOfYear
    }
    
    var endOfTheYear: Date {
        let calendar = Calendar.current
        let today = self
        let endOfYear = calendar.date(byAdding: DateComponents(year: 1, day: -1), to: today.startOfTheYear)!
        return endOfYear
    }
    
    func previousMonth(i: Int = 1) -> Date {
        return Calendar.current.date(byAdding: .month, value: -i, to: self)!
    }
    
    func nextMonth(i: Int = 1) -> Date {
        return Calendar.current.date(byAdding: .month, value: i, to: self)!
    }
    
    func previousYear(i: Int = 1) -> Date {
        return Calendar.current.date(byAdding: .year, value: -i, to: self)!
    }
    
    func nextYear(i: Int = 1) -> Date {
        return Calendar.current.date(byAdding: .year, value: i, to: self)!
    }
    
    var dayToken: Int {
        self.year * 366 + self.month * 32 + self.day
    }
    
    static func daysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        return components.day ?? 0
    }
    
    static func firstMonday(ofYear year: Int, month: Int) -> Date? {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1
        guard let firstDayOfMonth = calendar.date(from: components) else {
            return nil
        }

        var offset = 0
        let firstDayWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        if firstDayWeekday > 2 {
            offset = 9 - firstDayWeekday
        } else if firstDayWeekday < 2 {
            offset = 1
        }
        return calendar.date(byAdding: .day, value: offset, to: firstDayOfMonth)
    }
    
    static func lastMondayFriday(ofYear year: Int, month: Int) -> Date? {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = year
        components.month = month + 1
        components.day = 0

        guard let lastDayOfMonth = calendar.date(from: components) else {
            return nil
        }

        let lastDayWeekday = calendar.component(.weekday, from: lastDayOfMonth)
        var offset = 0
        if lastDayWeekday < 2 {
            offset = -6
        } else {
            offset = -lastDayWeekday + 2
        }
        return calendar.date(byAdding: .day, value: offset+6, to: lastDayOfMonth)
    }
}
