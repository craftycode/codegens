Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = "codegens"
  s.version = "0.0.1"
  s.summary = "Code generation with a central repository for generators."
  s.description = "Codegens is a commandline code generator that makes packaging, sharing and using generators easy."

  s.required_ruby_version = ">= 1.8.7"
  s.required_rubygems_version = ">= 1.3.6"

  s.author = "Anthony Crumley"
  s.email = "anthony.crumley@gmail.com"
  s.homepage = "https://github.com/craftycode/codegens"
  s.rubyforge_project = "codegens"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test}/*`.split("\n")
  
  s.bindir = "bin"
  s.executables = ["gen"]
  s.default_executable = "gen"
  s.require_paths = ['lib']

  s.add_dependency('thor', '~> 0.14.6')
end
