# AH: As per recommendation from Mason, we can pull info from Core 'lazily' - IE when we access the document for the first time
# NOTE: We need to have logic so if the Doc is saved, the second time this pulls from our new schema

# AH: However we could have a case for pulling the data in when an RPX admin drops case keys in - say latency ends up being an issue and we host Docblaster in AWS Singapore. Then maybe eagering pulling in the data would have better response times for the hand coders.
class DocEditPresenter
  class << self
    def present doc
      # this should transform data (like Status from ID to english)
      return doc
    end
  end

end