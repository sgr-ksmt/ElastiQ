//
//  BoolQuery.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/08/23.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension ElastiQ {
    public final class BoolQuery: QueryParameter {
        public let parameterName: String = "bool"
        public typealias ParameterBlock<T> = (T) -> Void

        private var queries: [BoolQueryParameter] = []

        @discardableResult
        public func filter(_ block: ParameterBlock<Filter>) -> Self {
            _append(Filter(), block)
            return self
        }

        @discardableResult
        public func must(_ block: ParameterBlock<Must>) -> Self {
            _append(Must(), block)
            return self
        }

        @discardableResult
        public func should(_ block: ParameterBlock<Should>) -> Self {
            _append(Should(), block)
            return self
        }

        @discardableResult
        public func mustNot(_ block: ParameterBlock<MustNot>) -> Self {
            _append(MustNot(), block)
            return self
        }

        private func _append<T: BoolQueryParameter>(_ param: T, _ block: ParameterBlock<T>) {
            block(param)
            queries.append(param)
        }

        public var body: Any {
            return Dictionary(uniqueKeysWithValues: queries.map { ($0.queryName, $0.body) })
        }
    }
}

extension ElastiQ.BoolQuery {
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
