class School
  def initialize
    @grades = {}
  end

  def add(student_name, grade)
    @grades[grade] ||= []
    @grades[grade] << student_name
    @grades[grade].sort!
  end

  def grade(grade_number)
    @grades[grade_number] || []
  end

  def to_h
    @grades.sort.to_h
  end
end
