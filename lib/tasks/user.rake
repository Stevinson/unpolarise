# Task that will be run in the background, once every X hours, which updates
# every user's stats
namespace :user do
  desc "Categorising each user"
  task update_sources_stats: :environment do
    users = User.all
    users.each do |user|
      CreateStats.new(user).perform
      # Check that above line is correct! Should I be using: perform_later(user.id)
    end
  end
end


