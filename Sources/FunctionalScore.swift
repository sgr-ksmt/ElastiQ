//
//  FunctionalScore.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/01.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension ElastiQ {
    public final class FunctionalScore: QueryParameter, HaveMultipleParameters {
        public let parameterName: String = "functional_score"

        public var parameters: [QueryParameter] = []

        @discardableResult
        public func query(_ configurationBlock: ParameterConfigurationBlock<Query>) -> Self{
            add(Query(), configurationBlock: configurationBlock)
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

        public var body: Any {
            return Dictionary(uniqueKeysWithValues: parameters.map { ($0.parameterName, $0.body) })
        }
    }
}

