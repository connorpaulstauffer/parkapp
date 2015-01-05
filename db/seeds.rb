User.create!(name:  "Example User",
             email: "user@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end


users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.reviews.create!(content: content) }
end



# Build park table
park_name_list = Array.new
park_state_list = Array.new
  
doc = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/List_of_national_parks_of_the_United_States"))
  
name_xml = doc.css("tr th[scope='row']")
state_xml = doc.xpath("//tr/td[2]/a[1]")

name_xml.each{|head| park_name_list << head.text}
state_xml.each{|head| park_state_list << head.text}

park_name_list.zip(park_state_list).each do |n, s|
  name = n
  state = s
  country = "USA"
  Park.create!(name: name, state: state, country: country)
end