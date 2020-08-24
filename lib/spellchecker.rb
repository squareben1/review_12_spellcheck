class SpellChecker 
  def spellcheck(string)
    dictionary = ["correct"]
    words = string.split(" ")
    checked_words = []

    words.each do |word|
      down_case_word = word.downcase
      if !dictionary.include?(down_case_word)
        checked_words.push("~#{word}~")
      else
        checked_words.push(word)
      end
    end
    checked_words.join(" ")
  end
end