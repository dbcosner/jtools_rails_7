class Corpus::PopulateCorpus
  include ::Mandate

  initialize_with :corpus_file_paths

  def call
    error_log_file_path = Rails.root.join('log', 'populate_errors.log')
    @error_logger = Logger.new(error_log_file_path)

    corpus_file_paths.each { |corpus_file_path| populate_from_corpus(corpus_file_path) }
  end

  private

  def populate_from_corpus(corpus_file_path)
    # Attempt to populate from each line. Fail quietly and continue to the next line
    # if one of the lines cannot be persisted :
    print 'Reticulating splines.' if Rails.env.development?
    count = 0
    File.readlines(corpus_file_path).each do |line|
      begin
        formatted_line = Corpus::ParseText.(line)
        Corpus::Example.create!(words: formatted_line)

        count +=1
        print '.' if (count % 100 == 0) && Rails.env.development?
      rescue Exception => e
        @error_logger.info("#{e}\n")
      end
    end
  end
end
