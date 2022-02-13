require 'rails_helper'

RSpec.describe Corpus::Example do
  it 'stores the JSON created by the parsing Service as a document' do
    example_sentence = 'この世界の教育にはがっかりしてしまう。'
    example_obj = Corpus::ParseText.(example_sentence)
    example = described_class.create({ words: example_obj })

    expected = example_obj.first
    actual = example.words.first

    # Not exactly comprehensive, but :
    expect(expected[:word]).to eq(actual.word)
    expect(expected[:lemma]).to eq(actual.lemma)
  end

  it 'returns the examples that include forms of the given adjective' do
    returned_sentence = 'この映画なんかどう？面白いとの評判だよ'
    not_returned_sentence = '昨日見たあの映画、つまらなかったよね…'
    parsed_returned_sentence = Corpus::ParseText.(returned_sentence)
    parsed_not_returned_sentence = Corpus::ParseText.(not_returned_sentence)
    described_class.create({ words: parsed_returned_sentence })
    described_class.create({ words: parsed_not_returned_sentence })

    search_term = '面白かった'
    results = described_class.get_examples_from_term(term: search_term).all
    expected = returned_sentence
    actual = results.first.words.map(&:word).join

    expect(results.count).to eq(1)
    expect(expected).to eq(actual)
  end

  it 'returns the examples that include forms of the given verb' do
    returned_sentence = '電車がすぐに動き出すだろう'
    not_returned_sentence = '電車が急に止まっちゃった'
    parsed_returned_sentence = Corpus::ParseText.(returned_sentence)
    parsed_not_returned_sentence = Corpus::ParseText.(not_returned_sentence)
    described_class.create({ words: parsed_returned_sentence })
    described_class.create({ words: parsed_not_returned_sentence })

    search_term = '動き出した'
    results = described_class.get_examples_from_term(term: search_term).all
    expected = returned_sentence
    actual = results.first.words.map(&:word).join

    expect(results.count).to eq(1)
    expect(expected).to eq(actual)
  end
end
