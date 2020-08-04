xcodebuild \
-workspace NewsArticle.xcworkspace \
-scheme NewsArticle \
-sdk iphonesimulator \
-destination 'platform=iOS Simulator,name=iPhone 11 Pro Max,OS=13.6' \
test | xcpretty
