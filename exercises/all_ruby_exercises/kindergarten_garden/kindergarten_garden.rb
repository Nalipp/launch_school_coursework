class Garden
  attr_reader :students, :diagram

  SEEDS = { "R" => "radishes", "C" => "clover", "V" => "violets",
            "G" => "grass" }.freeze

  STUDENTS = %w(alice bob charlie david eve fred ginny harriet ileana joseph
                kincaid larry).freeze

  def initialize(diagram, students=STUDENTS)
    @diagram = diagram.split("\n")
    @students = students.map(&:downcase).sort
    @children_hash = create_children_hash
    create_student_methods
  end

  def create_student_methods
    students.each do |student|
      student_methods = %(
        def #{student}
          @children_hash["#{student}"].chars.map { |char| SEEDS[char].to_sym }
        end
      )
      Garden.class_eval(student_methods)
    end
  end

  def create_children_hash
    index = 0
    students.each_with_object(Hash.new("")) do |child, hash|
      hash[child.to_sym]
      first_row = diagram.first.slice(index..index + 1)
      second_row = diagram.last.slice(index..index + 1)

      hash[child.to_s] = first_row unless first_row.nil?
      hash[child.to_s] += second_row unless second_row.nil?

      index += 2
    end
  end
end
