# Code Review 12

Simple observed Kata to test TDD process.

## Retro

Overall pleased with review. 

Considered which data structure to use to allow extension by client (arrays = fast reads so good for instant feedback but less good for adding words - considered this was OK as would only need to add words once in theory).

At one point found myself doing way too much to pass a test but pleased that I caught myself and went back to passing code before re-thinking.

Again, I was pleased that I kept forcing myself to stick rigidly to process (or reminding myself to and going back...)

Refactors were good - nice learning point was my decision to refactor inbuilt .split method to it's own method as this would allow for client's stated prospective future extension: accounting for punctuality. On the same note pleased I didn't refactor .downcase - no way this could be extended. A good distinction to remember. 

Tried to have a focus on encapsulation throughout review. Chose a class in order to store state privately and access with public methods for this reason.

In line with potential future requirements I added a public #add method  after observation was over in order to further play with encapsulation.

I think splitting the class into SRP coherent methods went well and allows for extension later without having to change much (Open/Closed).

### DRY note/TODO:

In interest of keeping thrings DRY I added the following method: 
```
  def loop_add_words_to_arr(string, target_arr, check_word=false)
    words = split_string(string)

    words.each do | word | 
      target_arr.push(check_word ? word_check(word) : word)
    end
  end
```

I find this interesting for the check_word param but not sure if it really adheres to good practice. TODO - find this out.

ANSWER: I think I sacrificed readability for the sake of keeping it DRY in a case where extracting a #loop method really wasn't that helpful. Have gone in and refactored this to make it simpler and more readable. 

Note from Catherine: Tendency to refactor on green - e.g. when I interpolated ```"~#{word}~"``` when simply returning the unchanged string would have done. "No harm in saving these refactors for the refactor stage - this makes it less likely that you'll tangle yourself up".


## Initial Requirements Gathering

```
Spell Checker 

megasoftweird

Word processor
Spell checker

functionality: 
Take string - one or more words 
Identify any incorrectly spelled words, highlight them and return string as output
String: Same string as input but with typos highlighted with ~either~ side of misspelled word

No list of words but will have in future - create something easy to populate - include a few words = Array  

Empty string: “” - return string
Capitalisation - if caps input > caps output
punctuation: no punctuation in input, possible extension. 

In / Out 
“” > “”
“Correct” > “Correct”
“incorct” > “~incorct~”
“Correct incorct” > “Correct ~incorct~”
“Correct incorct aple” > “Correct ~incorct~ ~aple~”
“cOrrect” > “cOrrect”
```