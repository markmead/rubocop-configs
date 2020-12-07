SitemapGenerator::Sitemap.default_host = "https://rubocop-configs.herokuapp.com/"
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  add posts_path, changefreq: :daily
  add tags_path, changefreq: :daily
  add leaderboard_path, changefreq: :weekly
  add references_path, changefreq: :monthly

  Post.live.find_each do |post|
    add post_path(post), lastmod: post.updated_at
  end

  ActsAsTaggableOn::Tag.find_each do |tag|
    add tag_path(tag)
  end
end
