require "minitest/autorun"

class TestClosureCompilerContainer < Minitest::Test
  def test_that_it_will_compile_code
    `echo "var x = 32 + 10;" > src/app.js`
    `rake build`
    compiled = File.new('./build/app.min.js').read.chomp
    assert_equal compiled, "var x=42;"
  end
end
