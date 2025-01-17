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