require 'spellchecker'

describe SpellChecker do 
  describe '#spellcheck' do
    it 'returns an empty string' do
      expect(subject.spellcheck("")).to eq ""
    end

    it 'returns a correctly spelled string' do
      expect(subject.spellcheck("Correct")).to eq "Correct"
    end

    it 'returns an incorrectly spelled string highlighted with ~' do
      expect(subject.spellcheck("incorct")).to eq "~incorct~"
    end
  end
end