//
//  Realm+helpers.swift
//  InMovie
//
//  Created by Alexandre Lara on 2018-06-09.
//  Copyright © 2018 Kuoote. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    func toArray<T>(type: T.Type) -> [T] {
        return compactMap { $0 as? T }
    }
}
