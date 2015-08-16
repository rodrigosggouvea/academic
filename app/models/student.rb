class Student < ActiveRecord::Base
  enum status: [:active, :deactivated]
  validates :name, presence: true
  validates :register_number, presence: true
  validates :status, presence: true

  def self.statuses_to_s
    statuses.map do |status|
      [I18n.t("activerecord.attributes.student.status_#{status[0]}"), status[0]]
    end
  end

  def status_to_s
    I18n.t("activerecord.attributes.student.status_#{status}")
  end
end
