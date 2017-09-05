# ElastiQ
Generate ElasticSearch query in Swift


[![GitHub release](https://img.shields.io/github/release/sgr-ksmt/ElastiQ.svg)](https://github.com/sgr-ksmt/ElastiQ/releases)
![Language](https://img.shields.io/badge/language-Swift%204-orange.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods](https://img.shields.io/badge/Cocoa%20Pods-✓-4BC51D.svg?style=flat)](https://cocoapods.org/pods/ElastiQ)
[![CocoaPodsDL](https://img.shields.io/cocoapods/dt/ElastiQ.svg)](https://cocoapods.org/pods/ElastiQ)

## Feature
- MethodChain
- Type-Safe.
- KeyPath compatible.

## How to use

```swift
@objcMember
class Recipe: NSObject {
    dynamic var cookTimeMin: Int = 0
    dynamic var title: String = ""
}

let query = ElastiQ()
    .range(\Recipe.cookTimeMin, [.lt(30), .gte(10)])

let json = try! query.json()
print(String(data: json, encoding: .utf8))
//-------------------
{
  "query": {
    "range": {
      "cookTimeMin": {
        "gte":10,
        "lt":30
      }
    }
  }
}


let query = ElastiQ()
    .bool({ query in
        query.filter { filter in
            filter
                .term(\Recipe.title, "tomato")
                .range(\Recipe.cookTimeMin, .lt(30))
        }
    })

let json = try! query.json()
print(String(data: json, encoding: .utf8))
//----------------
{
  "query" : {
    "bool" : {
      "filter" : [
        {
          "term" : {
            "title" : "bean"
          }
        },
        {
          "range" : {
            "cookTimeMin" : {
              "lt" : 30
            }
          }
        }
      ]
    }
  }
}
```

## TODO
- [ ] from/size/source/field
- [ ] match
- [ ] aggregation
- [ ] function score query

## Requirements
- iOS 9.0+
- Xcode 9+
- Swift 4+

## Installation

### Carthage

- Add the following to your *Cartfile*:

```bash
github "sgr-ksmt/ElastiQ" ~> 0.6
```

- Run `carthage update`
- Add the framework as described.
<br> Details: [Carthage Readme](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application)


### CocoaPods

**ElastiQ** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ElastiQ', '~> 0.5'
```

and run `pod install`

### Manually Install
Download all `*.swift` files and put your project.

## Change log
Change log is [here](https://github.com/sgr-ksmt/ElastiQ/blob/master/CHANGELOG.md).

## Communication
- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request.:muscle:

## License

**ElastiQ** is under MIT license. See the [LICENSE](LICENSE) file for more info.
