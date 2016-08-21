FIRST = %w(a b c d e f g h i j k l m A B C D E F G H I J K L M)
LAST = %w(n o p q r s t u v w x y z N O P Q R S T U V W X Y Z)

def decode(str)
  str.chars.map do |char|
    if FIRST.include?(char)
      LAST[FIRST.find_index(char)]
    elsif LAST.include?(char)
      FIRST[LAST.find_index(char)]
    else
      ' '
    end
  end.join
end

# p decode('Nqn Ybirynpr')
# p decode('Tenpr Ubccre')
# p decode('Nqryr Tbyqfgvar')
# p decode('Nyna Ghevat')
# p decode('Puneyrf Onoontr')
# p decode('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
# p decode('Wbua Ngnanfbss')
# p decode('Ybvf Unyog')
# p decode('Pynhqr Funaaba')
# p decode('Fgrir Wbof')
# p decode('Ovyy Tngrf')
# p decode('Gvz Orearef-Yrr')
# p decode('Fgrir Jbmavnx')
# p decode('Xbaenq Mhfr')
# p decode('Wbua Ngnanfbss')
# p decode('Fve Nagbal Ubner')
# p decode('Zneiva Zvafxl')
# p decode('Lhxvuveb Zngfhzbgb')
# p decode('Unllvz Fybavzfxv')
# p decode('Tregehqr Oynapu')
