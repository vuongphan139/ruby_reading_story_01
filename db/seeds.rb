User.create!(name: "Example User",
    email: "example@railstutorial.org",
    password: "foobar",
    account_name: "admin",
    password_confirmation: "foobar",
    admin: true,
    activated: true,
    activated_at: Time.zone.now)

user = User.first

99.times do |n|
    name = Faker::Name.name
    author_name = Faker::Name.name
    s = user.stories.build name: name, author_name: author_name
    s.save
end
