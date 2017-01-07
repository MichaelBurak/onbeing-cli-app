# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
CLI within lib/cli.rb is called from bin/philosophy_podcast.rb and allows user to interact through command line.
- [x] Pull data from an external source
lib/scraper.rb performs main scraping, then objects are instantiated through lib/podcast.rb's self.add_podcasts method using this scraped information.
- [x] Implement both list and detail views
List view is implemented through asking a user to select 10 episodes of the podcast they would like to display.
Detail view includes a singular podcast and tells the user its title, the featured guest, and a description taken from the site. 
