#
# Be sure to run `pod lib lint Payment.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PaymentSDK'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Payment.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/tungnx-teko/Payment'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tungnx-teko' => 'tung.nx@teko.vn' }
  s.source           = { :git => 'https://github.com/tungnx-teko/Payment.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Payment/Sources/**/*.{swift}'
  
  s.resources = 'Payment/Sources/**/*.{xcassets,json,storyboard,xib,xcdatamodeld}'
  
  # s.resource_bundles = {
  #   'Payment' => ['Payment/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  s.static_framework = true
  
  s.dependency 'Networking', :git => 'https://github.com/tungnx-teko/teko-networking-ios.git'
  
end
