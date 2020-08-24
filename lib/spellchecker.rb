class SpellChecker 
  def initialize
    @dictionary = ["correct"]
  end

  def spellcheck(string)
    words = string.split(" ")
    checked_words = []

    words.each do |word|
      down_case_word = word.downcase
      if !@dictionary.include?(down_case_word)
        checked_words.push("~#{word}~")
      else
        checked_words.push(word)
      end
    end
    checked_words.join(" ")
  end
end