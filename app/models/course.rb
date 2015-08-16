class Course < ActiveRecord::Base
  has_many :classrooms
  has_many :students, through: :classrooms
  enum status: [:active, :deactivated]
  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true

  def self.statuses_to_s
    statuses.map do |status|
      [I18n.t("activerecord.attributes.course.status_#{status[0]}"), status[0]]
    end
  end

  def status_to_s
    I18n.t("activerecord.attributes.course.status_#{status}")
  end
end
