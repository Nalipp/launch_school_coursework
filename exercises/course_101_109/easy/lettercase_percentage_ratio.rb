def letter_percentages(str)
  multiplier = 100 / str.length.to_f
  percents = {}
    percents[:lowercase] = multiplier * str.count("\\a-z").to_f
    percents[:uppercase] = multiplier * str.count("\\A-Z").to_f
    percents[:neither] = multiplier * (str.length - str.count("\\a-zA-Z")).to_f
  percents
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
