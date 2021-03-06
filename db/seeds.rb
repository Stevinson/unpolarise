# Seed the different news sources
# First empty DB
# Link.destroy_all # To make sure we can drop the sources seed as well.
# Source.destroy_all
# # Constants for each category of source
left = 1.0
c_left = 0.25
c_right = -0.25
right = -1.0

# Create the DB entries of news sources
# --- UK ---
# Left
Source.create!(name: "New Yorker", source_score: left, url_base: "/(\S+)nyer\.cm(\S+)/")
Source.create!(name: "The Guardian", source_score: left, url_base: "/(\S+)www\.theguardian\.com(\S+)/")
Source.create!(name: "Al Jazeera", source_score: left, url_base: "/(\S+)aje\.io(\S+)|(\S+)www\.aljazeera\.com(\S+)/")
Source.create!(name: "HuffPost Politics", source_score: left, url_base: "/(\S+)huffp\.st(\S+)/")
Source.create!(name: "Vice", source_score: left, url_base: "/(\S+)www\.vice\.com(\S+)/")
Source.create!(name: "Morning Star", source_score: left, url_base: "/(\S+)www\.morningstaronline\.co\.uk(\S+)/")
# Centre left
Source.create!(name: "Bloomberg", source_score: c_left, url_base: "/(\S+)bloom\.bg(\S+)/")
Source.create!(name: "Independent", source_score: c_left, url_base: "/(\S+)www\.independent\.co\.uk(\S+)|(\S+)www\.indy100\.com(\S+)/")
Source.create!(name: "CNN", source_score: c_left, url_base: "/(\S+)cnn\.it(\S+)/")
Source.create!(name: "New York Times", source_score: c_left, url_base: "/(\S+)www\.nytimes\.com(\S+)/")
Source.create!(name: "NBC News", source_score: c_left, url_base: "/(\S+)nbcnews\.to(\S+)/")
# Centre right
Source.create!(name: "Sunday Times", source_score: c_right, url_base: "/(\S+)thetim\.es(\S+)/")
Source.create!(name: "Wall Street Journal", source_score: c_right, url_base: "/(\S+)wsj\.com(\S+)/")
Source.create!(name: "Economist", source_score: c_right, url_base: "/(\S+)econ\.st(\S+)/")
# Right
Source.create!(name: "Fox News", source_score: right, url_base: "/(\S+)foxnews\.com(\S+)|(\S+)fxn\.ws(\S+)/")
Source.create!(name: "Info Wars", source_score: right, url_base: "/(\S+)infowars\.com(\S+)/")
Source.create!(name: "Daily Mail", source_score: right, url_base: "/(\S+)dailym\.ai(\S+)/")
Source.create!(name: "The Sun", source_score: right, url_base: "/(\S+)thesun\.uk(\S+)/")
Source.create!(name: "Daily Express", source_score: right, url_base: "/(\S+)www\.express\.co\.uk(\S+)/")
Source.create!(name: "Daily Star", source_score: right, url_base: "/(\S+)www\.dailystar\.co\.uk(\S+)/")

# --- France ---
# Left
# Source.create!(name: "Liberation", source_score: left, url_base: "//")
# Source.create!(name: "L'Opinion", source_score: left, url_base: "//")
# Source.create!(name: "Le Nouvel Obs", source_score: left, url_base: "/nouvelobs\.com/")
# Source.create!(name: "Marianne", source_score: left, url_base: "/www\.marianne\.net/")
# Source.create!(name: "Charlie Hebdo", source_score: left, url_base: "/charliehebdo\.fr/")
# Source.create!(name: "Alter Eco", source_score: left, url_base: "/alternatives-economiques\.fr/")
# # Centre left
# Source.create!(name: "Le Monde", source_score: c_left, url_base: "/www\.lemonde\.fr/")
# Source.create!(name: "Courrier International", source_score: c_left, url_base: "/courrierinternational\.com/")
# # Centre right
# # Source.create!(name: "Les Echos", source_score: c_right, url_base: "//")
# Source.create!(name: "L'Express", source_score: c_right, url_base: "/lexpress\.fr/")
# # Right
# Source.create!(name: "Le Figaro", source_score: right, url_base: "/lefigaro\.fr/")
# Source.create!(name: "Le Point", source_score: right, url_base: "/lepoint\.fr/")
# Source.create!(name: "Le JDD", source_score: right, url_base: "/lejdd\.fr/")
# Source.create!(name: "Valeurs Actuelles", source_score: right, url_base: "/valeursactuelles\.com/")


# Create the DB entries of news sources
# Left
# Page.create!(name: "Syriza", source_score: left, url_component: "syrizaofficial")
# Page.create!(name: "Melenchon", source_score: left, url_component: "JLMelenchon")
# Page.create!(name: "Jeremy Corbyn", source_score: left, url_component: "JeremyCorbynMP")
# Page.create!(name: "Communist Party", source_score: left, url_component: "communism101")
# # Centre left
# Page.create!(name: "Labour Party", source_score: c_left, url_component: "labourparty")
# Page.create!(name: "Barack Obama", source_score: c_left, url_component: "barackobama")
# Page.create!(name: "Bernie Sanders", source_score: c_left, url_component: "berniesanders")
# Page.create!(name: "Hillary Clinton", source_score: c_left, url_component: "hillaryclinton")
# Page.create!(name: "Sadiq Khan", source_score: c_left, url_component: "sadiqforlondon")
# Page.create!(name: "Daily Show", source_score: c_left, url_component: "dailyshow")
# # Centre right
# Page.create!(name: "Conservative Party", source_score: c_right, url_component: "conservatives")
# Page.create!(name: "David Cameron", source_score: c_right, url_component: "DavidCameronOfficial")
# Page.create!(name: "Boris Johnson", source_score: c_right, url_component: "borisjohnson")
# Page.create!(name: "Jeremy Kyle", source_score: c_right, url_component: "Jeremykyle")
# # Right
# Page.create!(name: "Marine Le Pen", source_score: right, url_component: "MarineLePen")
# Page.create!(name: "Nigel Farage", source_score: right, url_component: "nigelfarageofficial")
# Page.create!(name: "UKIP", source_score: right, url_component: "UKIP")
# Page.create!(name: "BNP", source_score: right, url_component: "OfficialBritishNationalParty")
# Page.create!(name: "Donald Trump", source_score: right, url_component: "DonaldTrump")






