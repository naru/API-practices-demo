class Post < ActiveRecord::Base

  validates :content, presence: true, length: { maximum: 141 }

  def self.new_through_api(attrs)
    allowed_attributes = ['content']
    attrs.reject! {|k,v| !allowed_attributes.include?(k)}

    new attrs
  end

  def as_json(options = {})
    {
      id: id,
      content: content,
      updated_at: updated_at
    }
  end

end
