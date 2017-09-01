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
            public let parameterName: String = "from"
            public let value: QueryNumberValue

            public var body: Any {
                return value
            }
        }

        public struct Size: QueryParameter {
            public let parameterName: String = "size"
            public let value: QueryNumberValue

            public var body: Any {
                return value
            }
        }


        public struct Term: QueryParameter {
            public let parameterName: String = "term"
            public let key: String
            public let value: QueryValue

            public var body: Any {
                return [key: value]
            }
        }

        public struct Terms: QueryParameter {
            public let parameterName: String = "terms"
            public let key: String
            public let values: [QueryValue]

            public var body: Any {
                return [key: values]
            }
        }

        public struct Range: QueryParameter {
            public enum Condition {
                public typealias V = QueryNumberValue
                case lt(V)
                case lte(V)
                case gt(V)
                case gte(V)

                public var element: (key: String, value: V) {
                    switch self {
                    case .lt(let value): return ("lt", value)
                    case .lte(let value): return ("lte", value)
                    case .gt(let value): return ("gt", value)
                    case .gte(let value): return ("gte", value)
                    }
                }
            }

            public let parameterName: String = "range"
            public let key: String
            public let conditions: [Condition]

            public var body: Any {
                return [key: Dictionary(uniqueKeysWithValues: conditions.map { ($0.element.key, $0.element.value) })]
            }
        }

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
