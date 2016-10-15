# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#

#공연 정보에서 쓰임
t = %w[버스킹공연 기타연주 하모니카연주 오케스트라 개그콘서트 군입대기념공연 제대기념공연 언더그라운드 쇼미더머니 슈퍼스타K  K팝스타 힙합씬 모놀로그 버스커컴백 이승철황제 바다의왕자 박명수의마술쇼 태양쇼 빅쇼 지디쑈 코난쇼 파스쿠찌]
g = %w[힙합/랩 R&B/소울 댄스 일렉트로닉 록 재즈 클래식 팝]

# 유저(아티스트) 정보
User.create(name: "민효린", artist_name: "씨스타", genre: g.sample, phone_number: 01022221111, area: "Seoul", introduction: "잘부탁드립니다", email: "sistar@sistar.com", password: "topsecret", password_confirmation: "topsecret", fan_count: 100)
User.create(name: "박효신", artist_name: "박효신", genre: g.sample, phone_number: 01022221112, area: "Seoul", introduction: "잘부탁드립니다", email: "hyosin@hyosin.com", password: "topsecret", password_confirmation: "topsecret", fan_count: 10)
User.create(name: "김범수", artist_name: "김범수", genre: g.sample, phone_number: 01022221133, area: "Seoul", introduction: "잘부탁드립니다", email: "bumsoo@bumsoo.com", password: "topsecret", password_confirmation: "topsecret", fan_count: 1)
User.create(name: "나얼", artist_name: "나얼", genre: g.sample, phone_number: 01022221114, area: "Seoul", introduction: "잘부탁드립니다", email: "naul@naul.com", password: "topsecret", password_confirmation: "topsecret", fan_count: 20)
User.create(name: "씨잼", artist_name: "씨잼", genre: g.sample, phone_number: 01022221115, area: "Seoul", introduction: "잘부탁드립니다", email: "cjam@cjam.com", password: "topsecret", password_confirmation: "topsecret", fan_count: 35)
User.create(name: "산E", artist_name: "SANE", genre: g.sample, phone_number: 01022221111, area: "Seoul", introduction: "잘부탁드립니다", email: "sane@sane.com", password: "topsecret", password_confirmation: "topsecret", fan_count: 57)
User.create(name: "최성훈", artist_name: "최자", genre: g.sample, phone_number: 01022221111, area: "Seoul", introduction: "잘부탁드립니다", email: "choiza@choiza.com", password: "topsecret", password_confirmation: "topsecret", fan_count: 999)
User.create(name: "박휘성", artist_name: "휘성", genre: g.sample, phone_number: 01022221111, area: "Seoul", introduction: "잘부탁드립니다", email: "hoosung@hoosung.com", password: "topsecret", password_confirmation: "topsecret", fan_count: 888)
User.create(name: "Beyonce", artist_name: "비욘세", genre: g.sample, phone_number: 01022221111, area: "NewYork", introduction: "잘부탁드립니다", email: "beyonce@beyonce.com", password: "topsecret", password_confirmation: "topsecret", fan_count: 0)
User.create(name: "Jayz", artist_name: "제이지", genre: g.sample, phone_number: 01022221111, area: "NewYork", introduction: "잘부탁드립니다", email: "jayz@jayz.com", password: "topsecret", password_confirmation: "topsecret", fan_count: 119)


# 홍대 놀이터 근처
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 1:50 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.552824, location_y: 126.922328, creator_id: 1, location: "홍대 놀이터", status: 1)
Show.create(title: "버스킹공연", content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 2:50 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.552654, location_y: 126.922962, creator_id: 2, location: "홍대 놀이터", status: 1)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 1:50 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.552409, location_y: 126.922719, creator_id: 3, location: "홍대 놀이터", status: 1)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 2:50 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.552432, location_y: 126.922384, creator_id: 4, location: "홍대 놀이터", status: 1)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 1:50 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.553823, location_y: 126.920665, creator_id: 5, location: "홍대 놀이터", status: 1)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 3:50 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.555265, location_y: 126.919983, creator_id: 6, location: "홍대 놀이터", status: 1)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 1:50 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.551047, location_y: 126.919347, creator_id: 7, location: "홍대 놀이터", status: 1)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 3:50 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.549029, location_y: 126.921029, creator_id: 8, location: "홍대 놀이터", status: 1)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 1:50 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.556022, location_y: 126.919755, creator_id: 9, location: "홍대 놀이터", status: 0)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 5:50 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.554039, location_y: 126.937851, creator_id: 10, location: "홍대 놀이터", status: 1)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 5:50 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.547875, location_y: 126.934942, creator_id: 1, location: "홍대 놀이터", status: 1)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 1:20 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.546577, location_y: 126.913309, creator_id: 2, location: "홍대 놀이터", status: 1)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 1:30 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.555085, location_y: 126.912890, creator_id: 3, location: "홍대 놀이터", status: 1)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 1:10 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.563484, location_y: 126.916846, creator_id: 4, location: "홍대 놀이터", status: 1)
Show.create(title: t.sample, content: "기타랑 목소리로 진행됩니다", genre: g.sample, start: "August 30, 2016 1:15 PM".to_time, playlist: "1.왜벌써가 2.링마이벨 3.날그만잊어요", location_x: 37.560275, location_y: 126.908389, creator_id: 5, location: "홍대 놀이터", status: 1)

