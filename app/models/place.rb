class Place < ActiveRecord::Base
  PLACE_TYPES = %w[ Province City ]
  records_with_operator_on :create, :update
  validates :name, :type, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :type, inclusion: { in: PLACE_TYPES }
  before_save :set_slug

  def set_slug
    self.slug = name.try(:parameterize)
  end
end
