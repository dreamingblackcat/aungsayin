class CreateDummyStudentService

  ARTS = [
    "Myanmar",
    "English",
    "History",
    "Law",
    "Philosophy",
    "Psychology",
    "Anthropology",
    "Archaeology",
    "International Relations",
    "Geogoraphy",
    "Oriental Studies",
    "Economics" 
  ]

  SCIENCES = [
    "Physics",
    "Chemistry",
    "Mathematics",
    "Zoology",
    "Botany",
    "Industrial Chemistry",
    "Geology",
    "Computer Science",
    "Sport Science"
  ]

  def call

    inserts = []
    stmt = ""
    s = Student.new
    majors = SCIENCES.concat(ARTS)
    majors.each do|major|
      (1..4).each do|year|
        puts "#{major.downcase} #{year}"
        50.times do|i|
          s.name_en = Faker::Name.name.gsub("\'", "")
          s.exam_status = [true, false].sample
          s.major = major.downcase
          s.year  = year
          s.distinctions = [true, false].sample ? randomize_distinctions(s.year, rand(1..8)) : ""
          s.roll_no = "#{s.year}-#{s.major.slice(0,3)}#{i+1}"
          inserts.push("('#{s.name_en}', '#{s.name_my}', #{s.exam_status}, '#{s.major}', #{s.year}, '#{s.distinctions}', '#{s.roll_no}', '#{Time.now}', '#{Time.now}')")
        end
        stmt = "INSERT INTO students (name_en, name_my, exam_status, major, year, distinctions, roll_no, created_at, updated_at) VALUES #{inserts.join(', ')}"
        puts "DONE"
      end
    end
    ActiveRecord::Base.connection.execute stmt

  end

  private

    def randomize_distinctions(year, count)
      result = ""
      subjects = (1..8).to_a
      count.times do
        result += "#{year}0#{subjects.shuffle.pop.to_s} "
      end
      result
    end

end
