//
//  ElastiQ.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/08/23.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public typealias ParameterConfigurationBlock<T> = (T) -> Void

public final class ElastiQ: HaveMultipleParameters {
    public var parameters: [QueryParameter] = []

    public init() {}
    
    @discardableResult
    public func query(_ configurationBlock: ParameterConfigurationBlock<Query>) -> Self {
        add(Query(), configurationBlock: configurationBlock)
        return self
    }

    public var body: Any {
        return Dictionary(uniqueKeysWithValues: parameters.map { ($0.parameterName, $0.body) })
    }

    public func json() throws -> Data {
        return try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
    }
}

