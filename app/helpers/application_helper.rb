module ApplicationHelper

  def major_options_array
    majors = CreateDummyStudentService::SCIENCES.concat(CreateDummyStudentService::ARTS)
    majors.map!(&:downcase)
    majors.zip majors
  end

  #kaminari pagination defaults
   def paginate objects, options = {}
    options.reverse_merge!( theme: 'twitter-bootstrap-3' )

    super( objects, options )
  end
end
