//
//  BoolQuery.swift
//  Tongs
//
//  Created by suguru-kishimoto on 2017/08/23.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension Tongs {
    public final class BoolQuery: QueryParameter {
        public let parameterName: String = "bool"

        private var queries: [BoolQueryParameter] = []

        public func filter(_ block: (Filter) -> Filter) -> Self {
            queries.append(block(Filter()))
            return self
        }

        public func must(_ block: (Must) -> Must) -> Self {
            queries.append(block(Must()))
            return self
        }

        public func should(_ block: (Should) -> Should) -> Self {
            queries.append(block(Should()))
            return self
        }

        public func mustNot(_ block: (MustNot) -> MustNot) -> Self {
            queries.append(block(MustNot()))
            return self
        }

        public var body: Any {
            return Dictionary(uniqueKeysWithValues: queries.map { ($0.queryName, $0.body) })
        }
    }
}

extension Tongs.BoolQuery {
    public final class Filter: BoolQueryParameter {
        public let queryName: String = "filter"
        public var parameters: [QueryParameter] = []
    }

    public final class Must: BoolQueryParameter {
        public let queryName: String = "must"
        public var parameters: [QueryParameter] = []
    }

    public final class Should: BoolQueryParameter {
        public let queryName: String = "should"
        public var parameters: [QueryParameter] = []
    }

    public final class MustNot: BoolQueryParameter {
        public let queryName: String = "must_not"
        public var parameters: [QueryParameter] = []
    }
}
