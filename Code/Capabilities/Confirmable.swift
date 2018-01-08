import UIKit

class ConfirmableOptions {
    
    typealias CompletionHandler = (_ confirmed: Bool) -> ()
    
    var title: String?
    var message: String?
    var preferredStyle: UIAlertControllerStyle = .actionSheet
    var destructiveTitle: String?
    var cancelTitle: String?
    var defaultTitle: String?
    var completion: CompletionHandler?
}

protocol Confirmable: class {
    
    func confirm(builder: (_ build: ConfirmableOptions) -> (), viewController: UIViewController)
    
}

extension Confirmable {
    
    func confirm(builder: (_ build: ConfirmableOptions) -> (), viewController: UIViewController) {
        let options = ConfirmableOptions()
        builder(options)
        
        let alert = UIAlertController(title: options.title, message: options.message, preferredStyle: options.preferredStyle)
        
        if let destructive = options.destructiveTitle {
            let destructiveAction = UIAlertAction(title: destructive, style: .destructive, handler:  { _ in
                options.completion?(true)
            })
            
            alert.addAction(destructiveAction)
        }
        
        if let title = options.defaultTitle {
            let defaultAction = UIAlertAction(title: title, style: .default, handler:  { _ in
                options.completion?(true)
            })
            
            alert.addAction(defaultAction)
        }
        
        if let cancel = options.cancelTitle {
            let cancelAction = UIAlertAction(title: cancel, style: .cancel, handler:  { _ in
                options.completion?(false)
            })
            
            alert.addAction(cancelAction)
        }
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
}

extension Confirmable where Self:UIViewController {
    
    func confirm(builder: (_ build: ConfirmableOptions) -> ()) {
        confirm(builder: builder, viewController: self)
    }
    
}
