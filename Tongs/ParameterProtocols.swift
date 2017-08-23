//
//  ParameterProtocols.swift
//  Tongs
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
    public func add(_ parameter: QueryParameter) {
        self.parameter = parameter
    }
}

public protocol HaveMultipleParameters: HasParameter {
    var parameters: [QueryParameter] { get set }
}

extension HaveMultipleParameters {
    public func add(_ parameter: QueryParameter) {
        self.parameters.append(parameter)
    }
}

public protocol BoolQueryParameter: HaveMultipleParameters {
    var queryName: String { get }
    var body: Any { get }
}

extension BoolQueryParameter {
    public var body: Any {
        return parameters.map { [$0.parameterName: $0.body] }
    }
}
