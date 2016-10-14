# Uncomment this line to define a global platform for your project
platform :ios, ‘9.2’
# Uncomment this line if you're using Swift
use_frameworks!

target 'Stock Take Lite' do
 pod 'Alamofire', '~> 3.5.1'
end

target 'Stock Take LiteTests' do
 pod 'Alamofire', '~> 3.5.1'
end

target 'Stock Take LiteUITests' do
 pod 'Alamofire', '~> 3.5.1'
end

target 'Stock Take Pro' do
 pod 'Alamofire', '~> 3.5.1'
end

target 'Stock Take Enterprise' do
 pod 'Alamofire', '~> 3.5.1'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '2.3'
    end
  end
end

