___FILEHEADER___

protocol ___VARIABLE_productName:identifier___InteractorProtocol {
    func activate()
}

final class ___VARIABLE_productName:identifier___Interactor: ___VARIABLE_productName:identifier___InteractorProtocol {
    private let presenter: ___VARIABLE_productName:identifier___PresenterProtocol
    private let router: ___VARIABLE_productName:identifier___RouterProtocol

    init(
        presenter: ___VARIABLE_productName:identifier___PresenterProtocol,
        router: ___VARIABLE_productName:identifier___RouterProtocol
    ) {
        self.presenter = presenter
        self.router = router
    }

    func activate() {}
}
