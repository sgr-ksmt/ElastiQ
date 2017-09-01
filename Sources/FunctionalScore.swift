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
        public func boost(_ value: QueryNumberValue) -> Self {
            add(FunctionalScore.Parameter.Boost(value: value))
            return self
        }

        @discardableResult
        public func maxBoost(_ value: QueryNumberValue) -> Self {
            add(FunctionalScore.Parameter.MaxBoost(value: value))
            return self
        }

        @discardableResult
        public func minScore(_ value: QueryNumberValue) -> Self {
            add(FunctionalScore.Parameter.MinScore(value: value))
            return self
        }

        @discardableResult
        public func scoreMode(_ mode: FunctionalScore.Parameter.ScoreMode.Mode) -> Self {
            add(FunctionalScore.Parameter.ScoreMode(mode: mode))
            return self
        }

        @discardableResult
        public func boostMode(_ mode: FunctionalScore.Parameter.BoostMode.Mode) -> Self {
            add(FunctionalScore.Parameter.BoostMode(mode: mode))
            return self
        }

        public var body: Any {
            return Dictionary(uniqueKeysWithValues: parameters.map { ($0.parameterName, $0.body) })
        }
    }
}

extension ElastiQ.FunctionalScore {
    public struct Parameter {
        private init() {}

        public struct Boost: QueryParameter {
            public let parameterName: String = "boost"
            public let value: QueryNumberValue

            public var body: Any {
                return value
            }
        }

        public struct MaxBoost: QueryParameter {
            public let parameterName: String = "max_boost"
            public let value: QueryNumberValue

            public var body: Any {
                return value
            }
        }

        public struct MinScore: QueryParameter {
            public let parameterName: String = "min_score"
            public let value: QueryNumberValue

            public var body: Any {
                return value
            }
        }

        public struct ScoreMode: QueryParameter {
            public let parameterName: String = "score_mode"
            public enum Mode: String {
                case multiply
                case sum
                case avg
                case first
                case max
                case min
            }
            let mode: Mode

            public var body: Any {
                return mode.rawValue
            }
        }

        public struct BoostMode: QueryParameter {
            public let parameterName: String = "boost_mode"
            public enum Mode: String {
                case multiply
                case replace
                case sum
                case avg
                case max
                case min
            }

            let mode: Mode

            public var body: Any {
                return mode.rawValue
            }
        }

    }
}
