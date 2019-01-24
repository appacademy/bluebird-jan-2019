# == Schema Information
#
# Table name: chirps
#
#  id         :bigint(8)        not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chirp < ApplicationRecord
  validates :body, presence: true
  # validates :author_id, presence: true

  validate(:chirp_too_long)

  # Belongs to will ALWAYS validate presence true foreign key by default
  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :likes,
    primary_key: :id, # in our own class (has_many)
    foreign_key: :chirp_id,
    class_name: :Like
  
  has_many :likers,
    through: :likes,
    source: :user

  has_many :comments,
    primary_key: :id,
    foreign_key: :chirp_id,
    class_name: :Comment

  def chirp_too_long
    if body && body.length > 200
      errors[:body].push("Chirp is toooooo long")
    end
  end
end
