User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('user')
ActiveRecord::Base.connection.reset_pk_sequence!('posts')

user = User.create!(email: 'test@test.com', password: 'test123', password_confirmation: 'test123')

Post.create(title: 'Rubocopper', user_id: user.id, live: true)
Post.create(title: 'Rubocopper', user_id: user.id, live: true)
