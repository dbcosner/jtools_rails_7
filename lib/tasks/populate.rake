# TODO: Make all the source URL & file paths part of a yml file

# rubocop:disable Metrics/BlockLength
namespace :corpora do
  desc 'Populate example sentences & metadata'
  task download_tatoeba_corpus: %i[environment] do
    puts "Downloading the Tatoeba corpus..."

    url = 'https://downloads.tatoeba.org/exports/per_language/jpn/jpn_sentences.tsv.bz2'
    temp_file = Down.download(url)
    corpora_relative_dir = Rails.root.join('data', 'corpora')
    FileUtils.mkdir_p(corpora_relative_dir)
    relative_path = File.join(corpora_relative_dir, 'tatoeba_corpus.tsv.bz2')
    FileUtils.mv(temp_file.path, relative_path) # overwrites by default
  end

  task extract_tatoeba_corpus: %i[environment download_tatoeba_corpus] do
    puts "Extracting the Tatoeba corpus..."

    full_path = Rails.root.join('data', 'corpora', 'tatoeba_corpus.tsv.bz2').to_s
    raise 'Improperly formatted archive' unless Extracter.is_this_a_valid_archive?(full_path)

    data_path = Rails.root.join('data', 'corpora').to_s
    data_full_path = Rails.root.join('data', 'corpora', 'tatoeba_corpus.tsv').to_s
    File.delete(data_full_path) if File.exist?(data_full_path)
    Extracter.extract_what_to(full_path, data_path)
  end

  task format_tatoeba_corpus: %i[environment extract_tatoeba_corpus] do
    puts "Formatting the Tatoeba corpus..."

    formatted_file_path = Rails.root.join('data', 'corpora', 'tatoeba_corpus_formatted.tsv')
    File.delete(formatted_file_path) if File.exist?(formatted_file_path)

    formatted_file = File.open(formatted_file_path, 'a')
    unformatted_file_path = Rails.root.join('data', 'corpora', 'tatoeba_corpus.tsv')
    begin
      File.readlines(unformatted_file_path).each do |line|
        formatted_line = "#{line.split(/\s+/).last}\n"
        formatted_file.write(formatted_line)
      end
    ensure
      formatted_file.close
    end
  end

  # It's simpler to rebuild the corpus each time :
  # task truncate_corpus: %i[environment format_tatoeba_corpus] do
  task truncate_corpus: %i[environment] do
    puts "Truncating the Grand Universal Corpus..."

    Corpus::Example.delete_all
  end

  task populate_db_from_formatted_corpora: %i[environment truncate_corpus] do
    puts "Populating the GUC from the Tatoeba Corpus..."

    tatoeba_file_path = Rails.root.join('data', 'corpora', 'tatoeba_corpus_formatted.tsv')
    # tatoeba_file_path = Rails.root.join('data', 'corpora', 'small_corpus_formatted.tsv')
    Corpus::PopulateCorpus.([tatoeba_file_path])
  end
end
# rubocop:enable Metrics/BlockLength
