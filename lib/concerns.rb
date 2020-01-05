module Concerns

  module Findable

    def find_by_name(name)
      self.all.each{|item|
        if item.name == name
          return item
        end}
      nil
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name) != nil
        return self.find_by_name(name)
      else
        return self.create(name)
      end
    end

  end
end
