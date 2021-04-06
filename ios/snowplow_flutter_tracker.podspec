#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint snowplow_flutter_tracker.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'snowplow_flutter_tracker'
  s.version          = '0.0.1'
  s.summary          = 'Snowplow event tracker for Flutter. Add analytics to your Flutter apps and games http:&#x2F;&#x2F;snowplowanalytics.com'
  s.description      = <<-DESC
Snowplow event tracker for Flutter. Add analytics to your Flutter apps and games http:&#x2F;&#x2F;snowplowanalytics.com
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'SnowplowTracker', '~> 1.6.2'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
