# Payment

[![CI Status](https://img.shields.io/travis/tungnx-teko/Payment.svg?style=flat)](https://travis-ci.org/tungnx-teko/Payment)
[![Version](https://img.shields.io/cocoapods/v/Payment.svg?style=flat)](https://cocoapods.org/pods/Payment)
[![License](https://img.shields.io/cocoapods/l/Payment.svg?style=flat)](https://cocoapods.org/pods/Payment)
[![Platform](https://img.shields.io/cocoapods/p/Payment.svg?style=flat)](https://cocoapods.org/pods/Payment)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 10.0 or above

## Installation

Install PaymentSDK via pod

```ruby
pod 'PaymentSDK', :git => 'https://github.com/tungnx-teko/teko-payment-ios.git'
```

Setup configs before call functions
```swift
import PaymentSDK
``` 

```swift
private func setupPayment() {
let configs = PaymentConfigsBuilder()
.clientCode(...)
.baseUrl(...)
.secretKey(...)
.serviceCode(...)
.terminalCode(...)
.returnUrl(...)
.cancelUrl(...)
.build()
Payment.setConfigs(configs)
}
```

## Author

tungnx-teko, tung.nx@teko.vn

## License

Payment is available under the MIT license. See the LICENSE file for more info.
