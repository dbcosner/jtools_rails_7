class Corpus::ParseText
  # NOTE : It's probably not great the return value is tied to the Ve gem

  include ::Mandate

  initialize_with :text

  def call
    parse_text(text)
  end

  private

  def parse_text(text)
    words = Ve.in(:ja).words(text)

    # NOTE: The return value will still use Ruby data structures.
    # It will NOT be a JSON-formatted String.
    words.map(&:as_json)
  end
end
