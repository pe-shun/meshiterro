class PostImage < ApplicationRecord

 　belongs_to :user
   has_many :post_comments, dependent: :destroy
   has_many :favorites, dependent: :destroy

　validates :shopname, presence: true
  validates :image, presence: true

 def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

 end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
