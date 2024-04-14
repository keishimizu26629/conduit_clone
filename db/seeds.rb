# サンプルユーザーデータ
sample_users = [
  {
    name: "Alice",
    email: "alice@example.com",
    password: "password123",
    password_confirmation: "password123"
  },
  {
    name: "Bob",
    email: "bob@example.com",
    password: "password123",
    password_confirmation: "password123"
  },
  {
    name: "Carol",
    email: "carol@example.com",
    password: "password123",
    password_confirmation: "password123"
  }
]

# カテゴリ名のデータ
category_names = [
  'ipsum',
  'sapiente',
  'ducimus',
  'blanditiis',
  'voluptatem', 'nostrum',
  'neque',
  'categoria8',
  'categoria9',
  'categoria10'
]

# カテゴリデータの挿入
category_names.each do |name|
  Category.create(name: name)
end

# ユーザーデータの挿入
sample_users.each do |user|
  User.create!(user)
end
