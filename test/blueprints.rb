require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Item.blueprint do
  name { Faker::Pokemon.name }
  amount { 0 }
  eastsun_id { Faker::Number.number(10) }
  price { 10 }
end
