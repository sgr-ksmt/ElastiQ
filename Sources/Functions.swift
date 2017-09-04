//
//  Functions.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/01.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension ElastiQ {
    public final class Functions: QueryParameter {
        public let parameterName = "functions"

        var functions: [Function] = []

        @discardableResult
        public func add(_ configureBlock: ParameterConfigurationBlock<Function>) -> Self {
            let function = Function()
            configureBlock(function)
            functions.append(function)
            return self
        }

        public var body: Any {
            return functions.map { $0.body }
        }
    }

    public final class Function: QueryParameter, HaveMultipleParameters {
        public let parameterName = "function"

        public var parameters: [QueryParameter] = []

        @discardableResult
        public func filter(_ configurationBlock: ParameterConfigurationBlock<ElastiQ.BoolQuery.Filter>) -> Self {
            add(ElastiQ.BoolQuery.Filter(), configurationBlock: configurationBlock)
            return self
        }

        @discardableResult
        public func weight(_ value: QueryNumberValue) -> Self {
            add(ElastiQ.Parameter.Weight(value: value))
            return self
        }

        @discardableResult
        public func randomScore() -> Self {
            add(ElastiQ.Parameter.RandomScore())
            return self
        }

    }
}
