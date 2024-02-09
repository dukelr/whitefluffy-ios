//
//  WFDatabase.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import CoreStore

private enum Constant {
    static let fileName = "whitefluffy.sqlite"
}

final class WFDatabase {
    func configure() {
        do {
            try CoreStoreDefaults.dataStack.addStorageAndWait(
                SQLiteStore(
                    fileName: Constant.fileName,
                    localStorageOptions: .recreateStoreOnModelMismatch
                )
            )
        } catch {
            print("[WFDatabase] Failed to setup SQLiteStore: \(error.localizedDescription)")
        }
    }
}
