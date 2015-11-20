class CreateDummyStudentService

  def call
    inserts = []
    s = Student.new
    1000.times do|i|
      s.name_en = Faker::Name.name.gsub("\'", "")
      puts "Name: #{s.name_en}, #{Faker::Name.name}"
      s.exam_status = [true, false].sample
      s.major = Faker::Team.name
      s.year  = (1..4).to_a.sample
      s.distinctions = [true, false].sample ? randomize_distinctions(s.year, rand(1..8)) : ""
      s.roll_no = "#{s.year}-#{s.major.slice(0,3)}"
      inserts.push("('#{s.name_en}', '#{s.name_my}', #{s.exam_status}, '#{s.major}', #{s.year}, '#{s.distinctions}', '#{s.roll_no}', '#{Time.now}', '#{Time.now}')")
    end
    stmt = "INSERT INTO students (name_en, name_my, exam_status, major, year, distinctions, roll_no, created_at, updated_at) VALUES #{inserts.join(', ')}"
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