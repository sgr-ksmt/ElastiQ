//
//  FunctionScore.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/01.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension ElastiQ {
    public final class FunctionScore: QueryParameter, HaveMultipleParameters {
        public let parameterName = "function_score"

        public var parameters: [QueryParameter] = []

        @discardableResult
        public func query(_ configurationBlock: ParameterConfigurationBlock<Query>) -> Self{
            add(Query(), configurationBlock: configurationBlock)
            return self
        }

        @discardableResult
        public func functions(_ configurationBlock: ParameterConfigurationBlock<Functions>) -> Self{
            add(Functions(), configurationBlock: configurationBlock)
            return self
        }

        @discardableResult
        public func boost(_ value: QueryNumberValue) -> Self {
            add(ElastiQ.Parameter.Boost(value: value))
            return self
        }

        @discardableResult
        public func maxBoost(_ value: QueryNumberValue) -> Self {
            add(ElastiQ.Parameter.MaxBoost(value: value))
            return self
        }

        @discardableResult
        public func minScore(_ value: QueryNumberValue) -> Self {
            add(ElastiQ.Parameter.MinScore(value: value))
            return self
        }

        @discardableResult
        public func scoreMode(_ mode: ElastiQ.Parameter.ScoreMode.Mode) -> Self {
            add(ElastiQ.Parameter.ScoreMode(mode: mode))
            return self
        }

        @discardableResult
        public func boostMode(_ mode: ElastiQ.Parameter.BoostMode.Mode) -> Self {
            add(ElastiQ.Parameter.BoostMode(mode: mode))
            return self
        }
    }
}

