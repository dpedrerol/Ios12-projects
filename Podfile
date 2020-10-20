project '07-TaskScrapping.xcodeproj'
# Uncomment the next line to define a global platform for your project\
platform :ios, '13.7'

target '07-TaskScrapping' do
  # Comment the next line if you don't want to use dynamic frameworks\
  use_frameworks!

  # Pods for 07-WebScrapping\
pod 'Alamofire', '~> 5.2'
pod 'Kanna', '~> 5.2.2'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end

end
