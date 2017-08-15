class Anagram
  def initialize(str)
    @str = str.downcase
  end

  def match(arr)
    arr.select { |word| anagram?(@str, word.downcase) && @str != word.downcase }
  end

  private

  def anagram?(word1, word2)
    word1.split('').sort == word2.split('').sort
  end
end
