module Jkl
  module Text
    class << self

      def sanitize(text)
        remove_short_lines strip_all_tags remove_script_tags text
      end

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

      def remove_short_lines(text)
        text = text.gsub(/\s\s/, "\n")
        str = ""
        # remove short lines - ususally just navigation
        text.split("\n").each do |l|
          str << l unless l.count(" ") < 5
        end
        str
      end
      
    end
  end
end
