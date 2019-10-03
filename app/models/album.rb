# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  band_id    :integer          not null
#  name       :string           not null
#  year       :date             not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord 

  validates :name, :year, :band_id, presence: true 
  validates :name, uniqueness: { scope: :band_id }
  validates :live, inclusion: { in: [true, false] }
  validates :year, numericality: { minimum: 1990, maximum: 9000 }

  belongs_to :band 
end 
