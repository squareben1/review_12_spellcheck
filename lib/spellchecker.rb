class SpellChecker 
  def initialize(dictionary=[])
    @dictionary = homogenise_arr(dictionary)
  end

  def spellcheck(string)
    words = split_string(string)
    checked_words = []
    
    words.each do | word | 
      checked_words.push(word_check(word))
    end
    checked_words.join(" ")
  end

  def add_words(string)
    new_words = split_string(string)
    lower_case_words = homogenise_arr(new_words)

    @dictionary.push(*lower_case_words)
  end

  private

  def homogenise_arr(arr)
    arr.map!(&:downcase)
  end

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