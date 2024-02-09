___FILEHEADER___

import UIKit

final class ___VARIABLE_productName:identifier___View: UIView {
    let actionHandler: ActionHandler

    init(actionHandler: ActionHandler) {
        self.actionHandler = actionHandler
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    private func setupUI() {}
}

extension ___VARIABLE_productName:identifier___View {
    struct ActionHandler {}
}
