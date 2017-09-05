//
//  Value.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/08/23.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public protocol QueryValue {}
public protocol QueryNumberValue {}
public protocol QueryKey {
    var key: String { get }
}

extension Int: QueryValue, QueryNumberValue {}
extension UInt: QueryValue, QueryNumberValue {}
extension Float: QueryValue, QueryNumberValue {}
extension Double: QueryValue, QueryNumberValue {}
extension String: QueryValue {}

extension String: QueryKey {
    public var key: String {
        return self
    }
}

extension PartialKeyPath: QueryKey {
    public var key: String {
        return self._kvcKeyPathString!
    }
}
