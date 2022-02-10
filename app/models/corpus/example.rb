class Corpus::Example < ::ApplicationRecord
  embeds_many :words, class_name: 'Corpus::Word'

  def self.get_examples_from_term(term:)
    lemma = Corpus::ParseText.(term).first.fetch(:lemma)
    self.where('words.lemma' => lemma).all
  end
end
