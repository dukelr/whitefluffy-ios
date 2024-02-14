//
//  WFEmptyPlaceholderLabel.swift
//  WhiteFluffy
//
//  Created by duke on 2/13/24.
//

import UIKit

private enum Constant {
    static let fontSize: CGFloat = 24
}

final class WFEmptyPlaceholderLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        setupUI(text: text)
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func setupUI(text: String) {
        self.text = text
        font = .boldSystemFont(ofSize: Constant.fontSize)
        numberOfLines = .zero
        textAlignment = .center
        textColor = .white
        isHidden = true
    }
}
