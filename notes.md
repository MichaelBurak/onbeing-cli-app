CLI Scraper Notes:


LIB
-Encapsulate classes in Module, use Module file as environment (nokogiri, pry, open-uri, bundler, bundler.require, require_all ‘lib’) for testing

-Scraper class that can scrape
	-get the page
	-make the first level of the other class(list view of podcast names)
	-make the second level(other attributes for class)

-Class for what the scraper class creates
	-goes another level deep
	-has attributes that are to be displayed in CLI(title, date, url, etc.)

-CLI
	-allows users to navigate two levels deep
	-call method starts user interaction
	-user can display a list
	-user can examine items of the list (method)


BIN
	-file with require_relative ‘..lib/‘
	-call method
	-require bundler, pry
	-where the user interacts with

Gemfile

README.md with short description and install instructions

Contributor’s guide

License for code

Notes file(This)
