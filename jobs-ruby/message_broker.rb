module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Hash 7995
# Hash 1010
# Hash 6931
# Hash 9567
# Hash 3376
# Hash 6920
# Hash 1997
# Hash 9534
# Hash 6327
# Hash 4602
# Hash 2855
# Hash 1966
# Hash 7639
# Hash 6135
# Hash 2508
# Hash 4316
# Hash 3147
# Hash 2049
# Hash 6849
# Hash 4152
# Hash 2823
# Hash 2715
# Hash 7683
# Hash 3326
# Hash 4396
# Hash 6782
# Hash 7668
# Hash 1589
# Hash 7946
# Hash 7207
# Hash 7028
# Hash 8218
# Hash 5140
# Hash 8751
# Hash 6215
# Hash 8869
# Hash 8563
# Hash 8752
# Hash 3489
# Hash 8451
# Hash 5620
# Hash 6352
# Hash 6232
# Hash 4028
# Hash 5912
# Hash 3715
# Hash 4875
# Hash 3362
# Hash 3254
# Hash 7173
# Hash 9918
# Hash 5751
# Hash 1722
# Hash 4677
# Hash 5012
# Hash 6842
# Hash 8971
# Hash 4424
# Hash 4782
# Hash 3428
# Hash 1457
# Hash 5708
# Hash 3252
# Hash 1088
# Hash 2591
# Hash 2541
# Hash 1420
# Hash 1094
# Hash 4160
# Hash 1528
# Hash 6742
# Hash 6435
# Hash 3459
# Hash 5329
# Hash 3730
# Hash 5400
# Hash 8754
# Hash 7340
# Hash 3681
# Hash 5149
# Hash 3267
# Hash 8658
# Hash 8965
# Hash 9941
# Hash 5948
# Hash 6219
# Hash 9608
# Hash 2667
# Hash 2393
# Hash 7141
# Hash 9405
# Hash 2257
# Hash 3490
# Hash 4832
# Hash 7215
# Hash 4318
# Hash 9132
# Hash 8525
# Hash 8124
# Hash 5343
# Hash 8167
# Hash 3821
# Hash 1330
# Hash 7508
# Hash 1965
# Hash 3080
# Hash 7159
# Hash 6967
# Hash 5534
# Hash 4085
# Hash 7430
# Hash 1304
# Hash 7383
# Hash 3355
# Hash 1304
# Hash 3087
# Hash 7153
# Hash 3828
# Hash 1516
# Hash 4163