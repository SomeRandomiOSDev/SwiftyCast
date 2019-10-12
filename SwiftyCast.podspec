Pod::Spec.new do |s|
  
  s.name         = "SwiftyCast"
  s.version      = "1.0.0"
  s.summary      = "Object to UnsafeRawPointer Casting"
  s.description  = <<-DESC
                   A lightweight framework for easily casting objects to and from UnsafeRawPointer types in iOS, macOS, tvOS, and watchOS.
                   DESC
  
  s.homepage     = "https://github.com/SomeRandomiOSDev/SwiftyCast"
  s.license      = "MIT"
  s.author       = { "Joseph Newton" => "somerandomiosdev@gmail.com" }

  s.ios.deployment_target     = '8.0'
  s.macos.deployment_target   = '10.10'
  s.tvos.deployment_target    = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source        = { :git => "https://github.com/SomeRandomiOSDev/SwiftyCast.git", :tag => s.version.to_s }
  s.source_files  = 'SwiftyCast/**/*.swift'
  s.frameworks    = 'Foundation'
  s.requires_arc  = true

  s.swift_versions = ['4.0', '4.2', '5.0']
  s.cocoapods_version = '>= 1.7.3'
  
end
