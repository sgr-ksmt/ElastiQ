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
        public let parameterName: String = "functions"

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
        public let parameterName: String = "function"

        public var parameters: [QueryParameter] = []

        public var body: Any {
            return Dictionary(uniqueKeysWithValues: parameters.map { ($0.parameterName, $0.body) })
        }
    }
}
