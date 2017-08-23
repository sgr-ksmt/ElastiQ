//
//  NestedQuery.swift
//  Tongs
//
//  Created by suguru-kishimoto on 2017/08/23.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public protocol HasParameter: class {
    func add(_ parameter: QueryParameter)
}

extension HasParameter {
    public func term(_ key: String, _ value: QueryValue) -> Self {
        add(Tongs.Parameter.Term(key: key, value: value))
        return self
    }

    public func term<K, V: QueryValue>(_ keypath: KeyPath<K, V>, _ value: V) -> Self {
        return term(keypath._kvcKeyPathString!, value)
    }

    public func terms(_ key: String, _ values: [QueryValue]) -> Self {
        add(Tongs.Parameter.Terms(key: key, values: values))
        return self
    }

    public func terms<K, V: QueryValue>(_ keypath: KeyPath<K, V>, _ values: [V]) -> Self {
        return terms(keypath._kvcKeyPathString!, values)
    }

    public func range(_ key: String, _ condition: Tongs.Parameter.Range.Condition) -> Self {
        return range(key, [condition])
    }

    public func range<K, V: QueryNumberValue>(_ keypath: KeyPath<K, V>, _ condition: Tongs.Parameter.Range.Condition) -> Self {
        return range(keypath._kvcKeyPathString!, condition)
    }

    public func range(_ key: String, _ conditions: [Tongs.Parameter.Range.Condition]) -> Self {
        add(Tongs.Parameter.Range(key: key, conditions: conditions))
        return self
    }

    public func range<K, V: QueryNumberValue>(_ keypath: KeyPath<K, V>, _ conditions: [Tongs.Parameter.Range.Condition]) -> Self {
        return range(keypath._kvcKeyPathString!, conditions)
    }
}
