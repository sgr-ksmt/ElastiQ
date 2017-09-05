//
//  Match.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/01.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension ElastiQ {
    public struct MatchAll: QueryParameter {
        public let parameterName = "match_all"

        let boost: QueryNumberValue?

        public var body: Any {
            return boost.map { ["boost": $0] } ?? [:]
        }
    }

    public struct MatchNone: QueryParameter {
        public let parameterName = "match_none"
        public let body: Any = [:]
    }

}
