//
//  ElastiQ.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/08/23.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public final class ElastiQ: HasSingleParameter {
    public typealias ParameterBlock<T> = (T) -> Void
    public var parameter: QueryParameter?

    public init() {

    }
    
    public var body: Any {
        return parameter.map { ["query": [$0.parameterName: $0.body]] } ?? [:]
    }

    @discardableResult
    public func bool(_ block: ParameterBlock<BoolQuery>) -> Self {
        _add(BoolQuery(), block)
        return self
    }

    @discardableResult
    public func functionalScore(_ block: ParameterBlock<FunctionalScore>) -> Self {
        _add(FunctionalScore(), block)
        return self
    }

    private func _add<T: QueryParameter>(_ param: T, _ block: ParameterBlock<T>) {
        block(param)
        add(param)
    }

    public func json() throws -> Data {
        return try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
    }
}
