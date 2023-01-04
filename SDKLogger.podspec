Pod::Spec.new do |spec|

  spec.name         = "SDKLogger"
  spec.version      = "0.0.1"
  spec.summary      = "A CocoaPods library written in Swift"
  spec.description  = <<-DESC
This CocoaPods library helps you log stuff.
                   DESC

  spec.homepage     = "https://github.com/mateszbueno/SDKLogger"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "mateszbueno" => "mateszbueno@gmail.com" }

  spec.ios.deployment_target = "15.5"
  spec.swift_version = "5.6.1"

  spec.source        = { :git => "https://github.com/mateszbueno/SDKLogger.git", :tag => "#{spec.version}" }
  spec.source_files  = "SDKLogger/**/*.{h,m,swift}"

end
