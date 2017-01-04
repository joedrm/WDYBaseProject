
Pod::Spec.new do |s|
  s.name             = 'WDYBaseProject'
  s.version          = '0.4.9'
  s.summary          = '基础工程'
  s.description      = <<-DESC
                      常用的基础工程
                       DESC

  s.homepage         = 'https://github.com/wangdongyang/WDYBaseProject'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '冬日暖阳' => '877197753@qq.com' }
  s.source           = { :git => 'https://github.com/wangdongyang/WDYBaseProject.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  # 常用的分类
  s.subspec 'Category' do |category|
      category.source_files = 'WDYBaseProject/Classes/Category/**/*'
  end

  # 工具类
  s.subspec 'Utils' do |utils|
      utils.source_files = 'WDYBaseProject/Classes/Utils/**/*'
      utils.dependency 'AFNetworking', '3.1.0'
  end

  # 常用的宏
  s.subspec 'Macros' do |macros|
      macros.source_files = 'WDYBaseProject/Classes/Macros/**/*'
  end

  # 常用的UI控件,基类
  s.subspec 'UIComponent' do |ui|
      ui.source_files = 'WDYBaseProject/Classes/UIComponent/**/*'
  end

  # 导航控制器组件
  s.subspec 'Navigation' do |navigation|
      navigation.source_files = 'WDYBaseProject/Classes/Navigation/**/*'
  end

  # 主要是一些和项目容易起冲突的文件，或者对其它的第三方有依赖的文件
  s.subspec 'Other' do |other|
      other.source_files = 'WDYBaseProject/Classes/Other/**/*'
      other.dependency 'SDWebImage', '3.8.0'
  end

  # s.resource_bundles = {
  #   'WDYBaseProject' => ['WDYBaseProject/Assets/*.png']
  # }

  # s.source_files  = 'WDYBaseProject/Classes/WDYBaseProject.h'
  # s.public_header_files = 'WDYBaseProject/Classes/WDYBaseProject.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
