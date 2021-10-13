#
# Be sure to run `pod lib lint Moving.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Moving'
  s.version          = '0.1.1'
  s.summary          = 'Moving is work with collectioniew cell and its feel free to re-order using gesture.'

  s.description      = <<-DESC
  'JP Moving is work with collectioniew cell and its feel free to re-order using gesture.'
                       DESC

  s.homepage         = 'https://github.com/jalpeshGoti91/Moving'
#  s.screenshots     = 'Moving/Example/Moving/video.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jalpeshGoti91' => 'gotijalpesh91@gmail.com' }
  s.source           = { :git => 'https://github.com/jalpeshGoti91/Moving.git', :tag => s.version}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.frameworks = 'UIKit'
  s.ios.deployment_target = '13.0'
  s.platforms = {
    "ios":"13.0"
  }
  s.source_files = 'Classes/*.{h,m,swift}*'
  
  # s.resource_bundles = {
  #   'Moving' => ['Moving/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   
  # s.dependency 'AFNetworking', '~> 2.3'
end
