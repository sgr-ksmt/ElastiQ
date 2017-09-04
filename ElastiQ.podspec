Pod::Spec.new do |s|
  s.name             = "ElastiQ"
  s.version          = "0.4"
  s.summary          = "Generate ElasticSearch query in Swift"
  s.homepage         = "https://github.com/sgr-ksmt/ElastiQ"
  # s.screenshots     = ""
  s.license          = 'MIT'
  s.author           = { "Suguru Kishimoto" => "melodydance.k.s@gmail.com" }
  s.source           = { :git => "https://github.com/sgr-ksmt/ElastiQ.git", :tag => s.version.to_s }
  s.platform         = :ios, '9.0'
  s.requires_arc     = true
  s.source_files     = "Sources/**/*"
end
