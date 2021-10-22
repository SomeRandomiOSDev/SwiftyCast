Pod::Spec.new do |s|
  
  s.name         = "SwiftyCast"
  s.version      = "1.0.3"
  s.summary      = "Object to UnsafeRawPointer Casting"
  s.description  = <<-DESC
                   A lightweight framework for easily casting objects to and from UnsafeRawPointer types in iOS, macOS, tvOS, and watchOS.
                   DESC
  
  s.homepage     = "https://github.com/SomeRandomiOSDev/SwiftyCast"
  s.license      = "MIT"
  s.author       = { "Joe Newton" => "somerandomiosdev@gmail.com" }
  s.source       = { :git => "https://github.com/SomeRandomiOSDev/SwiftyCast.git", :tag => s.version.to_s }

  s.ios.deployment_target     = '9.0'
  s.macos.deployment_target   = '10.10'
  s.tvos.deployment_target    = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files      = 'Sources/SwiftyCast/*.swift'
  s.swift_versions    = ['4.0', '4.2', '5.0']
  s.cocoapods_version = '>= 1.7.3'

  s.test_spec 'Tests' do |ts|
    ts.ios.deployment_target     = '9.0'
    ts.macos.deployment_target   = '10.10'
    ts.tvos.deployment_target    = '9.0'
    ts.watchos.deployment_target = '2.0'

    ts.source_files              = 'Tests/SwiftyCastTests/*Tests.swift'
  end
  
end
