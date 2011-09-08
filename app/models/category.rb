class Category < ActiveRecord::Base
    has_attached_file :display,
      styles:{ medium: "300x300>", thumb: "100x100" },
      default_url: '/images/folder.png'
    has_many :category_types
    def to_s
        self.name
    end
end
