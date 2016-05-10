module ReviewsHelper
  def nl2br(s)
    s.gsub(/\n/, '<br>')
  end

  def anon_student(email)
    base = "by anonymous"
    school = email.split("@")[1].split(".")[-2]
    if school == "claremontmckenna"
      base + " CMC student"
    elsif school == "hmc"
      base + " Mudd student"
    elsif school == "pomona"
      base + " Pomona student"
    elsif school == "pitzer"
      base + " Pitzer student"
    elsif school == "scrippscollege"
      base + " Scripps student"
    else
      base
    end
  end
end
