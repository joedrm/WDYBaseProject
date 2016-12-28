
Pod::Spec.new do |s|
  s.name             = 'WDYBaseProject'
  s.version          = '0.1.4'
  s.summary          = '基础工程'
  s.description      = <<-DESC
                      常用的基础工程
                       DESC

  s.homepage         = 'https://github.com/wangdongyang/WDYBaseProject'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '冬日暖阳' => '877197753@qq.com' }
  s.source           = { :git => 'https://github.com/wangdongyang/WDYBaseProject.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  # s.source_files = 'WDYBaseProject/Classes/**/*'

  s.subspec 'Category' do |category|
      category.source_files = 'WDYBaseProject/Classes/Category/**/*'
  end
  # s.resource_bundles = {
  #   'WDYBaseProject' => ['WDYBaseProject/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