# 잠실학생체육관 근처
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 2:50 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.512182, location_y: 127.075417, creator_id: 6, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 1:50 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.511399, location_y: 127.079559, creator_id: 7, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 2:50 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.510140, location_y: 127.080041, creator_id: 8, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 11:50 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.509901, location_y: 127.079183, creator_id: 9, location: "잠실", status: 0)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 2:50 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.510786, location_y: 127.078979, creator_id: 10, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 2:20 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.510335, location_y: 127.073379, creator_id: 1, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 2:10 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.512310, location_y: 127.071727, creator_id: 2, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 2:09 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.512140, location_y: 127.071727, creator_id: 3, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 3:50 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.510301, location_y: 127.072585, creator_id: 4, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 3:45 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.509203, location_y: 127.071651, creator_id: 5, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 2:50 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.513152, location_y: 127.073947, creator_id: 6, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 7:50 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.514335, location_y: 127.075900, creator_id: 7, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 7:30 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.513484, location_y: 127.078464, creator_id: 8, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 6:23 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.511595, location_y: 127.079280, creator_id: 9, location: "잠실", status: 0)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 2:10 PM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.513646, location_y: 127.074259, creator_id: 10, location: "잠실", status: 1)
Show.create(title: t.sample, content: "롯데타워에서 노래부릅니다", genre: g.sample, start: "December 31, 2016 1:50 AM".to_time, playlist: "1.거미야 2.아빌리브인리브 3.어른아이", location_x: 37.512250, location_y: 127.073958, creator_id: 1, location: "잠실", status: 1)


















##
=begin
show = Show.new
show.genre = g.sample
show.title = g.sample
show.time = Time.now.strftime("%I:%M:%S")
show.date = Time.now.strftime("%F")
show.playlist = "True Colors"
show.location_x = 37.49720818812354
show.location_y = 126.95616475134287
show.creator_id = 1
show.status = 1
show.save #학교 운동장

show = Show.new
show.genre = "재즈"
show.title = g.sample
show.time = Time.now.strftime("%I:%M:%S")
show.date = Time.now.strftime("%F")
show.playlist = "True Colors"
show.location_x = 37.53195287306739
show.location_y = 127.1480328738189
show.creator_id = 1
show.status = 2
show.save #종료된 공연

show = Show.new
show.genre = "B-boy"
show.location_x = 37.53195287306739
show.location_y = 127.1480328738189
show.creator_id = 1
show.status = 0
show.save #공연 예정

show = Show.new
show.genre = "Violin"
show.location_x = 37.53195287306739
show.location_y = 127.1480328738189
show.creator_id = 1
show.status = 0
show.save #공연 예정

show = Show.new
show.genre = "팝"
show.title = g.sample
show.time = Time.now.strftime("%I:%M:%S")
show.date = Time.now.strftime("%F")
show.playlist = "True Colors"
show.location_x = 37.519695589572116
show.location_y = 127.04732480000007
show.creator_id = 3
show.status = 1
show.save #상

show = Show.new
show.genre = "랩"
show.title = g.sample
show.time = Time.now.strftime("%I:%M:%S")
show.date = Time.now.strftime("%F")
show.playlist = "True Colors"
show.location_x = 37.5172363
show.location_y = 127.05362262676704
show.creator_id = 4
show.status = 1
show.save #우

show = Show.new
show.genre = "록"
show.title = g.sample
show.time = Time.now.strftime("%I:%M:%S")
show.date = Time.now.strftime("%F")
show.playlist = "True Colors"
show.location_x = 37.519695589572116
show.location_y = 127.05362262676704
show.creator_id = 5
show.status = 1
show.save #우상

show = Show.new
show.genre = "클래식"
show.title = g.sample
show.time = Time.now.strftime("%I:%M:%S")
show.date = Time.now.strftime("%F")
show.playlist = "True Colors"
show.location_x = 37.5172363
show.location_y = 127.04732480000007
show.creator_id = 6
show.status = 0
show.save #중

show = Show.new
show.genre = "일렉트로닉"
show.title = g.sample
show.time = Time.now.strftime("%I:%M:%S")
show.date = Time.now.strftime("%F")
show.playlist = "True Colors"
show.location_x = 37.5172363
show.location_y = 127.04732480000007 - 0.0063
show.creator_id = 7
show.status = 1
show.save #좌

show = Show.new
show.genre = "댄스"
show.title = g.sample
show.time = Time.now.strftime("%I:%M:%S")
show.date = Time.now.strftime("%F")
show.playlist = "True Colors"
show.location_x = 37.5172363 - 0.00246
show.location_y = 127.04732480000007
show.creator_id = 8
show.status = 1
show.save #하


i = 9

# 공연 정보 생성
c.each do |one|
  s = Show.new
  s.creator_id = i
  s.title = one
  임의로 타임값 생성. 공연정보페이지에서 조회 시 사용
  s.time에서 초까지 받을 필욘 없으나 시간순 조회시 만듦
  s.time = Time.now.strftime("%I:%M:%S")
  s.date = Time.now.strftime("%F")
  s.location = "숭실대학교 형남홀"
  s.genre = g.sample
  s.playlist = c
  s.save
  i += 1
end

=end
