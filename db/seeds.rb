level_sets = [
  {level: 1, thresold: 0},
  {level: 2, thresold: 30},
  {level: 3, thresold: 90},
  {level: 4, thresold: 180},
  {level: 5, thresold: 300},
  {level: 6, thresold: 450},
  {level: 7, thresold: 630},
  {level: 8, thresold: 840},
  {level: 9, thresold: 1080},
  {level: 10, thresold: 1350},
]

level_sets.each do |level_set|
  LevelSet.find_or_create_by(
      level: level_set[:level],
      thresold: level_set[:thresold]
    )
end

users = [
  {email: 'user1@example.com', password: 'passw@rd', name: 'Yamada Ichiro'},
  {email: 'user2@example.com', password: 'passw@rd', name: 'Yamada Jiro'},
  {email: 'user3@example.com', password: 'passw@rd', name: 'Yamada Saburo'},
  {email: 'user4@example.com', password: 'passw@rd', name: 'Yamada Shiro'},
  {email: 'user5@example.com', password: 'passw@rd', name: 'Yamada Goro'},
]

users.each do |user|
  # 一度ユーザーをメールアドレスで検索
  user_data = User.find_by(email: user[:email])
  # 該当ユーザーがいなければ、createする
  if user_data.nil?
    User.create(
      email: user[:email],
      password: user[:password],
      name: user[:name]
    )
  end
end