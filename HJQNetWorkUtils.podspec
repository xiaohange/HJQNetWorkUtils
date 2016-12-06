Pod::Spec.new do |s|
  s.name         = "HJQNetWorkUtils"
  s.version      = "0.0.2"
  s.summary      = "Network monitoring tool based on AFN of HJQNetWorkUtils."
  s.homepage     = "https://github.com/XiaoHanGe/HJQNetWorkUtils"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "韩俊强" => "532167805@qq.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/XiaoHanGe/HJQNetWorkUtils.git", :tag => s.version.to_s }
  s.source_files  = "HJQNetWorkUtils", "HJQNetWorkUtils/**/*.{h,m}"
  s.public_header_files = "HJQNetWorkUtils/**/*.h"
  s.requires_arc = true
  s.dependency "AFNetworking", "~> 2.6.3"
end
