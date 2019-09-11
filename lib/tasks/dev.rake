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
end