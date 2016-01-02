class Company < ActiveRecord::Base
  OPERATOR_TYPES = %w[ Bus Shuttle Travel ]
  SEPARATOR = ' / '
  records_with_operator_on :create, :update
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validate :validates_operator_type, :validates_phone
  after_initialize :set_slug
  before_save :filter_value

  def operator_types
    operator_type.join(SEPARATOR)
  end

  def phones
    phone.join(SEPARATOR)
  end

  private
    def validates_operator_type
      errors.add(:operator_type, :blank) and return if operator_type.delete_if { |i| i.blank? }.blank?
      errors.add(:operator_type, :invalid) unless operator_type.is_a?(Array) and operator_type.detect { |i| OPERATOR_TYPES.include?(i) }
    end

    def validates_phone
      errors.add(:phone, :blank) and return if phone.delete_if { |i| i.blank? }.blank?
      errors.add(:phone, :invalid) unless phone.is_a?(Array) and self.phone.detect { |i| i.match(/^\d+$/) }
    end

    def set_slug
      self.slug = name.try(:parameterize)
    end

    def filter_value
      operator_type.reject! { |i| i.blank? }
      phone.reject! { |i| i.blank? }
    end
end
