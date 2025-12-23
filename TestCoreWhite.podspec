Pod::Spec.new do |s|
  s.name             = 'TestCoreWhite'
  s.version          = '1.0.1'
  s.summary          = 'Core + White module for iOS'
  s.description      = <<-DESC
TestCoreWhite: Core module + TestWhite module that wraps Shared.xcframework.
DESC

  s.homepage         = 'https://github.com/Alejandro-rmzv/TestCoreWhite'
  s.license          = { :type => 'MIT', :text => 'MIT License' }
  s.authors          = { 'Jose Alejandro Ramirez Vergara' => 'alejandro.ramirez@citi.com.mx' }

  s.source           = { :git => 'https://github.com/Alejandro-rmzv/TestCoreWhite.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version    = '5.9'

  # ===== Subspec Core =====
  s.subspec 'Core' do |core|
    core.source_files = 'Sources/TestCoreWhite/**/*.{swift}'
    core.frameworks   = 'Foundation'
  end

  # ===== Subspec White (incluye XCFramework) =====
  s.subspec 'White' do |white|
    white.source_files        = 'Sources/TestWhite/**/*.{swift}'
    white.vendored_frameworks = 'Frameworks/Shared.xcframework'
    white.frameworks          = 'Foundation'
    white.dependency          'TestCoreWhite/Core'
  end
end
