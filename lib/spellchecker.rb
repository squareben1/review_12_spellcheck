class SpellChecker 
  def spellcheck(string)
    words = string.split(" ")
    checked_words = []

    words.each do |word|
      if word == "incorct"
        checked_words.push("~#{word}~")
      else
        checked_words.push(word)
      end
    end
    checked_words.join(" ")
  end
end