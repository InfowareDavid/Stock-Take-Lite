# Uncomment this line to define a global platform for your project
platform :ios, ‘9.2’
# Uncomment this line if you're using Swift
use_frameworks!

target 'Stock Take Lite' do

end

target 'Stock Take LiteTests' do

end

target 'Stock Take LiteUITests' do

end

target 'Stock Take Pro' do

end

target 'Stock Take Enterprise' do

end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end

