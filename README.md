# Tongs
Generate ElasticSearch query in Swift


[![GitHub release](https://img.shields.io/github/release/sgr-ksmt/Tongs.svg)](https://github.com/sgr-ksmt/Tongs/releases)
![Language](https://img.shields.io/badge/language-Swift%204-orange.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods](https://img.shields.io/badge/Cocoa%20Pods-✓-4BC51D.svg?style=flat)](https://cocoapods.org/pods/Tongs)
[![CocoaPodsDL](https://img.shields.io/cocoapods/dt/Tongs.svg)](https://cocoapods.org/pods/Tongs)

## How to use

```swift
let query = ElastiQ()
    .bool({ query in
        query.filter { filter in
            filter
                .term(\Recipe.title, "tomato")
                .range(\Recipe.cookTimeMin, .lt(30))
        }
    })
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
github "sgr-ksmt/Tongs" ~> 0.1
```

- Run `carthage update`
- Add the framework as described.
<br> Details: [Carthage Readme](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application)


### CocoaPods

**Tongs** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Tongs', '~> 0.1'
```

and run `pod install`

### Manually Install
Download all `*.swift` files and put your project.

## Change log
Change log is [here](https://github.com/sgr-ksmt/Tongs/blob/master/CHANGELOG.md).

## Communication
- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request.:muscle:

## License

**Tongs** is under MIT license. See the [LICENSE](LICENSE) file for more info.