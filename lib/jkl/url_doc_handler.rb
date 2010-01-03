require 'hpricot'
require 'rest_client'

module Jkl
  module Text
    class << self

      def sanitize(text)
        remove_blank_lines strip_all_tags remove_script_tags text
      end

      def strip_all_tags(text)
        text.gsub(/<\/?[^>]*>/, "")
      end
      
      def remove_blank_lines(text)
        text.gsub(/\n\r|\r\n|\n|\r/,"")
      end
      
      def remove_html_comments(text)
        text.gsub(/<!--(.|\s)*?-->/,"")
      end
      
      def remove_script_tags(text)
        text = remove_html_comments(text)
        text.gsub(/((<[\s\/]*script\b[^>]*>)([^>]*)(<\/script>))/i,"")
      end

    end
  end
end
