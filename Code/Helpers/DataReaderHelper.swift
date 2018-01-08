import Foundation

class DataReaderHelper {
    
    class func lotto() -> [BeLotto]? {
        let optionalItems = CsvReaderHelper.read(filePath: "LottoGameData")
        guard let items = optionalItems else { return nil }
        
        return items.map { item -> BeLotto in
            return BeLotto(date: Date(),
                         number1: Int(item[1])!,
                         number2: Int(item[2])!,
                         number3: Int(item[3])!,
                         number4: Int(item[4])!,
                         number5: Int(item[5])!,
                         number6: Int(item[6])!,
                         bonus: Int(item[7])!)
        }
    }
    
}
