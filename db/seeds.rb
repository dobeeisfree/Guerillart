# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




c = ["왜 벌써가", "링마이벨", "눈의꽃", "야생화", "보고싶다", "하루", "바람기억", "가지마가지마", "독","비행소년","쌈디디스곡"]

c.each do |c|
  0.upto(0) do |i|
    s = Show.new
    s.artist_id = i + 1
    s.title = c 
    s.time = "21:00"
    s.date = "2016년 8월 15일" 
    s.location = "숭실대학교 형남홀"
    s.genre = "Rap"  
    s.playlist = "#{c[i+1]}"
    s.save
  end    
end


