require 'bundler'
Bundler.require

require 'pry'


module Concerns
  module Findable
    # def find_by_name(name)
    #   self.all.find{|artist| artist.name == name}
    # end
  end
end

require_all 'lib'
