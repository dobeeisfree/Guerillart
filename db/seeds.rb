# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c = ["왜 벌써가", "링~마이벨", "눈의꽃", "야생화", "보고싶다", "하루", "바람기억", "가지마가지마", "독","비행소년","쌈디디스곡"]
g = ["힙합", "하우스", "발라드", "인디음악", "락", "팝", "댄스"]
i = 1
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
