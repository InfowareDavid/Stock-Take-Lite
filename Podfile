# Uncomment this line to define a global platform for your project
platform :ios, ‘9.2’
# Uncomment this line if you're using Swift
use_frameworks!

target 'Stock Take Lite' do
  pod 'SnapKit', '~> 3.0.2'
  pod 'Alamofire', '~> 4.0.1'
end

target 'Stock Take LiteTests' do
  pod 'SnapKit', '~> 3.0.2'
  pod 'Alamofire', '~> 4.0.1'
end

target 'Stock Take LiteUITests' do
  pod 'SnapKit', '~> 3.0.2'
  pod 'Alamofire', '~> 4.0.1'
end

target 'Stock Take Pro' do
  pod 'SnapKit', '~> 3.0.2'
  pod 'Alamofire', '~> 4.0.1'
end

target 'Stock Take Enterprise' do
  pod 'SnapKit', '~> 3.0.2'
  pod 'Alamofire', '~> 4.0.1'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = ‘3.0’
    end
  end
end

