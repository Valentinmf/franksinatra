#Cette classe représente un gossip, elle est définie par son auteur, son contenu et sa place dans le fichier csv
class Gossip
	attr_accessor :author, :content
	def initialize (author, content)
		@author = author
		@content = content
	end
	#sauvegarde l'instance dans le fichier csv
	def save
	  CSV.open("./db/gossip.csv", "ab") do |csv|
	    csv << [@author, @content]
	  end
  end

  def self.all
  	gossip_array = [] #on initialise un array vide
	 	CSV.read("./db/gossip.csv").each do |line|
		 	gossip_array << Gossip.new(line[0],line[1])
		end

 		return gossip_array
  end
  


def self.find(id)
	return Gossip.all[id]
end
  
  
end