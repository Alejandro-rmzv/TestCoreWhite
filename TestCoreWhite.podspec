Pod::Spec.new do |s|
  s.name             = 'TestCoreWhite'
  s.version          = '1.0.8'
  s.summary          = 'Core + White module for iOS'
  s.description      = 'TestCoreWhite: Core module + TestWhite module that wraps Shared.xcframework.'
  s.homepage         = 'https://github.com/tu-org/TestCoreWhite'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jose Alejandro Ramirez Vergara' => 'alejandro.ramirez@citi.com.mx' }
  s.source           = { :git => 'https://github.com/tu-org/TestCoreWhite.git', :tag => s.version }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.9'

  # ===== Subspec Core (equivale a Sources/TestCoreWhite) =====
  s.subspec 'Core' do |core|
    core.source_files = 'Sources/TestCoreWhite/**/*.{swift}'
    core.frameworks = 'Foundation'
  end

  # ===== Subspec White (equivale a Sources/TestWhite + Shared.xcframework) =====
  s.subspec 'White' do |white|
    white.source_files = 'Sources/TestWhite/**/*.{swift}'
    white.vendored_frameworks = 'Frameworks/Shared.xcframework'

    # Si tu Shared necesita estas libs, ajusta:
    white.frameworks = 'Foundation'

    # Si el XCFramework requiere linking extra (a veces KMP requiere):
    # white.libraries = 'c++'
    # white.frameworks = 'Foundation', 'Security'

    # Si White depende de Core:
    white.dependency 'TestCoreWhite/Core'
  end
end
