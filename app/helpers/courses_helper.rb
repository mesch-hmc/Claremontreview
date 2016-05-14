module CoursesHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def real_average(gradeHash)
    length = gradeHash.size
    if length == 0
      return ""
    end

    passFailKeys = ["HP","P","NC"]
    letterGradeKeys = ["A+","A","A-","B+","B","B-","C+","C","C-","D+","D","D-","F"]
    passFailCount = 0
    passFailKeys.each do |key|
      passFailCount += gradeHash[key] if !gradeHash[key].nil?
    end
    letterGradeCount = 0
    letterGradeKeys.each do |key|
      letterGradeCount += gradeHash[key] if !gradeHash[key].nil?
    end

    total = gradeHash.values.inject(0){|sum,x| sum + x}
    if passFailCount > 0 and letterGradeCount > 0
      new_total = gradeHash.except("HP","P","NC").values.inject(0){|sum,x| sum + x}
      return letterGrade gradeHash.except("HP","P","NC"), new_total
    elsif letterGradeCount > 0
      return letterGrade gradeHash, total
    else
      return passFail gradeHash, total
    end
  end

  def passFail(gradeHash, total)
    count = 0
    gradeValues = { "HP" => 3, "P" => 2, "NC" => 1 }
    gradeHash.each do |key,value|
      count += gradeValues[key] * value
    end

    result = (count.to_f / total).round
    if result == 3
      return "HP"
    elsif result == 2
      return "P"
    else
      return "F"
    end
  end

  def letterGrade(gradeHash, total)
    count = 0
    gradeValues = { "A+" => 97, "A" => 94, "A-" => 90, "B+" => 87, "B" => 84, "B-" => 80, "C+" => 77, "C" => 74, "C-" => 70, "D+" => 67, "D" => 64, "D-" => 60, "F" => 50}
    gradeHash.each do |key,value|
      count += gradeValues[key] * value
    end

    result = (count / total).to_i.to_s
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

  def gradeHash(course)
    course.reviews.unscoped.where(:course_id => @course).group(:grade).count
  end

  def gradeDist(hash)
    grades = ['A+','A','A-','B+','B','B-','C+','C','C-','D+','D','D-','F','HP','P','NC']
    h = Hash[ grades.collect { |v| [ v, 0 ] }]
    hash.map do |key,value|
      h[key]=value
    end
    list = h.map do |key,value|
      "#{key}:#{value}"
    end
    list.map(&:inspect).join(',').gsub('"','')
  end

  def schoolColor(school)
    color = "#EAAA00";
    if school == 'CM'
      color = "#981B32";
    elsif school == 'HM'
      color = "#EAAA00";
    elsif school == 'PO'
      color = "#20438f";
    elsif school == 'PZ'
      color = "#f7941d";
    elsif school == 'SC'
      color = "#2e4d41";
    end
    color
  end
end
