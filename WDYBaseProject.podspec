
Pod::Spec.new do |s|
  s.name             = 'WDYBaseProject'
  s.version          = '1.0.7'
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
      category.dependency 'WDYBaseProject/Macros'
  end

  # 工具类
  s.subspec 'Utils' do |utils|
      utils.source_files = 'WDYBaseProject/Classes/Utils/**/*'
      utils.dependency 'AFNetworking', '3.1.0'
      utils.dependency 'WDYBaseProject/Category'
      utils.dependency 'WDYBaseProject/Macros'
      utils.dependency 'MJExtension'
  end

  # 常用的宏
  s.subspec 'Macros' do |macros|
      macros.source_files = 'WDYBaseProject/Classes/Macros/**/*'
  end

  # 常用的UI控件,基类
  s.subspec 'UIComponent' do |ui|
      ui.source_files = 'WDYBaseProject/Classes/UIComponent/**/*'
      ui.dependency 'WDYBaseProject/Utils'
      ui.dependency 'WDYBaseProject/Macros'
  end

  # 导航控制器组件
  s.subspec 'Navigation' do |navigation|
      navigation.source_files = 'WDYBaseProject/Classes/Navigation/**/*'
  end

  # 主要是一些和项目容易起冲突的文件，或者对其它的第三方有依赖的文件
  # s.subspec 'Other' do |other|
  #     other.source_files = 'WDYBaseProject/Classes/Other/**/*'
  #     other.dependency 'SDWebImage', '3.8.0'
  # end

  # 新特性介绍组件
  s.subspec 'NewFeatureComponent' do |newFeature|
      newFeature.source_files = 'WDYBaseProject/Classes/NewFeatureComponent/**/*'
  end

  # 广告展示组件
  s.subspec 'ADComponent' do |ad|
      ad.source_files = 'WDYBaseProject/Classes/ADComponent/**/*'
  end

  # UITableView相关组件
  s.subspec 'TableViewComponent' do |table|
      table.source_files = 'WDYBaseProject/Classes/TableViewComponent/**/*'
  end

  # 基础模型类组件
  s.subspec 'BaseModel' do |model|
      model.source_files = 'WDYBaseProject/Classes/BaseModel/**/*'
      model.dependency 'MJExtension'
      model.dependency 'WDYBaseProject/Utils'
  end

 # Toast提示
  s.subspec 'Toast' do |toast|
      toast.source_files = 'WDYBaseProject/Classes/Toast/**/*'
      toast.dependency 'WDYBaseProject/Utils'
      toast.dependency 'WDYBaseProject/Macros'
      toast.dependency 'WDYBaseProject/Category'
  end

  # Toast提示
   s.subspec 'VideoMaker' do |videoMaker|
       videoMaker.source_files = 'WDYBaseProject/Classes/VideoMaker/**/*'
       videoMaker.dependency 'WDYBaseProject/Category'
       videoMaker.dependency 'SDWebImage', '3.8.0'
   end

  s.subspec 'PublicHeaders' do |publicHeaders|
      publicHeaders.source_files = 'WDYBaseProject/Classes/PublicHeaders/**/*'
      publicHeaders.dependency 'WDYBaseProject/Utils'
      publicHeaders.dependency 'WDYBaseProject/Macros'
      publicHeaders.dependency 'WDYBaseProject/Category'
      publicHeaders.dependency 'WDYBaseProject/Toast'
      publicHeaders.dependency 'WDYBaseProject/BaseModel'
      publicHeaders.dependency 'WDYBaseProject/TableViewComponent'
      publicHeaders.dependency 'WDYBaseProject/ADComponent'
      publicHeaders.dependency 'WDYBaseProject/NewFeatureComponent'
      publicHeaders.dependency 'WDYBaseProject/Navigation'
      publicHeaders.dependency 'WDYBaseProject/UIComponent'
  end
  # s.resource_bundles = {
  #   'WDYBaseProject' => ['WDYBaseProject/WDYBaseProject.bundle']
  # }
  s.resource     = 'WDYBaseProject/Classes/WDYBaseProject.bundle'

  # s.public_header_files = 'WDYBaseProject/Classes/PublicHeaders/**/*.h'
  # s.header_dir = 'WDYBaseProject/Classes/PublicHeaders'
  s.frameworks = 'UIKit', 'MapKit', 'AVFoundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
