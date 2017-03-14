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

Invoice.blueprint do
  total { 0 }
  delivered { false }
end

InvoiceDetail.blueprint do
  invoice { Invoice.make! }
  item { Item.make! }
  amount { 10 }
  price { 5 }
end
