class Search
  include ActiveModel::Model
  #include ActiveModel::EachValidator
  attr_accessor :date, :time
  validate :date_valid?

end

def date_valid?
  return if date.blank?
  convertDate = date.delete("-")
  y = convertDate[0, 4].to_i
  m = convertDate[4, 2].to_i
  d = convertDate[6, 2].to_i
  unless Date.valid_date?(y, m, d)
    errors.add(:date, "日付の値が不正です")
  end
end