//
//  Query.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/01.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public final class Query: HasSingleParameter, QueryParameter {
    public let parameterName: String = "query"

    public var parameter: QueryParameter?

    public var body: Any {
        return parameter.map { [$0.parameterName: $0.body] } ?? [:]
    }

    @discardableResult
    public func bool(_ configurationBlock: ParameterConfigurationBlock<BoolQuery>) -> Self {
        add(BoolQuery(), configurationBlock: configurationBlock)
        return self
    }

    @discardableResult
    public func functionalScore(_ configurationBlock: ParameterConfigurationBlock<FunctionalScore>) -> Self {
        add(FunctionalScore(), configurationBlock: configurationBlock)
        return self
    }
}
