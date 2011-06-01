module Jkl
  module Text
    class << self

      def plain_text(document, words_on_line = 5)
        CGI::unescapeHTML(
            remove_short_lines(
                strip_all_tags(
                    remove_script_tags(document)), words_on_line))
      end
      alias :sanitize :plain_text

      def strip_all_tags(text)
        text.gsub(/<\/?[^>]*>/, "")
      end

      def remove_blank_lines(text)
        text.gsub(/\n\r|\r\n|\n|\r/, "")
      end

      def remove_html_comments(text)
        text.gsub(/<!--(.|\s)*?-->/, "")
      end

      def remove_script_tags(text)
        text = remove_html_comments(text)
        text.gsub(/((<[\s\/]*script\b[^>]*>)([^>]*)(<\/script>))/i, "")
      end

      def remove_short_lines(text, words_on_line = 5)
        text = text.gsub(/\s\s/, "\n")
        str = ""
        text.split("\n").each do |line|
          str << "#{line}\n" unless line.count(" ") < words_on_line
        end
        str
      end
    end
  end
end
