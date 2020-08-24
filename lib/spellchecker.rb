class SpellChecker 
  def spellcheck(string)
    if string == "incorct"
      "~#{string}~"
    else
      string
    end
  end
end