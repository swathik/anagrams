Gem::Specification.new do |s|
  s.name               = "anagrams"
  s.version            = "0.0.1"
  s.default_executable = "anagrams"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Swathi Kantharaja"]
  s.date = %q{2012-10-24}
  s.description = %q{Returns a list of anagrams from a given list of words or from a dictionary}
  s.files = ["Rakefile", "lib/anagrams.rb"]
  s.homepage = %q{http://www.swathik.com/2012/10/finding-anagrams-in-ruby.html}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Find a list of anagrams from the dictionary}
  s.add_dependency('color_text', '>= 0.0.3')
  s.add_dependency('set')
  
  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

