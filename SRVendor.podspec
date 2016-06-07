Pod::Spec.new do |s|

  s.name         = "SRVendor"
  s.version      = "0.1.0"
  s.summary      = "services of skinrun."

  s.homepage     = "https://github.com/ss-lihao/SRVendor"

  s.license      = "MIT"

  s.author             = { "skinrun_iOS" => "ss_lihao@126.com" }

  s.platform     = :ios
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/ss-lihao/SRVendor.git", :tag => "0.1.0"}

  s.source_files  = "SRVendor/**/*.{h,m}"

  s.requires_arc = true

end
