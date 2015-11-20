class Student < ActiveRecord::Base

  def self.search(search_keys)
    if search_keys[:roll_no].present? then
      Student.where roll_no: search_keys[:roll_no]
    elsif search_keys[:name_en].present? then
      Student.where name_en: search_keys[:name_en]
    elsif search_keys[:name_my].present? then
      Student.where name_my: search_keys[:name_my]
    else
      Student.where major: search_keys[:major], year: search_keys[:year]
    end
  end
end
