module ReviewsHelper
  def nl2br(s)
    s.gsub(/\n/, '<br>')
  end
end
