import Foundation

enum GameType {
    case beLotto
    case euroMillion
}

// MARK: Properties
extension GameType {
    
    var minNumber: Int { return 1 }
    
    var maxNumber: Int {
        switch self {
        case .beLotto:
            return 45
        case .euroMillion:
            return 50
        }
    }
    
    var hasBonus: Bool {
        switch self {
        case .beLotto:
            return false
        case .euroMillion:
            return true
        }
    }
    
    var numbersCount: Int {
        switch self {
        case .beLotto:
            return 6
        case .euroMillion:
            return 5
        }
    }
    
    var bonusCount: Int {
        switch self {
        case .beLotto:
            return 0
        case .euroMillion:
            return 2
        }
    }
    
    var minBonus: Int? {
        switch self {
        case .beLotto:
            return nil
        case .euroMillion:
            return 1
        }
    }
    
    var maxBonus: Int? {
        switch self {
        case .beLotto:
            return nil
        case .euroMillion:
            return 12
        }
    }
    
}
