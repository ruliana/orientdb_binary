module OrientdbBinary
  module Protocols

    class DbOpen < BinData::Record
      include OrientdbBinary::Protocols::Base
      
      endian :big

      int8 :operation, value: OrientdbBinary::OperationTypes::REQUEST_DB_OPEN
      int32 :session, value: OrientdbBinary::OperationTypes::NEW_SESSION

      protocol_string :driver_name, value: OrientdbBinary::NAME
      protocol_string :driver_version, value: OrientdbBinary::VERSION
      int16 :protocol
      protocol_string :client_id
      protocol_string :database_name
      # protocol_string :database_type
      protocol_string :user
      protocol_string :password
    end

    class DbOpenAnswer < BinData::Record
      endian :big

      skip length: 4
      int32 :session
      int32 :num_of_clusters
      array :clusters, initial_length: :num_of_clusters do
        protocol_string :cluster_name
        int16 :cluster_id
        protocol_string :cluster_type
      end
      int32 :a
    end
  end
end