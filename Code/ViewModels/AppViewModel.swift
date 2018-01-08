import Foundation
import RxSwift

protocol AppViewModelProtocol: class {
    
    var items: [CombinationViewModelProtocol]? { get }
    
    var gameTypeVariable: Variable<GameType> { get }
    
    var countVariable: Variable<Int> { get }
    
    init()
    
    func generate() -> Observable<[CombinationViewModelProtocol]>
    
}

class AppViewModel: AppViewModelProtocol {
    
    private(set) var items: [CombinationViewModelProtocol]?
    
    private(set) var gameTypeVariable = Variable<GameType>(.beLotto)
    
    private(set) var countVariable = Variable<Int>(1)

    public required init() {
    }
    
    func generate() -> Observable<[CombinationViewModelProtocol]> {
        return Observable.create { [weak self] o in
            let items = self?.generateItems()
            self?.items = items
            o.onNext(items ?? [])
            
            return Disposables.create()
        }
    }
    
}

// MARK: Observable
extension AppViewModel {
}

// MARK: Getters
extension AppViewModel {
    
}

// MARK: Private
private extension AppViewModel {
    
    func generateItems() -> [CombinationViewModelProtocol] {
        var items = [CombinationViewModelProtocol]()
        
        for _ in 0...countVariable.value {
            let comb = generateItem()
            
            items.append(comb)
        }
        
        return items
    }
    
    func generateItem() -> CombinationViewModelProtocol {
        let type = gameTypeVariable.value
        return CombinationViewModel(type: type, numbers: [1, 4], bonus: nil)
    }
    
}
