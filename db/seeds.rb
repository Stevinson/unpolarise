# Seed the different news sources
# First empty DB
Source.destroy_all
# Constants for each category of source
left = 1.0
c_left = 0.25
c_right = -0.25
right = -1.0
# Create the DB entries
# Left
Source.create!(name: "New Yorker", source_score: left, url_base: "www.newyorker.com")
Source.create!(name: "The Guardian", source_score: left, url_base: "www.theguardian.com")
Source.create!(name: "Al Jazeera", source_score: left, url_base: "www.aljazeera.com")
Source.create!(name: "HuffPost Politics", source_score: left, url_base: "huffingtonpost.com/section/politics")
Source.create!(name: "Vice", source_score: left, url_base: "www.vice.com")
Source.create!(name: "Morning Star", source_score: left, url_base: "www.morningstaronline.co.uk")
# Centre left
Source.create!(name: "Bloomburg", source_score: c_left, url_base: "www.bloomberg.com")
Source.create!(name: "Independent", source_score: c_left, url_base: "www.independent.co.uk")
Source.create!(name: "CNN", source_score: c_left, url_base: "edition.cnn.com")
Source.create!(name: "New York Times", source_score: c_left, url_base: "www.nytimes.com")
Source.create!(name: "NBC News", source_score: c_left, url_base: "www.nbcnews.com")
# Centre right
Source.create!(name: "Sunday Times", source_score: c_right, url_base: "www.thetimes.co.uk/?sunday")
Source.create!(name: "Sunday Times", source_score: c_right, url_base: "www.wsj.com/europe")
Source.create!(name: "Sunday Times", source_score: c_right, url_base: "www.telegraph.co.uk")
Source.create!(name: "Sunday Times", source_score: c_right, url_base: "www.economist.com")
# Right
Source.create!(name: "Fox News", source_score: right, url_base: "www.foxnews.com")
Source.create!(name: "Breitbart", source_score: right, url_base: "www.breitbart.com")
Source.create!(name: "Info Wars", source_score: right, url_base: "www.infowars.com")
Source.create!(name: "Daily Mail", source_score: right, url_base: "www.dailymail.co.uk")
Source.create!(name: "The Sun", source_score: right, url_base: "www.thesun.co.uk")
Source.create!(name: "Daily Express", source_score: right, url_base: "www.express.co.uk")
Source.create!(name: "Daily Star", source_score: right, url_base: "www.dailystar.co.uk")

