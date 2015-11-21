json.data do
  json.array!(@students) do |student|
    json.extract! student, :id, :roll_no, :name_en, :name_my, :exam_status, :distinctions, :major, :year
    json.url student_url(student, format: :json)
  end
end
json.meta paginate(@students)
