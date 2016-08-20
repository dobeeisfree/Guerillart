# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
show = Show.new
show.genre = "balad"
show.location_x = 37.49720818812354
show.location_y = 126.95616475134287
show.user_id = 1
show.status = 1
show.save #학교 운동장

show = Show.new
show.genre = "jazz"
show.location_x = 37.53195287306739
show.location_y = 127.1480328738189
show.user_id = 2
show.status = 1
show.save #우리집 근처

show = Show.new
show.genre = "rock"
show.location_x = 37.519695589572116
show.location_y = 127.04732480000007
show.user_id = 3
show.status = 1
show.save #상

show = Show.new
show.genre = "dance"
show.location_x = 37.5172363
show.location_y = 127.05362262676704
show.user_id = 4
show.status = 1
show.save #우

show = Show.new
show.genre = "hiphop"
show.location_x = 37.519695589572116
show.location_y = 127.05362262676704
show.user_id = 5
show.status = 1
show.save #우상

show = Show.new
show.genre = "juggle"
show.location_x = 37.5172363
show.location_y = 127.04732480000007
show.user_id = 6
show.status = 0
show.save #중

show = Show.new
show.genre = "magic"
show.location_x = 37.5172363
show.location_y = 127.04732480000007 - 0.0063
show.user_id = 7
show.status = 1
show.save #좌

show = Show.new
show.genre = "comedy"
show.location_x = 37.5172363 - 0.00246
show.location_y = 127.04732480000007
show.user_id = 8
show.status = 1
show.save #하


c = ["왜 벌써가", "링마이벨", "눈의꽃", "야생화", "보고싶다", "하루", "바람기억", "가지마가지마", "독","비행소년","쌈디디스곡"]
g = ["힙합", "하우스", "발라드", "인디음악", "락", "팝", "댄스"]
i = 9

# 공연 정보 생성
c.each do |one|
  s = Show.new
  s.user_id = i
  s.title = one
=begin
  임의로 타임값 생성. 공연정보페이지에서 조회 시 사용
  s.time에서 초까지 받을 필욘 없으나 시간순 조회시 만듦
=end
  s.time = Time.now.strftime("%I:%M:%S")
  s.date = Time.now.strftime("%F")
  s.location = "숭실대학교 형남홀"
  s.genre = g.sample
  s.playlist = c
  s.save
  i += 1
end
