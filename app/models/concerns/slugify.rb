module Slugify
  module InstanceMethods
    def slug
      self.username.gsub(" ", "-").downcase
    end

    def slug_movement
      self.name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|instance| instance.slug == slug}
    end

    def find_by_slug_movement(slug)
      movement_name = slug.split("-").map {|w| w.capitalize }.join(" ")
      self.all.find{|instance| instance.name == movement_name}
    end
  end
end
