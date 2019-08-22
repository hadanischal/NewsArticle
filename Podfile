# Uncomment the next line to define a global platform for your project
 platform :ios, '12.0'

target 'NewsArticle' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  # Pods for NewsArticle
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'Kingfisher', '~> 5.0'
  pod 'SwiftLint'

  target 'NewsArticleTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick', '~> 2.1.0'
    pod 'Nimble', '~> 8'
    pod 'Cuckoo', '~> 1.0.6'
    pod 'RxBlocking', '~> 5.0'
    pod 'RxTest',     '~> 5.0'

  end

  target 'NewsArticleUITests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Nimble', '~> 8'
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # This works around a unit test issue introduced in Xcode 10.
      # We only apply it to the Debug configuration to avoid bloating the app size
      if config.name == "Debug" && defined?(target.product_type) && target.product_type == "com.apple.product-type.framework"
        config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = "YES"
      end
    end
  end
end
