require 'rails_helper'

RSpec.describe Corpus::PopulateCorpus do
  it 'Populates the corpus' do
    corpus = "文章その一\n"\
      "文章その二\n"\
      "文章その三\n"

    temp_file_path = Rails.root.join('data', 'temp_corpus.tsv')

    File.open(temp_file_path, 'w') { |file| file.write(corpus) }
    described_class.([temp_file_path])
    File.delete(temp_file_path)

    expect(Corpus::Example.all.count).to eq(3)
  end
end
