# 国内使用淘宝源比较多
source 'https://ruby.taobao.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"


end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use mysql as the database for Active Record
# gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# 生产部署的时候用到的，谷歌v8在ruby 的接口
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# 生成json
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # 单元测试

  gem 'database_cleaner', '~> 1.5.3'#与rspec整合的，防止数据污染
  gem 'rspec-rails', '~> 3.5'
  gem 'rails-controller-testing'#单独对控制器的

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bootstrap-sass'#css框架
gem 'font-awesome-rails'#图标库
gem 'sorcery'#轻量级用户管理工具
gem 'ancestry' #树形关系管理
gem 'will_paginate' #数据库查询的分页
gem 'paperclip', '~> 5.0.0' #上传图片！需要以来imagemagick
gem 'puma', '~> 3.0'


group :development do
  gem 'mysql2', '>= 0.3.18', '< 0.5'
end
group :production do
  gem 'pg'
end
