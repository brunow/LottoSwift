import Foundation

//date;number1;number2;number3;number4;number5;star1;star2

struct EuroMillion {
    
    var date: Date
    
    var number1: Int
    
    var number2: Int
    
    var number3: Int
    
    var number4: Int
    
    var number5: Int
    
    var bonus1: Int
    
    var bonus2: Int
}

// MARK: Winnerable
extension EuroMillion: Winnerable {
    
    func numbers() -> [Int] {
        return [number1, number2, number3, number4, number5, bonus1, bonus2]
    }
    
}
