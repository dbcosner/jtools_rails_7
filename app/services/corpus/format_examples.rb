class Corpus::FormatExamples
  # NOTE : It's probably not great the return value is tied to the Ve gem

  include ::Mandate

  initialize_with :examples

  def call
    parse_examples(examples)
  end

  private

  def parse_examples(examples)
    examples.inject([]) do |parsed_examples, example|
      parsed_example = example.words.map do |word|
        {
          word: word.word,
          lemma: word.lemma,
          reading: word.extra.fetch('reading', nil)
        }
      end
      parsed_examples << parsed_example
    end
  end
end
