class BusType < ActiveRecord::Base
  FACILITIES = ['AC', 'Toilet', 'Reclining Seat', 'TV/VCD/DVD', 'Smoking Area', 'Leg Rest']
  records_with_operator_on :create, :update
  validates :name, :capacity, :left, :right, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :capacity, inclusion: { in: 18..45 }
  validates :left, inclusion: { in: 1..3 }
  validates :right, inclusion: { in: 2..3 }
  validate :validates_facility
  before_save :set_values

  def facilities
    facility.join(' / ')
  end

  def validates_facility
    errors.add(:facility, :blank) and return if facility.reject { |i| i.blank? }.blank?
    errors.add(:facility, :invalid) unless facility.detect { |i| FACILITIES.include?(i) }
  end

  def set_values
    self.facility.reject! { |i| i.blank? }
    self.slug = name.try(:parameterize)
  end
end
