# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

category_list = [
  { name: "電腦3C" },
  { name: "生活用品" },
  { name: "書籍" },
  { name: "時尚" },
  { name: "美妝品" },
  { name: "汽機車" },
]

category_list.each do |category|
  Category.create( name: category[:name] )
end
puts "Category create successfully!"

User.create(username:"admin",email:"admin@hot.tw",password:"123456",role:"admin")
puts "Default admin created!"