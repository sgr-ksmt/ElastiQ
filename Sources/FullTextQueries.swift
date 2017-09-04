//
//  FullTextQueries.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/04.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension ElastiQ {
    public struct FullTextQueries {
        private init() {}

        public struct Match: QueryParameter {
            public enum Operator: String {
                case and
            }
            public enum ZeroTermsQuery: String {
                case none
                case all
            }
            public let parameterName = "match"

            public let key: String
            public let value: QueryValue
            public let `operator`: Operator?
            public let zeroTermsQuery: ZeroTermsQuery?
            public let cutoffFrequency: QueryNumberValue?
            public var body: Any {
                switch (`operator`, zeroTermsQuery, cutoffFrequency) {
                case (nil, nil, nil):
                    return [key: value]
                default:
                    var subBody: [AnyHashable: Any] = [:]
                    subBody["query"] = value
                    subBody["operator"] = `operator`?.rawValue
                    subBody["zero_terms_query"] = zeroTermsQuery?.rawValue
                    subBody["cutoff_frequency"] = cutoffFrequency
                    return [key: subBody]
                }
            }
        }
    }
}
