# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
show = Show.new
show.location_x = 37.519695589572116
show.location_y = 127.04732480000007
show.save #상
show = Show.new
show.location_x = 37.5172363
show.location_y = 127.05362262676704
show.save #우
show = Show.new
show.location_x = 37.519695589572116
show.location_y = 127.05362262676704
show.save #우상
show = Show.new
show.location_x = 37.5172363
show.location_y = 127.04732480000007
show.save #중
show = Show.new
show.location_x = 37.5172363
show.location_y = 127.04732480000007 - 0.0063
show.save #좌
show = Show.new
show.location_x = 37.5172363 - 0.00246
show.location_y = 127.04732480000007
show.save #하