require_relative "../config/environment.rb"

class Student
  attr_accessor :name, :grade
  attr_reader :id

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def save
    query = <<-SQL
      INSERT INTO students
        (name, grade) VALUES (?, ?);
      SQL
    DB[:conn].execute(query, @name, @grade)
  end

  def self.create_table
    query = <<-SQL
      CREATE TABLE students
        (id INTEGER PRIMARY KEY,
        name TEXT,
        grade INTEGER
        );
      SQL
    DB[:conn].execute(query)
  end
  
  def self.drop_table
    query = <<-SQL
      DROP TABLE students;
      SQL
    DB[:conn].execute(query)
  end
end
