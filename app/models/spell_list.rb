# == Schema Information
#
# Table name: spell_lists
#
#  id         :integer          not null, primary key
#  spell      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SpellList < ApplicationRecord
end
