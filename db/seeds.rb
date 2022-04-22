User.create(first_name: "Lisa", last_name: "Black", email: "admin@test.com", password: "123456", password_confirmation: "123456", admin: true)
puts "Admin has been created"

user1 = User.create(first_name: "Kim", last_name: "Jisoo", email: "user1@test.com", password: "123456", password_confirmation: "123456")
puts "user1 has been created"

user2 = User.create(first_name: "Roseanne", last_name: "Park", email: "user2@test.com", password: "123456", password_confirmation: "123456")
puts "user2 has been created"