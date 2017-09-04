//
//  HasFullTextQuery.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/04.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public protocol HasFullTextQuery {
}

extension HasFullTextQuery where Self: HasParameter {
    @discardableResult
    public func match(
        _ key: String,
        _ value: QueryValue,
        _ `operator`: ElastiQ.FullTextQueries.Match.Operator? = nil,
        _ zeroTermsQuery : ElastiQ.FullTextQueries.Match.ZeroTermsQuery? = nil,
        _ cutoffFrequency: QueryNumberValue? = nil) -> Self {
        add(ElastiQ.FullTextQueries.Match(key: key, value: value, operator: `operator`, zeroTermsQuery: zeroTermsQuery, cutoffFrequency: cutoffFrequency))
        return self
    }
}
