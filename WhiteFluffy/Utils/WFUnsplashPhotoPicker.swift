//
//  WFUnsplashPhotoPicker.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import UIKit
import UnsplashPhotoPicker

protocol WFUnsplashPhotoPickerProtocol {
    func configure(viewController: UIViewController?) -> UnsplashPhotoPicker
}

private enum Constant {
    static let accessKey = "7-2SM9KGN2sIJuwX5v2_JLmtcnbkXGdJB8I8h2O9GcU"
    static let secretKey = "r-jbSvDOTfsUOE5fPWt-X2SkHLhubtm_tn9vmGioJeo"
}

final class WFUnsplashPhotoPicker: WFUnsplashPhotoPickerProtocol {
    func configure(viewController: UIViewController?) -> UnsplashPhotoPicker {
        let picker =  UnsplashPhotoPicker(
            configuration: UnsplashPhotoPickerConfiguration(
                accessKey: Constant.accessKey,
                secretKey: Constant.secretKey
            )
        )
        picker.photoPickerDelegate = viewController as? any UnsplashPhotoPickerDelegate
        return picker
    }
}
