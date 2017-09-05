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
    public func term(_ key: String, _ value: QueryValue) -> Self {
        add(ElastiQ.TermLevelQueries.Term(key: key, value: value))
        return self
    }

    @discardableResult
    public func term<K, V: QueryValue>(_ keypath: PartialKeyPath<K>, _ value: V) -> Self {
        return term(keypath._kvcKeyPathString!, value)
    }

    @discardableResult
    public func terms(_ key: String, _ values: [QueryValue]) -> Self {
        add(ElastiQ.TermLevelQueries.Terms(key: key, values: values))
        return self
    }

    @discardableResult
    public func terms<K, V: QueryValue>(_ keypath: PartialKeyPath<K>, _ values: [V]) -> Self {
        return terms(keypath._kvcKeyPathString!, values)
    }

    @discardableResult
    public func range(_ key: String, _ condition: ElastiQ.TermLevelQueries.Range.Condition) -> Self {
        return range(key, [condition])
    }

    @discardableResult
    public func range<K>(_ keypath: PartialKeyPath<K>, _ condition: ElastiQ.TermLevelQueries.Range.Condition) -> Self {
        return range(keypath._kvcKeyPathString!, condition)
    }

    @discardableResult
    public func range(_ key: String, _ conditions: [ElastiQ.TermLevelQueries.Range.Condition]) -> Self {
        add(ElastiQ.TermLevelQueries.Range(key: key, conditions: conditions))
        return self
    }

    @discardableResult
    public func range<K>(_ keypath: PartialKeyPath<K>, _ conditions: [ElastiQ.TermLevelQueries.Range.Condition]) -> Self {
        return range(keypath._kvcKeyPathString!, conditions)
    }
}
