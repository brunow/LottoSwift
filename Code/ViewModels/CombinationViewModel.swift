import Foundation
import RxSwift

protocol CombinationViewModelProtocol: class, CustomStringConvertible {
    
    var type: GameType { get }
    
    var numbers: [Int] { get }
    
    var bonus: [Int]? { get }
    
    init(type: GameType, numbers: [Int], bonus: [Int]?)
    
}

extension CombinationViewModelProtocol {
    
    var description: String {
        let snumbers = numbers.map { String($0) }
        let sbonus = (bonus ?? []).map { String("*\($0)") }
        return (snumbers + sbonus).joined(separator: ", ")
    }
    
}

func ==(lhs: CombinationViewModelProtocol, rhs: CombinationViewModelProtocol) -> Bool {
    return
        lhs.numbers == rhs.numbers &&
            lhs.bonus ?? [] == rhs.bonus ?? [] &&
            lhs.type == rhs.type
}

func !=(lhs: CombinationViewModelProtocol, rhs: CombinationViewModelProtocol) -> Bool {
    return
        lhs.numbers == rhs.numbers &&
            lhs.bonus ?? [] == rhs.bonus ?? [] &&
            lhs.type == rhs.type
}

class CombinationViewModel: CombinationViewModelProtocol {

    private(set) var type: GameType
    
    private(set) var numbers: [Int]
    
    private(set) var bonus: [Int]?
    
    public required init(type: GameType, numbers: [Int], bonus: [Int]?) {
        self.type = type
        self.numbers = numbers
        self.bonus = bonus
    }
    
}

// MARK: Private
private extension CombinationViewModel {
    
    
    
}
