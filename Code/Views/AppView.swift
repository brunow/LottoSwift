import UIKit
import EasyPeasy

class AppView: UIView {

    required init() {
        super.init(frame: .zero)
        
        setup()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

// MARK: Private
private extension AppView {
    
    private func setup() {
        backgroundColor = .white
    }
    
    private func layout() {
        
    }
    
}
