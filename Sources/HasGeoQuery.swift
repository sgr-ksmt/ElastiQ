//
//  HasGeoQuery.swift
//  ElastiQ
//
//  Created by suguru-kishimoto on 2017/09/12.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import Foundation

public protocol HasGeoQuery {
}

extension HasGeoQuery where Self: HasParameter {
    @discardableResult
    public func geoDistance(
        _ location: ElastiQ.GeoQueries.GeoDistance.Location,
        _ distance: ElastiQ.GeoQueries.GeoDistance.Distance? = nil,
        distanceType: ElastiQ.GeoQueries.GeoDistance.DistanceType? = nil) -> Self {
        add(ElastiQ.GeoQueries.GeoDistance(location: location, distance: distance, distanceType: distanceType))
        return self
    }
}
