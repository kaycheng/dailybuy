require 'uri'
namespace :dev do

  task fake_user: :environment do
    
    url = "https://uinames.com/api/?ext&region=england"

    7.times do 
      response = RestClient.get(url)
      data = JSON.parse(response.body)

      user = User.create!(
        username: data["name"],
        email: data["email"],
        password: "123456"
      )

      filename = File.basename(URI.parse(url).path)
      file = URI.open(data["photo"])
      user.avatar.attach(io: file, filename: filename)
      
      puts "Create user #{user.username}"
    end
    
    puts "Now we have #{User.count} users data."
  end

  task fake_product: :environment do
    Product.destroy_all

    500.times do
      product = Product.create!(
        name: FFaker::Lorem.word,
        description: FFaker::Lorem.paragraph,
        price: rand(200..400),
        user: User.all.sample,
        category: Category.all.sample
      )
    end

    puts "Create #{Product.count} products data"
  end
end