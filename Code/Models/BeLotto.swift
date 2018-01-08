import Foundation

//date;number1;number2;number3;number4;number5;number6;bonus

struct BeLotto {
    
    var date: Date
    
    var number1: Int
    
    var number2: Int
    
    var number3: Int
    
    var number4: Int
    
    var number5: Int
    
    var number6: Int
    
    var bonus: Int
}

// MARK: Winnerable
extension BeLotto: Winnerable {
    
    func numbers() -> [Int] {
        return [number1, number2, number3, number4, number5, number6]
    }
    
}
