//
//  FunctionalScore.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/01.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public final class FunctionalScore: QueryParameter, HaveMultipleParameters {
    public let parameterName: String = "functional_score"

    public var parameters: [QueryParameter] = []

    public var body: Any {
        return [:]
    }
}
