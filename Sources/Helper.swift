//
//  Helper.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/01.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public typealias ParameterConfigurationBlock<T> = (T) -> Void

internal func addParameter<T>(_ param: T, _ add: (T) -> Void, configurationBlock: ParameterConfigurationBlock<T>) {
    configurationBlock(param)
    add(param)
}
