___FILEHEADER___

protocol ___VARIABLE_productName:identifier___RouterProtocol {}

struct ___VARIABLE_productName:identifier___Router: ___VARIABLE_productName:identifier___RouterProtocol {
    private weak var viewController: ___VARIABLE_productName:identifier___ViewControllerProtocol?

    init(viewController: ___VARIABLE_productName:identifier___ViewControllerProtocol) {
        self.viewController = viewController
    }
}
