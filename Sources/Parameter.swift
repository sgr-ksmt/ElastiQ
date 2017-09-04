//
//  Parameter.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/08/23.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension ElastiQ {
    public struct Parameter {
        private init() {}

        public struct From: QueryParameter {
            public let parameterName = "from"
            public let value: QueryNumberValue

            public var body: Any {
                return value
            }
        }

        public struct Size: QueryParameter {
            public let parameterName = "size"
            public let value: QueryNumberValue

            public var body: Any {
                return value
            }
        }

        public struct Boost: QueryParameter {
            public let parameterName = "boost"
            public let value: QueryNumberValue

            public var body: Any {
                return value
            }
        }

        public struct MaxBoost: QueryParameter {
            public let parameterName = "max_boost"
            public let value: QueryNumberValue

            public var body: Any {
                return value
            }
        }

        public struct MinScore: QueryParameter {
            public let parameterName = "min_score"
            public let value: QueryNumberValue

            public var body: Any {
                return value
            }
        }

        public struct ScoreMode: QueryParameter {
            public let parameterName = "score_mode"
            public enum Mode: String {
                case multiply
                case sum
                case avg
                case first
                case max
                case min
            }
            public let mode: Mode

            public var body: Any {
                return mode.rawValue
            }
        }

        public struct BoostMode: QueryParameter {
            public let parameterName = "boost_mode"
            public enum Mode: String {
                case multiply
                case replace
                case sum
                case avg
                case max
                case min
            }

            public let mode: Mode

            public var body: Any {
                return mode.rawValue
            }
        }

        public struct Weight: QueryParameter {
            public let parameterName = "weight"
            public let value: QueryNumberValue

            public var body: Any {
                return value
            }
        }

        public struct RandomScore: QueryParameter {
            public let parameterName = "random_score"
            public var body: Any {
                return [:]
            }
        }
    }
}
