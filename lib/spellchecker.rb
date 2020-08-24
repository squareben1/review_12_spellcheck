class SpellChecker 
  def initialize(dictionary=[])
    @dictionary = homogenise_arr(dictionary)
  end

  def spellcheck(string)
    checked_words = []

    loop_add_words_to_arr(string, checked_words, true)
    checked_words.join(" ")
  end

  def add_words(string)
    loop_add_words_to_arr(string, @dictionary)
    homogenise_arr(@dictionary)
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

  def loop_add_words_to_arr(string, target_arr, check_word=false)
    words = split_string(string)

    words.each do | word | 
      target_arr.push(check_word ? word_check(word) : word)
    end
  end
end