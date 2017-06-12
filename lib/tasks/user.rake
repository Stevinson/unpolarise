# Task that will be run in the background, once every X hours, which updates
# every user's stats
namespace :user do
  desc "Categorising each user"
  task :update_categorisation => :environment do
    User.all.each do |user|
      CategoriseUser.new(user).perform
    end
  end
end


