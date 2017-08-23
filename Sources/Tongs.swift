//
//  Tongs.swift
//  Tongs
//
//  Created by suguru-kishimoto on 2017/08/23.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public final class Tongs: HasSingleParameter {

    public var parameter: QueryParameter?

    public init() {

    }
    
    private var body: Any {
        return parameter.map { ["query": [$0.parameterName: $0.body]] } ?? [:]
    }

    public func bool(_ block: (BoolQuery) -> (BoolQuery)) -> Self {
        add(block(BoolQuery()))
        return self
    }

    public func json() throws -> Data {
        return try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
    }
}
