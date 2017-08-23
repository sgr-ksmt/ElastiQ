Pod::Spec.new do |s|
  s.name             = "Tongs"
  s.version          = "0.1"
  s.summary          = "Generate ElasticSearch query in Swift"
  s.homepage         = "https://github.com/sgr-ksmt/Tongs"
  # s.screenshots     = ""
  s.license          = 'MIT'
  s.author           = { "Suguru Kishimoto" => "melodydance.k.s@gmail.com" }
  s.source           = { :git => "https://github.com/sgr-ksmt/Tongs.git", :tag => s.version.to_s }
  s.platform         = :ios, '9.0'
  s.requires_arc     = true
  s.source_files     = "Sources/**/*"
end