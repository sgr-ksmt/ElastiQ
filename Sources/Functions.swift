//
//  Functions.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/01.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension ElastiQ {
    public final class Functions: QueryParameter {
        public let parameterName: String = "functions"

        var functions: [Any] = []

        init(_ functions: [Any]) {
            self.functions = functions
        }
        public var body: Any {
            return functions.map { _ in [:] }
        }
    }
}
