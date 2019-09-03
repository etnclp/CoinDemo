platform :ios, '10.0'

use_frameworks!
source 'https://github.com/CocoaPods/Specs.git'

inhibit_all_warnings!

def common_pods
  pod 'Moya/RxSwift', '12.0.1'
  pod 'RxCocoa', '4.5.0'
end

target 'CoinDemo' do
  common_pods
  pod 'XCGLogger', '6.1.0'
  pod 'Kingfisher', '4.10.1'
  pod 'XCoordinator/RxSwift', '1.3.0'
  pod 'Action', '3.11.0'
  pod 'IQKeyboardManagerSwift', '6.2.0'
end

target 'CoinDemoTests' do
  common_pods
  pod 'Quick', '2.0.0'
  pod 'Nimble', '8.0.1'
end

target 'CoinDemoUITests' do
  common_pods
  pod 'Quick', '2.0.0'
  pod 'Nimble', '8.0.1'
end