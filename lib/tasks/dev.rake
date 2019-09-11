namespace :dev do

  task fake_user: :environment do
    User.destroy_all

    30.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        username: "#{user_name}",
        email: "#{user_name}@hot.tw",
        password: "123456"
      )
    end
    puts "User fake data created"
    puts "Now we have #{User.count} user datas."
  end

  task fake_product: :environment do
    
  end
end