Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = "<%= args[0] %>"
  s.version = "0.0.1"
  s.summary = "<%= answers["summary"] %>"
  s.description = "<%= answers[:description] %>"

  s.required_ruby_version = ">= 1.8.7"
  s.required_rubygems_version = ">= 1.3.6"

  s.author = "<%= answers[:author] %>"
  s.email = "<%= answers[:email] %>"
  s.homepage = "<%= answers[:homepage] %>"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test}/*`.split("\n")
  
  <% unless answers[:executable].nil? or answers[:executable].blank? %>
  s.bindir = "bin"
  s.executables = ["<%= answers[:executable] %>"]
  s.default_executable = "<%= answers[:executable] %>"
  <% end %>
  s.require_paths = ['lib']
end
