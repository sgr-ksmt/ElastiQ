//
//  BoolQuery.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/08/23.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension ElastiQ {
    public final class BoolQuery: QueryParameter, HaveMultipleParameters {
        public let parameterName = "bool"
        public typealias ParameterBlock<T> = (T) -> Void
        public var parameters: [QueryParameter] = []

        @discardableResult
        public func filter(_ configurationBlock: ParameterConfigurationBlock<Filter>) -> Self {
            add(Filter(), configurationBlock: configurationBlock)
            return self
        }

        @discardableResult
        public func must(_ configurationBlock: ParameterConfigurationBlock<Must>) -> Self {
            add(Must(), configurationBlock: configurationBlock)
            return self
        }

        @discardableResult
        public func should(_ configurationBlock: ParameterConfigurationBlock<Should>) -> Self {
            add(Should(), configurationBlock: configurationBlock)
            return self
        }

        @discardableResult
        public func mustNot(_ configurationBlock: ParameterConfigurationBlock<MustNot>) -> Self {
            add(MustNot(), configurationBlock: configurationBlock)
            return self
        }
    }
}

extension ElastiQ.BoolQuery {
    public final class Filter: BoolQueryParameter, HasTermLevelQuery {
        public let parameterName = "filter"
        public var parameters: [QueryParameter] = []
    }

    public final class Must: BoolQueryParameter, HasTermLevelQuery {
        public let parameterName = "must"
        public var parameters: [QueryParameter] = []
    }

    public final class Should: BoolQueryParameter, HasTermLevelQuery {
        public let parameterName = "should"
        public var parameters: [QueryParameter] = []
    }

    public final class MustNot: BoolQueryParameter, HasTermLevelQuery {
        public let parameterName = "must_not"
        public var parameters: [QueryParameter] = []
    }
}
