attr_accessor :id, :name, :grade


   def self.all_students_in_grade_9 
    sql = <<-SQL
      SELECT *
      FROM students
      WHERE grade=9
    SQL
    DB[:conn].execute(sql).map do |row|
      self.new_from_db(row)
    end
  end

   def self.students_below_12th_grade 
    sql = <<-SQL
      SELECT *
      FROM students
      WHERE grade<12
    SQL
    DB[:conn].execute(sql).map do |row|
      self.new_from_db(row)
    end
  end

   def self.first_X_students_in_grade_10(number)
    sql = <<-SQL
      SELECT *
      FROM students
      WHERE grade = 10
      ORDER BY students.id
      LIMIT ?
    SQL

     DB[:conn].execute(sql, number).map do |row|
      self.new_from_db(row)
    end
  end

def self.first_student_in_grade_10 
    sql = <<-SQL
      SELECT *
      FROM students
      WHERE grade=10
      ORDER BY students.id LIMIT 1
    SQL
    DB[:conn].execute(sql).map do |row|
      self.new_from_db(row)
    end.first
  end

  def self.all_students_in_grade_X(grade)
    sql = <<-SQL
      SELECT *
      FROM students
      WHERE grade = ?
      ORDER BY students.id
    SQL

     DB[:conn].execute(sql, grade).map do |row|
      self.new_from_db(row)
    end
  end
end
def self.new_from_db(row)
   create a new Student object given a row from the database
  new_student = self.new
  new_student.id = row[0]
  new_student.name =  row[1]
  new_student.grade = row[2]
  new_student
end	

def self.all
    # retrieve all the rows from the "Students" database	    # retrieve all the rows from the "Students" database
    sql = <<-SQL
      SELECT *
      FROM students
    SQL
    DB[:conn].execute(sql).map do |row|
      self.new_from_db(row)
    end
  end	  

 def self.find_by_name(name)
    # find the student in the database given a name	    # find the student in the database given a name
    sql = <<-SQL
      SELECT *
      FROM students
      WHERE name = ?
      LIMIT 1
    SQL

     DB[:conn].execute(sql, name).map do |row|
      self.new_from_db(row)
    end.first
  end	  
 
end


   def save	  def save