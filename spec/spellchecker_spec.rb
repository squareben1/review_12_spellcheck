require 'spellchecker'

describe SpellChecker do 
  describe '#spellcheck' do
    it 'returns an empty string' do
      expect(subject.spellcheck("")).to eq ""
    end
  end
end