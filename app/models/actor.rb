class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  def list_roles
    self.characters.map do |role|
        show = self.shows.find_by(id: role.show_id)
        "#{role.name} - #{show.name}"
    end
  end
end