class FileProcessor
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def process_on(processor)
    File.foreach(filename) do |line|
      process processor, line
    end
  end

  private

  def process(processor, line)
    clean_line = clean(line)
    puts clean_line
    processor.process(clean_line)
  end

  def clean(line)
    line.to_s.strip
  end
end
