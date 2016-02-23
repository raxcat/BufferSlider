#
# Be sure to run `pod lib lint BufferSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BufferSlider"
  s.version          = "0.1.0"
  s.summary          = "An UISlider subclass"
  s.description      = "An UISlider subclass shows additional information: buffering status."
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       DESC

  s.homepage         = "https://github.com/raxcat/BufferSlider"
  s.license          = 'MIT'
  s.author           = { "Raxcat Liu(Brian Liu)" => "raxcat@gmail.com" }
  s.source           = { :git => "https://github.com/raxcat/BufferSlider.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'BufferSlider' => ['Pod/Assets/*.png']
  }

end
