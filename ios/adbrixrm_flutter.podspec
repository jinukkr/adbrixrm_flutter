#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint adbrixrm_flutter.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'adbrixrm_flutter'
  s.version          = '1.1.0'
  s.summary          = 'Adbrix Remastered plugin for Flutter project'
  s.description      = <<-DESC
Adbrix Remastered plugin for Flutter project
                       DESC
  s.homepage         = 'https://adbrix.io'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'IGAWORKS' => 'peter@igaworks.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'AdBrixRemastered'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
