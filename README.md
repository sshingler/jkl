# jkl

jkl (Jakal) does these things:

* Connects to URLs.
* Gets stuff out of RSS feeds.
* Gets the main content from web pages
* Gets a set of metadata from a web page (using the calais gem)

# Sample usage

For example - if you had a RSS feed:

  require "jkl"
  
		feed = "http://www.topix.net/rss/search/article?x=0&y=0&q=London"

You could collect some metadata from the links in that feed, thus:
  
		tags = []
		Jkl::links(feed).each do |link|
			tags << Jkl::tags("my_calais_key",link)
		end
  
A metadata sample might look something like this:

		{
				"Person"=>["Barack Obama", "Hillary Clinton"], 
				"Position"=>["Secretary of State"]
		}
  
It is hosted at [gemcutter](http://gemcutter.org/gems/jakal)

		gem install jakal

# LICENSE:

(The MIT License)

Copyright (c) 2009 sshingler

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.