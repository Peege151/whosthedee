namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Patrick Sullivan",
                         email: "Pjsulli2k@gmail.com",
                         password: "shithead1",
                         password_confirmation: "shithead1",
                         admin: true)
    User.create!(name: "Example User",
                 email: "example2222@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end