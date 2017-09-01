//
//  ElastiQ.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/08/23.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public final class ElastiQ: HasSingleParameter {
    public typealias ParameterBlock<T> = (T) -> T
    public var parameter: QueryParameter?

    public init() {

    }
    
    public var body: Any {
        return parameter.map { ["query": [$0.parameterName: $0.body]] } ?? [:]
    }

    public func bool(_ block: ParameterBlock<BoolQuery>) -> Self {
        add(block(BoolQuery()))
        return self
    }

    public func functionalScore(_ block: ParameterBlock<FunctionalScore>) -> Self {
        add(block(FunctionalScore()))
        return self
    }

    public func json() throws -> Data {
        return try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
    }
}
