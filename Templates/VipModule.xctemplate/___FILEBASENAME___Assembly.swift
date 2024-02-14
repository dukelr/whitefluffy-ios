___FILEHEADER___

protocol ___VARIABLE_productName:identifier___AssemblyProtocol {
    func assemble() -> ___VARIABLE_productName:identifier___ViewControllerProtocol
}

struct ___VARIABLE_productName:identifier___Assembly: ___VARIABLE_productName:identifier___AssemblyProtocol {
    func assemble() -> ___VARIABLE_productName:identifier___ViewControllerProtocol {
        let viewController = ___VARIABLE_productName:identifier___ViewController()
        viewController.interactor = ___VARIABLE_productName:identifier___Interactor(
            presenter: ___VARIABLE_productName:identifier___Presenter(viewController: viewController)
        )
        return viewController
    }
}
