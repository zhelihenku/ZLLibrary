Pod::Spec.new do |s|
	s.name         = 'ZLLibrary'
    s.version      = '0.0.1'
    s.summary      = 'ZLLibrary.'
    s.homepage     = 'https://github.com/zhelihenku/ZLLibrary'
    s.license      = 'MIT'
    s.authors      = { 'PhilWang' => 'wangpeng@zhelihenku.com' }
    s.platform     = :ios, '9.0'
    s.source       = { :git => "https://github.com/zhelihenku/ZLLibrary.git", :tag => s.version }
    s.source_files = 'ZLLibrary/**/*.{h,m}'
    s.requires_arc = true
end