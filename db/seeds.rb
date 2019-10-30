require 'faker'

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
City.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cities')
Gossip.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('gossips')
Tag.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('tags')

10.times do 
  city = City.create!(
    name: Faker::Address.city,
    zipcode: Faker::Address.zip_code)
end

10.times do 
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 18, to: 80),
    city_id: City.all.sample.id)
end

20.times do
  gossip = Gossip.create!(
    title: Faker::Book.title,
    content: Faker::Quote.most_interesting_man_in_the_world,
    user_id: User.all.sample.id)
end

10.times do
  tag = Tag.create!(
    title: Faker::Color.color_name )
end

10.times do
  join_table_tag_gossips = JoinTableTagGossip.create!(
    tag: Tag.all.select(:id).sample,
    gossip: Gossip.all.select(:id).sample) 
end

5.times do
  pm = PrivateMessage.create(content: Faker::Lorem.sentence, sender_id: User.all.sample.id, recipient_id: User.all.sample.id)
end


puts "C'est fait"