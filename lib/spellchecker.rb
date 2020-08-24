class SpellChecker 
  def initialize
    @dictionary = ["correct"]
  end

  def spellcheck(string)
    words = split_string(string)
    checked_words = []

    words.each do |word|
      checked_words.push(word_check(word))
    end
    checked_words.join(" ")
  end

  def add_words(string)
    words = split_string(string)

    words.each do | word | 
      @dictionary.push(word)
    end
    @dictionary
  end

  private

  def split_string(string)
    # gives potential for extension when client needs punctuation, etc.
    string.split(" ")
  end

  def word_check(word)
    down_case_word = word.downcase

    if !@dictionary.include?(down_case_word)
      "~#{word}~"
    else
      word
    end
  end
end