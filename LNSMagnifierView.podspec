#
# Be sure to run `pod lib lint LNSMagnifierView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LNSMagnifierView'
  s.version          = '1.0.0'
  s.summary          = 'An easy-to-use LNSMagnifierView for iOS development.'
  s.swift_version    = '4.1'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'easy-to-use Swift Magnifier View for iOS development'

  s.homepage         = 'https://github.com/LinusLing/LNSMagnifierView'
  s.screenshots      = 'https://i.loli.net/2020/08/25/RJK94Y1ULm2xjsA.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LinusLing' => 'linusling419@gmail.com' }
  s.source           = { :git => 'https://github.com/LinusLing/LNSMagnifierView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'LNSMagnifierView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LNSMagnifierView' => ['LNSMagnifierView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
