require "jkl"


s = <<-EOF;
some start stuff here
<script type="text/javascript" charset="utf-8">
ESPN.include([
	'http://a.espncdn.com/prod/scripts/espn.core.min.200908261347.js',
	'http://a.espncdn.com/prod/scripts/registration/myEspn.min.200909301125.js',
	'http://a.espncdn.com/prod/scripts/insider/espn.insider.200906091431.js'
]);
</script>
<p> some para stuff here </p>
some end stuff here
  EOF
  
#  puts Jkl::sanitize s
puts s.gsub(/((<[\s\/]*script\b[^>]*>)([^>]*)(<\/script>))/i,"")
