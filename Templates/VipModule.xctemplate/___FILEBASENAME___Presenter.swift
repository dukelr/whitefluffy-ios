___FILEHEADER___

protocol ___VARIABLE_productName:identifier___PresenterProtocol {}

struct ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___PresenterProtocol {
    private weak var viewController: ___VARIABLE_productName:identifier___ViewControllerProtocol?

    init(viewController: ___VARIABLE_productName:identifier___ViewControllerProtocol) {
        self.viewController = viewController
    }
}
