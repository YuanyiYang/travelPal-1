# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create([                 
#             {email:"yiranmao@gmail.com", password:"285002", name:"Yiran Mao", gender:1, age:26, college:"NYU", major:"MSCS"},
# ])

# Trip.create([                 
#             {destination:"Alaska", start_date:"2020-10-10 00:00:00 UTC", end_date: "2020-10-30 00:00:00 UTC", fee:2000, owner_id:1},                  
#             {destination:"Isarel", start_date:"2015-10-11 00:00:00 UTC", end_date: "2015-10-31 00:00:00 UTC", fee:2000, owner_id:1},
#             {destination:"India", start_date:"2017-12-10 00:00:00 UTC", end_date: "2017-12-30 00:00:00 UTC", fee:2000, owner_id:1},
# ])

# TripsUser.create([           
#                   {trip_id:1, user_id:1, status:1},
#                   {trip_id:2, user_id:1, status:1},
#                   {trip_id:3, user_id:1, status:1},
# ])
