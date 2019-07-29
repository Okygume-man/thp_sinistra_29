class Gossip
  attr_accessor :gossip_author, :gossip_content

  def initialize(gossip_author, gossip_content)
    @gossip_author = gossip_author
    @gossip_content = gossip_content
  end

  def save
  CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << ["#{@gossip_author}", "#{@gossip_content}"]
    end
  end

  
  def self.all
		all_gossips = []
		CSV.read("./bd/gossips.csv", "rb").each do |row|
			all_gossips << Gossip.new(row[0], row[1])
		end
		return all_gossips
    
  end
  
  def self.find(id)
		the_id = id.to_i - 1
		CSV.read("./bd/gossips.csv", "rb").fetch(the_id)
		
		return the_id + 1
  end


end