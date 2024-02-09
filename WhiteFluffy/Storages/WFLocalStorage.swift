//
//  WFLocalStorage.swift
//  WhiteFluffy
//
//  Created by duke on 2/9/24.
//

import CoreStore

enum WFLocalStorage {
    static var dataStack: DataStack { CoreStoreDefaults.dataStack }
    static var encoder: JSONEncoder { JSONEncoder() }
    static var decoder: JSONDecoder { JSONDecoder() }
}
