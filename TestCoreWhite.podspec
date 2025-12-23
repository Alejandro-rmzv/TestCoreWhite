Pod::Spec.new do |s|
  s.name = 'TestCoreWhite'
  s.version = '1.0.0'
  s.source = { :git => 'https://github.com/Alejandro-rmzv/TestCoreWhite.git', :tag => s.version }

  s.subspec 'Core' do |core|
    core.source_files = 'Sources/TestCoreWhite/**/*.{swift}'
  end

  s.subspec 'White' do |white|
    white.source_files = 'Sources/TestWhite/**/*.{swift}'
    white.vendored_frameworks = 'Frameworks/Shared.xcframework'
    white.dependency 'TestCoreWhite/Core'
  end
end
