require "test/unit"
require "shoulda"
require "webmock/test_unit"
require "yaml"
require_relative "../../lib/jkl"

class TextCleaningTest < Test::Unit::TestCase
  context "Cleaning Text" do
    
    should "Remove short lines" do
      input = <<-HTML
the cat sat on the mat
a short line
HTML
      result = Jkl::Text::remove_short_lines input
      assert result == "the cat sat on the mat\n"
    end
    
    should "Remove shorter lines" do
      input = <<-HTML
the cat sat on the mat
the cat sat on the slightly fluffy, yet worn and homely mat
a short line
HTML
      result = Jkl::Text::remove_short_lines(input, 8)
      expected = "the cat sat on the slightly fluffy, yet worn and homely mat\n"
      assert_equal expected, result
    end
    
    should "Remove script tags" do
      input = <<-HTML
the cat sat on the mat
<script type="text/javascript" charset="utf-8">
function nofunction(){var bob;}
</script>
a short line
HTML
      result = Jkl::Text::remove_short_lines input
      assert result == "the cat sat on the mat\n"
    end
    
    should "Remove html comments" do
      input = <<-HTML
the cat sat on the mat
<!-- a comment-->
a short line
HTML
      result = Jkl::Text::remove_short_lines input
      assert result == "the cat sat on the mat\n"
    end
    
    should "Remove blank lines" do
      input = <<-HTML
the cat sat on the mat

a short line
HTML
      result = Jkl::Text::remove_short_lines input
      assert result == "the cat sat on the mat\n"
    end
    
    should "Strip all tags" do
      input = <<-HTML
<p>the cat sat on the mat</p>
HTML
      result = Jkl::Text::strip_all_tags input
      assert result == "the cat sat on the mat\n"
    end
  
    should "Clean text" do
      input = <<-HTML
the cat sat on the mat
<script type="text/javascript" charset="utf-8">
 function nofunction(){var bob;}
</script>
<p> some para stuff here </p>
some end stuff here
HTML
      result = Jkl::Text::plain_text(input)
      assert result == "the cat sat on the mat\n"
    end
    
    should "Remove HTML escaped characters" do
      input = <<HTML
Testing, testing, one two three.
<p><strong>The cat didn&#39;t sit on the mat</strong></p>
HTML
      expected = <<EXPECTED
Testing, testing, one two three.
The cat didn't sit on the mat
EXPECTED
      assert_equal expected, Jkl::Text::plain_text(input, 2)
    end
  end
end