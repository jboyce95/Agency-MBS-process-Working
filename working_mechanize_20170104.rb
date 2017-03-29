=begin
require 'rubygems'
require 'mechanize'

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

a.get('http://google.com/') do |page|
  search_result = page.form_with(:name => 'f') do |search|
    search.q = 'Hello world'
  end.submit

  search_result.links.each do |link|
    puts link.text
  end
end
=end

=begin
	
	
require 'mechanize'
require 'logger'

agent = Mechanize.new
agent.log = Logger.new "mech.log"
agent.user_agent_alias = 'Mac Safari'

page = agent.get "http://www.google.com/"
search_form = page.form_with :name => "f"
search_form.field_with(:name => "q").value = "Hello"

search_results = agent.submit search_form
puts search_results.body

=end

require 'rubygems'
require 'mechanize'
require 'launchy'
require 'mail'

## Launchy method opens the webpage for viewing, 
## while mechanize accesses the webpage (but doesn't display the page)

Launchy.open("http://camp/portal")
Launchy.open('http://stackoverflow.com/')
mechanize = Mechanize.new
page = mechanize.get('http://stackoverflow.com/')
page_camp = mechanize.get("http://camp/portal")

=begin
Mechanize.start do |m|
  m.get("http://camp/portal")
end
=end


#Mechanize Form Class provides the form names on webpages
form = page_camp.forms.first # => Mechanize::Form
form.fields.each { |f| puts f.name }

#this section displays the title field of the website => Stack Overflow
puts page.title
