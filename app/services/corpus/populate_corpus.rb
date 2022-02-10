class Corpus::PopulateCorpus
  include ::Mandate

  initialize_with :corpus_file_paths

  def call
    corpus_file_paths.each { |corpus_file_path| populate_from_corpus(corpus_file_path) }
  end

  private

  def populate_from_corpus(corpus_file_path)
    File.readlines(corpus_file_path).each do |line|
      formatted_line = Corpus::ParseText.(line)
      Corpus::Example.create!(words: formatted_line)
    end
  end
end
