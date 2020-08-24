class SpellChecker 
  def spellcheck(string)
    dictionary = ["correct"]
    words = string.split(" ")
    checked_words = []

    words.each do |word|
      if !dictionary.include?(word.downcase)
        checked_words.push("~#{word}~")
      else
        checked_words.push(word)
      end
    end
    checked_words.join(" ")
  end
end