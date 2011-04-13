class Post < ActiveRecord::Base
  validates :content, length: { minimum: 3 }
end
