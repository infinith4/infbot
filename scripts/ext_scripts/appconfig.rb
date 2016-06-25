require 'hashie'

module AppConfig
  extend self
  def load(file)
    # default
    config = Hashie::Mash.new
    config.chatworkapi = {
    }

    # overwirte
    instance_eval(file)

    config.each do |key, value|
      attr_accessor key
      send("#{key}=", value)
    end
  end

  AppConfig.load(File.read(File.expand_path('./scripts/ext_scripts/.config.rb')))

end
