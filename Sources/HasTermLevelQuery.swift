//
//  HasTermLevelQuery.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/04.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public protocol HasTermLevelQuery {
}

extension HasTermLevelQuery where Self: HasParameter {
    @discardableResult
    public func term(_ key: QueryKey, _ value: QueryValue) -> Self {
        add(ElastiQ.TermLevelQueries.Term(key: key.key, value: value))
        return self
    }

    @discardableResult
    public func terms(_ key: QueryKey, _ values: [QueryValue]) -> Self {
        add(ElastiQ.TermLevelQueries.Terms(key: key.key, values: values))
        return self
    }

    @discardableResult
    public func range(_ key: QueryKey, _ condition: ElastiQ.TermLevelQueries.Range.Condition) -> Self {
        return range(key.key, [condition])
    }

    @discardableResult
    public func range(_ key: QueryKey, _ conditions: [ElastiQ.TermLevelQueries.Range.Condition]) -> Self {
        add(ElastiQ.TermLevelQueries.Range(key: key.key, conditions: conditions))
        return self
    }
}
