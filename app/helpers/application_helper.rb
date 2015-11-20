module ApplicationHelper

  def major_options_array
    majors = CreateDummyStudentService::SCIENCES.concat(CreateDummyStudentService::ARTS)
    majors.map!(&:downcase)
    majors.zip majors
  end
end
