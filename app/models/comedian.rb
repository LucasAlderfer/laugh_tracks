class Comedian < ActiveRecord::Base
  validates :name, presence: true
  validates :age, presence: true

  has_many :specials

  def specials_count
    specials.length
  end
end
