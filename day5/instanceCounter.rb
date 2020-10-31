module InstanceCounter
  @@hash_counts = { 'Station' => 0, 'Route' => 0, 'Train' => 0, 'PassengerTrain' => 0, 'CargoTrain' => 0 }

  def self.instances(type)
    @@hash_counts[type.to_s]
  end

  protected

  def register_instance(type)
    @@hash_counts[type.to_s] += 1
  end
end
