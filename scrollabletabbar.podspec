Pod::Spec.new do |spec|
  spec.name             = 'ScrollableTabbar'
  spec.version          = '1.0.0'
  spec.license          = { :type => 'MIT' }
  spec.homepage         = 'https://github.com/ibhupi/ScrollableTabBar'
  spec.authors          = {'Bhupendra Singh' => 'ibhupi@gmail.com'}
  spec.summary          = 'Scrollable Tab Bar library for iOS'
  spec.source           = {:git => 'git@bitbucket.org:ibhupi/workspace.git', :tag => '1.0.0'}
  spec.source_files     = 'ScrollableTabbar/*.{h,m}'
  spec.resources        = 'ScrollableTabbar/*.xib'
  spec.requires_arc     = true
end