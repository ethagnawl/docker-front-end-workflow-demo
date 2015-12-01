require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end

task :build do
  `docker run --rm -v $(pwd)/src/app.js:/app.js -v $(pwd)/build:/build closure-compiler`
end
