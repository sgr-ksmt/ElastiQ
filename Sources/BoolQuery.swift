//
//  BoolQuery.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/08/23.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension Query {
    public final class BoolQuery: QueryParameter, HaveMultipleParameters {
        public let parameterName: String = "bool"
        public typealias ParameterBlock<T> = (T) -> Void
        public var parameters: [QueryParameter] = []
//        public var parameters: [QueryParameter] {
//            get {
//                return queries
//            }
//            set {
//                self.queries = newValue.flatMap( { $0 as? BoolQueryParameter })
//            }
//        }
//        var queries: [BoolQueryParameter] = []

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

        public var body: Any {
            return Dictionary(uniqueKeysWithValues: parameters.map { ($0.parameterName, $0.body) })
        }
    }
}

extension Query.BoolQuery {
    public final class Filter: BoolQueryParameter {
        public let parameterName: String = "filter"
        public var parameters: [QueryParameter] = []
    }

    public final class Must: BoolQueryParameter {
        public let parameterName: String = "must"
        public var parameters: [QueryParameter] = []
    }

    public final class Should: BoolQueryParameter {
        public let parameterName: String = "should"
        public var parameters: [QueryParameter] = []
    }

    public final class MustNot: BoolQueryParameter {
        public let parameterName: String = "must_not"
        public var parameters: [QueryParameter] = []
    }
}
