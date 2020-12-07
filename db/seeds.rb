Post.destroy_all
User.destroy_all
ActsAsTaggableOn::Tag.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("posts")
ActiveRecord::Base.connection.reset_pk_sequence!("user")

first_user = User.create!(email: "first_user@test.com", username: "First User", password: "test123", password_confirmation: "test123")
second_user = User.create!(email: "second_user@test.com", username: "Second User", password: "test123", password_confirmation: "test123")

Post.create!(title: "Aggressive Formatter", user_id: first_user.id, live: true, tag_list: %w[formatter aggressive])
Post.create!(title: "Careful", user_id: second_user.id, live: true, tag_list: %w[careful])
Post.create!(title: "Formatter", user_id: first_user.id, live: true, tag_list: %w[formatter])

p "Created #{first_user.username} with #{first_user.posts_count} posts"
p "Created #{second_user.username} with #{second_user.posts_count} post"
