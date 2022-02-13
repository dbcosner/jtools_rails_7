class Corpus::ExamplesController < ::ApplicationController
  def search
    unformatted_examples = Corpus::Example.get_examples_from_term(term: params[:term])
    @examples = Corpus::FormatExamples.(unformatted_examples)
  end
end