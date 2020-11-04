module InstanceCounter
  @@hash_counts = {}

  def self.instances(type)
    @@hash_counts[type.to_s]
  end

  protected

  def register_instance(type)
  	if @@hash_counts.has_key?(type.to_s)
    	@@hash_counts[type.to_s] += 1
		else
			@@hash_counts[type.to_s] = 1
		end
  end
end
