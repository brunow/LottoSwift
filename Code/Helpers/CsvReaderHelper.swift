import Foundation
import CSV

class CsvReaderHelper {
    
    class func read(filePath: String) -> [[String]]? {
        let fileURL = Bundle.main.url(forResource: filePath, withExtension: "csv")!
        let stream = InputStream(url: fileURL)!
        let csv = try! CSVReader(stream: stream)
//        csv.reversed()
        var items = [[String]]()
        
        while let row = csv.next() {
//            print("\(row)")
            items.append(row)
        }
        
        return items
    }
    
}
