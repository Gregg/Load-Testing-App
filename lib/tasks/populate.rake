require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")
require 'populator'
require 'faker'

namespace :populate do
  desc 'import mass amounts of data'
  task :import_users do
    time = Time.now
    User.populate(500000) do |u|
        name = Faker::Name.name
        u.login = Faker::Name.name.gsub(" ", "") + Kernel.rand(1000).to_s
        u.name = Faker::Name.name
        u.email = Faker::Internet.email
        u.crypted_password = "f778b9f5d3df4f7178e5230c9b1d7fa62445e0f6"
        u.salt = "51eb3712f3d2b7e4cd232f555a7b426ca9c07c27"
        u.remember_token = "388c6b34700c25158742f891bca901d69e9cd14d"
        u.remember_token_expires_at = time
        u.activation_code = "a8b02813a429aee5ec70ecff6ddb27c8101a2117"
        u.activated_at = time
        u.created_at = time
        u.updated_at = time
    end
  end
  desc 'import 10 million posts'
  task :import_posts do
    max_id = User.last.id
    Post.populate(10000000) do |p| # Ten million
      p.title = Populator.words(4..7)
      p.body = Populator.paragraphs(1)
      p.user_id = rand(max_id)
    end
  end
  desc 'import some post users for each post'
  task :import_post_users do
    max_id = 500
    Post.all.each do |p|
      PostUser.populate(20) do |pu|
        user_id = rand(max_id)
        pu.post_id = p.id  
        pu.user_id = user_id
        PostView.populate(2) do |pv|
          pv.post_id = p.id
          pu.user_id = user_id
        end
      end
    end
  end
end
