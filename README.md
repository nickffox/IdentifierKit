
![IdentifierKit](https://raw.githubusercontent.com/NicholasFFox/IdentifierKit/master/identifierkit.png)

IdentifierKit allows you to easily replace `String` and `Int` identifier with strongly typed identifiers.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Thanks](#thanks)
- [License](#license)


## Features

- [x] 💪 Strongly typed identifiers
- [x] 🐟 Full `Codeable` compatibility


## Requirements

<!-- * iOS 8.0+ / macOS 10.10+ / tvOS 9.0+ / watchOS 2.0+ -->
* iOS 8.0+
* Xcode 9.2+
* Swift 4+

## Installation

### CocoaPods

`pod 'IdentifierKit'`

### Carthage

`github "NicholasFFox/IdentifierKit"`

### Swift Package Manager

* Coming Soon

## Usage

Use IdentifierKit to replace weakly typed `String` and `Int` identifiers in your model layer with strongly typed identifier objects.

Step 1: Create an unique type to represent your identifier - empty enums work great for this!

```Swift
enum UserIdentifier: Identifier {}
```

Step 2: Use a typealias to give yourself syntactic sugar and avoid typing the generic syntax everywhere.
```Swift
typealias UserId = IntIdentifier<UserIdentifier>
```

Step 3: Replace your `Int` (or `String`) identifer with your newly created type.
```Swift
struct User: Codable {
  let id: UserId
  let firstName: String
  let lastName: String
}
``` 


IdentifierKit works seamlessly with the `Codable` protocol, so you won't have to make any changes to your existing JSON.

```Swift
let json = """
{
  "id": 2,
  "firstName": "Tim",
  "lastName": "Cook"
}
""".data(using: .utf8)!

let user = try JSONDecoder().decode(User.self, from: json)
``` 



## Thanks

Thanks to [Daniel Steinberg](https://www.twitter.com/dimsumthinking) for inspiring this framework with your talk on phantom types.

## License

IdentifierKit is released under the MIT license. See [LICENSE](https://github.com/NicholasFFox/IdentifierKit/blob/master/LICENSE) for details.