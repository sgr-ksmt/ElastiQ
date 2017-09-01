//
//  Match.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/01.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension ElastiQ {
    public final class MatchAll: QueryParameter, HasSingleParameter {
        public let parameterName: String = "match_all"

        public var parameter: QueryParameter?

        @discardableResult
        public func boost(_ value: QueryNumberValue) -> Self {
            add(ElastiQ.Parameter.Boost(value: value))
            return self
        }
    }

    public final class MatchNone: QueryParameter {
        public let parameterName: String = "match_none"

        public var body: Any {
            return [:]
        }
    }

}
