require 'spellchecker'

describe SpellChecker do 
  describe '#spellcheck' do
    it 'returns an empty string' do
      expect(subject.spellcheck("")).to eq ""
    end

    it 'returns a correctly spelled string' do
      expect(subject.spellcheck("Correct")).to eq "Correct"
    end
  end
end