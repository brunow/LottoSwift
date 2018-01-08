import UIKit
import RxSwift
import EasyPeasy

class AppViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    private lazy var customView = AppView()
    
    private var viewModel: AppViewModelProtocol!
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let generateBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Generate", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    convenience init() {
        self.init(viewModel: AppViewModel())
    }
    
    required convenience init(viewModel: AppViewModelProtocol) {
        self.init(nibName: nil, bundle: nil)
        
        self.viewModel = viewModel
    }
    
    override func loadView() { view = customView }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textLabel)
        view.addSubview(generateBtn)
        
        generateBtn <- [Top(20), CenterX()]
        textLabel <- [Top(10).to(generateBtn, .bottom), Left(20), Right(20)]
        
        generateBtn.addTarget(self, action: #selector(generateAction), for: .touchUpInside)

        bindWithViewModel()
    }
    
}

// MARK: Actions
private extension AppViewController {
    
    @objc private func generateAction() {
        viewModel
            .generate()
            .map { return $0.map { $0.description }.joined(separator: "\n") }
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .observeOn(MainScheduler())
            .subscribe(onNext: { [weak self] items in
                self?.textLabel.text = items
                
            }).addDisposableTo(disposeBag)


    }
    
}

// MARK: Private
private extension AppViewController {
    
    private func bindWithViewModel() {
        
    }
    
}
