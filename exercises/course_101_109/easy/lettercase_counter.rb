def lowercase?(letter)
  !letter.match(/[a-z]/).nil?
end

def uppercase?(letter)
  !letter.match(/[A-Z]/).nil?
end

def neither?(letter)
  !letter.match(/[^A-Z^a-z]/).nil?
end

def letter_case_count(string)
  counts_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |letter|
    counts_hash[:lowercase] += 1 if lowercase?(letter)
    counts_hash[:uppercase] += 1 if uppercase?(letter)
    counts_hash[:neither] += 1 if neither?(letter)
  end
  counts_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
