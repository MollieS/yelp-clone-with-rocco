class Restaurant < ActiveRecord::Base

  has_many :reviews,
      -> { extending WithUserAssociationExtension },
      dependent: :restrict_with_exception, dependent: :destroy

  validates :name, length: {minimum: 3}, uniqueness: true

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating).to_f
  end
end