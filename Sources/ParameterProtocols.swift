//
//  ParameterProtocols.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/08/23.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public protocol QueryParameter {
    var parameterName: String { get }
    var body: Any { get }
}

public protocol HasSingleParameter: HasParameter {
    var parameter: QueryParameter? { get set  }
}

extension HasSingleParameter {
    public func add<T: QueryParameter>(_ parameter: T) {
        self.parameter = parameter
    }

    public func add<T: QueryParameter>(_ parameter: T, configurationBlock: ParameterConfigurationBlock<T>) {
        configurationBlock(parameter)
        self.parameter = parameter
    }

    public var body: Any {
        return parameter.map { [$0.parameterName: $0.body] } ?? [:]
    }
}

public protocol HaveMultipleParameters: HasParameter {
    var parameters: [QueryParameter] { get set }
}

extension HaveMultipleParameters {
    public func add<T: QueryParameter>(_ parameter: T) {
        self.parameters.append(parameter)
    }

    public func add<T: QueryParameter>(_ parameter: T, configurationBlock: ParameterConfigurationBlock<T>) {
        configurationBlock(parameter)
        self.parameters.append(parameter)
    }

    public var body: Any {
        return parameters.reduce(into: [:]) { $0[$1.parameterName] = $1.body }
    }
}

public protocol BoolQueryParameter: QueryParameter, HaveMultipleParameters {
}

extension BoolQueryParameter {
    public var body: Any {
        return parameters.map { [$0.parameterName: $0.body] }
    }
}
