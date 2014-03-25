# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
City.create(name: 'New York City')
City.create(name: 'Boston')

Burrough.create(name: 'Brooklyn', city_id:1)
Burrough.create(name: 'Bronx', city_id:1)
Burrough.create(name: 'Manhattan', city_id:1)
Burrough.create(name: 'Queens', city_id:1)
Burrough.create(name: 'Staten Island', city_id:1)

Hood.create(name: 'Williamsburg', burrough_id:1, city_id: 1)
Hood.create(name: 'Park Slope', burrough_id:1, city_id: 1)
Hood.create(name: 'Crown Heights', burrough_id:1, city_id: 1)
Hood.create(name: 'Gowanus', burrough_id:1, city_id: 1)
Hood.create(name: 'Bushwick', burrough_id:1, city_id: 1)
Hood.create(name: 'Red Hook', burrough_id:1, city_id: 1)
Hood.create(name: 'Greenpoint', burrough_id:1, city_id: 1)

Hood.create(name: 'Allston', city_id:2)
Hood.create(name: 'Southie', city_id:2)
Hood.create(name: 'Financial', city_id:2)



