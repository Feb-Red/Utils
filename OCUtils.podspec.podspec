

Pod::Spec.new do |s|

  s.name         = "OCUtils.podspec"
  s.version      = "0.0.2"
  s.summary      = "object-c utils"
  s.homepage     = "https://github.com/Fromlocal"

  s.license      = "MIT"
  s.author             = { "xu_cheng" => "645710469@qq.com" }

   s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Fromlocal/Utils.git", :tag => s.version }
  s.source_files  = 'Object_C_Utils/Object_C_Utils/*.{h,m}'
  s.exclude_files = "Classes/Exclude"

    # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
   s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
