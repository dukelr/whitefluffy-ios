___FILEHEADER___

import UIKit

protocol ___VARIABLE_productName:identifier___ViewControllerProtocol: UIViewController {}

final class ___VARIABLE_productName:identifier___ViewController: UIViewController {
    // MARK: - Dependencies

    var interactor: ___VARIABLE_productName:identifier___InteractorProtocol!
    
    // MARK: - Properties

    private lazy var contentView = ___VARIABLE_productName:identifier___View(actionHandler: setupActionHandler())
    
    // MARK: - Lifecycle funcs

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor.activate()
    }

    // MARK: - Setup funcs

    private func setupUI() {}
    
    private func setupActionHandler() -> ___VARIABLE_productName:identifier___View.ActionHandler { ___VARIABLE_productName:identifier___View.ActionHandler() }
}

// MARK: - ___VARIABLE_productName:identifier___ViewControllerProtocol

extension ___VARIABLE_productName:identifier___ViewController: ___VARIABLE_productName:identifier___ViewControllerProtocol {}
