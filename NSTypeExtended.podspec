Pod::Spec.new do |s|


  s.name         = "NSTypeExtended"
  s.version      = "1.0.0"
  s.summary      = "NSTypeExtended is a subclass of UILabel what allow to use placehilder as mask"

  s.description  = <<-DESC
                   A longer description of NSTypeExtended in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/andriitishchenko/NSTypeExtended"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Andrii Tishchenko" => "andrii.tishchenko+github@gmail.com" }

  s.platform     = :ios
  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/andriitishchenko/nstypeextended.git", :tag => "v#{s.version.to_s}" }

  s.source_files  = "src/**/*.{h,m}"
  s.exclude_files = "extendedDemo/"
  s.public_headers_files = "src/*.h"

  s.requires_arc = true

end