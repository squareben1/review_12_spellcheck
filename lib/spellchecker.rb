class SpellChecker 
  def initialize
    @dictionary = ["correct"]
  end

  def spellcheck(string)
    words = split_string(string)
    checked_words = []

    loop_add_words_to_arr(string, checked_words, true)
    checked_words.join(" ")
  end

  def add_words(string)
    loop_add_words_to_arr(string, @dictionary)

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

  def loop_add_words_to_arr(string, target_arr, check_word=false)
    words = split_string(string)

    words.each do | word | 
      check_word ? target_arr.push(word_check(word)) : target_arr.push(word) 
    end
  end
end