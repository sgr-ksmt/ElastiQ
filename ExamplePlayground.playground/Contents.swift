//: Playground - noun: a place where people can play

import UIKit
import ElastiQ

class Recipe {
    @objc dynamic var cookTimeMin: Int = 0
    @objc dynamic var title: String = ""
}

func printJSON(_ query: ElastiQ) {
    let jsonData = try! query.json()
    let json = String(data: jsonData, encoding: .utf8)!
    print(json)
}

do {
    let query = ElastiQ().query {
        $0.term(\Recipe.cookTimeMin, 10)
    }

    printJSON(query)
}

print("----------------")

do {
    let query = ElastiQ().query {
        $0.terms(\Recipe.cookTimeMin, [10, 15, 20])
    }

    printJSON(query)
}

print("----------------")

do {
    let query = ElastiQ().query {
        $0.range(\Recipe.cookTimeMin, .lt(10))
    }
    printJSON(query)
}

print("----------------")

do {
    let query = ElastiQ()
        .range(\Recipe.cookTimeMin, [.lt(30), .gte(10)])

    printJSON(query)
}

print("----------------")

do {
    let query = ElastiQ().query {
        $0.bool({ query in
            query.filter { filter in
                filter
                    .term(\Recipe.title, "bean")
                    .range(\Recipe.cookTimeMin, .lt(30))
            }
        })
    }

    printJSON(query)
}

print("----------------")

do {
    let query = ElastiQ().query {
        $0.bool({ query in
            query
                .filter { filter in
                    filter
                        .term(\Recipe.title, "bean")
                        .range(\Recipe.cookTimeMin, .lt(30))
                }
                .must { must in
                    must
                        .term(\Recipe.title, "bean")
                        .range(\Recipe.cookTimeMin, .lt(30))
                }
                .should { should in
                    should
                        .term(\Recipe.title, "bean")
                        .range(\Recipe.cookTimeMin, .lt(30))
                }
                .mustNot { mustNot in
                    mustNot
                        .term(\Recipe.title, "bean")
                        .range(\Recipe.cookTimeMin, .lt(30))
            }
        })
    }
    printJSON(query)
}

print("----------------")

do {
    let query = ElastiQ().query {
        $0.functionalScore({ functionalScore in
            functionalScore
                .boost(5)
                .maxBoost(42)
                .minScore(42)
                .scoreMode(.max)
                .boostMode(.multiply)
        })
    }
    printJSON(query)
}

print("----------------")

do {
    let query = ElastiQ()
        .from(5)
        .size(10)
        .query({ _ in })

    printJSON(query)
}
