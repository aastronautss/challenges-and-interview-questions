class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end

  def insert(new_data)
    branch = new_data <= @data ? :left : :right

    if self.send(branch).nil?
      self.send("#{branch}=", Bst.new(new_data))
    else
      self.send(branch).insert new_data
    end
  end

  def each(&block)
    return enum_for(:each) unless block

    @left.each &block unless @left.nil?
    block.call(@data)
    @right.each &block unless @right.nil?
  end
end
