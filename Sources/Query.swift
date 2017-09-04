//
//  Query.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/01.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension ElastiQ {
    public final class Query: HasSingleParameter, QueryParameter {
        public let parameterName = "query"

        public var parameter: QueryParameter?

        @discardableResult
        public func matchAll(_ configurationBlock: ParameterConfigurationBlock<MatchAll> = { _ in }) -> Self {
            add(MatchAll(), configurationBlock: configurationBlock)
            return self
        }

        @discardableResult
        public func bool(_ configurationBlock: ParameterConfigurationBlock<BoolQuery>) -> Self {
            add(BoolQuery(), configurationBlock: configurationBlock)
            return self
        }

        @discardableResult
        public func functionScore(_ configurationBlock: ParameterConfigurationBlock<FunctionScore>) -> Self {
            add(FunctionScore(), configurationBlock: configurationBlock)
            return self
        }
    }
}

