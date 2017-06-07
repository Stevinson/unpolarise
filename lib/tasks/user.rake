# Task that will be run in the background, once every X hours, which updates
# every user's stats
namespace :user do
  desc "Updating users stats: the count of each news source"
  task update_sources_stats: :environment do
    users = User.all
    users.each do |user|
      CreateStats.new(user).perform # Check that this line is correct!
    end
  end
end
# perform_later(user.id)

