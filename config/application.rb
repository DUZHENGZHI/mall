require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MasterRailsByMall
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    #把方法放在系统自动加载路径,加载lib
    # config.autoload_paths += %W[#{Rails.root}/lib]
    config.autoload_paths += %W(#{config.root}/lib)




    #希望手工控制，令generator命令不自动生成参数文件
    config.generators do |generator|
      generator.assets false #generator生成控制器的时候，不生成js和css
      generator.test_framework false #generator生成model的时候，不生成test
      generator.skip_routes true
    end


  end
end
