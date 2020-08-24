require 'spellchecker'

describe SpellChecker do
  subject = SpellChecker.new(["correct"])
  describe '#spellcheck' do
    it 'returns an empty string' do
      expect(subject.spellcheck("")).to eq ""
    end

    it 'returns a correctly spelled string' do
      expect(subject.spellcheck("Correct")).to eq "Correct"
    end

    it 'returns a correctly spelled string capitalised in same way as input' do
      expect(subject.spellcheck("cOrrect")).to eq "cOrrect"
    end

    it 'returns an incorrectly spelled string highlighted with ~' do
      expect(subject.spellcheck("incorct")).to eq "~incorct~"
    end

    it 'returns string of mixed correct & incorrect words' do
      expect(subject.spellcheck("Correct incorct")).to eq "Correct ~incorct~"
    end

    it 'returns new string of mixed correct & incorrect words' do
      expect(subject.spellcheck("Correct incorct aple")).to eq "Correct ~incorct~ ~aple~"
    end
  end

  describe '#add_words' do
    before :each do
      subject = SpellChecker.new(["correct"])
    end

    it 'adds single word to dictionary array with public method' do
      expect(subject.add_words("encapsulation")).to eq ["correct", "encapsulation"]
    end

    it 'adds multi words to dictionary array with public method' do
      expect(subject.add_words("encapsulation abstraction")).to eq ["correct", "encapsulation", "abstraction"]
    end
  end
end