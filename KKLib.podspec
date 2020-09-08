Pod::Spec.new do |s|
  s.name             = 'KKLib'
  s.version          = '0.0.2'
  s.summary          = '封装常用的功能的分类'
  s.description      = <<-DESC
  封装常用的分类和功能。
                       DESC
  s.homepage         = 'https://github.com/GavinKangDeveloper/KKLib'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KangKang' => '776362265@qq.com.com' }
  s.source           = { :git => 'https://github.com/GavinKangDeveloper/KKLib.git', :tag => s.version.to_s }
  s.social_media_url = 'https://juejin.im/user/1433418895468397/posts'
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  
  s.resource_bundles = {
      'KKLib' => ['KKLib/Assets/*.xcassets']
  }

  s.subspec 'Categories' do |ss|
      ss.source_files = 'KKLib/Classes/Categories/*.{h,m}'
  end
  
  s.subspec 'Tools' do |ss|
      ss.source_files = 'KKLib/Classes/Tools/*.{h,m}'
  end
  
  s.subspec 'Configs' do |ss|
      ss.source_files = 'KKLib/Classes/Configs/*.{h,m}'
  end
  
end
