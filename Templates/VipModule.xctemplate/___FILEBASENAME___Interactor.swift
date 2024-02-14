___FILEHEADER___

protocol ___VARIABLE_productName:identifier___InteractorProtocol {
    func activate()
}

final class ___VARIABLE_productName:identifier___Interactor: ___VARIABLE_productName:identifier___InteractorProtocol {
    private let presenter: ___VARIABLE_productName:identifier___PresenterProtocol

    init(presenter: ___VARIABLE_productName:identifier___PresenterProtocol) {
        self.presenter = presenter
    }

    func activate() {}
}
