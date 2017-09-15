//
//  GeoQueries.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/12.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension ElastiQ {
    public struct GeoQueries {
        private init() {}

        public struct GeoDistance: QueryParameter {
            public typealias Location = (key: String, lat: Latitude, lon: Longitude)
            public typealias Latitude = QueryNumberValue
            public typealias Longitude = QueryNumberValue

            public enum Distance {
                case mi(QueryNumberValue)
                case yd(QueryNumberValue)
                case ft(QueryNumberValue)
                case `in`(QueryNumberValue)
                case km(QueryNumberValue)
                case m(QueryNumberValue)
                case cm(QueryNumberValue)
                case mm(QueryNumberValue)
                case nauticalMile(QueryNumberValue)

                var value: String {
                    switch self {
                    case .mi(let value): return "\(value)mi"
                    case .yd(let value): return "\(value)yd"
                    case .ft(let value): return "\(value)ft"
                    case .in(let value): return "\(value)in"
                    case .km(let value): return "\(value)km"
                    case .m(let value): return "\(value)m"
                    case .cm(let value): return "\(value)cm"
                    case .mm(let value): return "\(value)mm"
                    case .nauticalMile(let value): return "\(value)NM"
                    }
                }
            }

            public enum DistanceType: String {
                case arc // Default
                case plane
            }


            public let parameterName: String = "geo_distance"
            let location: Location
            let distance: Distance?
            let distanceType: DistanceType?

            init(location: Location, distance: Distance? = nil, distanceType: DistanceType? = nil) {
                self.location = location
                self.distance = distance
                self.distanceType = distanceType
            }

            public var body: Any {
                var body: [AnyHashable: Any] = [:]
                body[location.key] = ["lat": location.lat, "lon": location.lon]
                body["distance"] = distance?.value
                body["distance_type"] = distanceType?.rawValue
                return body
            }
        }
    }
}
