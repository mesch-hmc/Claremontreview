module CoursesHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def real_average(rGrades)
    length = rGrades.size
    if (length == 0)
      return ""
    end

    grades = { "A+" => 97, "A" => 94, "A-" => 90, "B+" => 87, "B" => 84, "B-" => 80, "C+" => 77, "C" => 74, "C-" => 70, "D+" => 67, "D" => 64, "D-" => 60, "F" => 50}

    count = 0
    for i in 0..rGrades.size-1
      if grades.has_key?(rGrades[i])
        count = count + grades[rGrades[i]]
      else
        length = length - 1
      end
    end

    result = ((length < 1) ? 0 : count / length).to_i.to_s
    rF = result[0].to_i
    rL = result[1].to_i
    
    output = ''
    if result == 100
      return 'A+'
    end

    if rF == 9
      output = 'A'
    elsif rF == 8
      output = 'B'
    elsif rF == 7
      output = 'C'
    elsif rF == 6
      output = 'D'
    elsif rF <= 5
      return 'F'
    end

    if rL.between?(7,9)
      output = output + "+"
    elsif rL.between?(0,3)
      output = output + "-"
    end

    return output
  end
end
