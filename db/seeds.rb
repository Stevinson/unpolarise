# Seed the different news sources
# First empty DB
Source.destroy_all
# Constants for each category of source
left = 1
c_left = 0.25
c_right = -0.25
right = -1
# Create the DB entries
# Left
Source.create!(name: "New Yorker", source_score: left, url: "www.newyorker.com")
Source.create!(name: "The Guardian", source_score: left, url: "www.theguardian.com")
Source.create!(name: "Al Jazeera", source_score: left, url: "www.aljazeera.com")
Source.create!(name: "HuffPost Politics", source_score: left, url: "huffingtonpost.com/section/politics")
Source.create!(name: "Vice", source_score: left, url: "www.vice.com")
Source.create!(name: "Morning Star", source_score: left, url: "www.morningstaronline.co.uk")
# Centre left
Source.create!(name: "Bloomburg", source_score: c_left, url: "www.bloomberg.com")
Source.create!(name: "Independent", source_score: c_left, url: "www.independent.co.uk")
Source.create!(name: "CNN", source_score: c_left, url: "edition.cnn.com")
Source.create!(name: "New York Times", source_score: c_left, url: "www.nytimes.com")
Source.create!(name: "NBC News", source_score: c_left, url: "www.nbcnews.com")
# Centre right
Source.create!(name: "Sunday Times", source_score: c_right, url: "www.thetimes.co.uk/?sunday")
Source.create!(name: "Sunday Times", source_score: c_right, url: "www.wsj.com/europe")
Source.create!(name: "Sunday Times", source_score: c_right, url: "www.telegraph.co.uk")
Source.create!(name: "Sunday Times", source_score: c_right, url: "www.economist.com")
# Right
Source.create!(name: "Fox News", source_score: right, url: "www.foxnews.com")
Source.create!(name: "Breitbart", source_score: right, url: "www.breitbart.com")
Source.create!(name: "Info Wars", source_score: right, url: "www.infowars.com")
Source.create!(name: "Daily Mail", source_score: right, url: "www.dailymail.co.uk")
Source.create!(name: "The Sun", source_score: right, url: "www.thesun.co.uk")
Source.create!(name: "Daily Express", source_score: right, url: "www.express.co.uk")
Source.create!(name: "Daily Star", source_score: right, url: "www.dailystar.co.uk")

