module Commands
  # Handle all commands that are not handled elsewhere
  class Invalid
    # silently ignore, as specified in the requirements
    def execute(object); end
  end
end
