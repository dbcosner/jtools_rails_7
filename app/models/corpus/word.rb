class Corpus::Word
  include Mongoid::Document

  field :word, type: String
  field :lemma, type: String
  field :part_of_speech, type: String
  field :extra, type: Hash
  field :_class, type: String
  field :tokens, type: Array
  field :info, type: Hash

  embedded_in :example, class_name: 'Corpus::Example'
end