# Check MEVBoost Registration

Script to check if a public key is registered with a list of MEVBoost relays

# Requirements

* Bash version 4 or greater
* curl
* jq
* an emoji capable terminal 🤷

# Usage

./check_validators.sh YOURPUBLICKEY


# Example

(I picked a random validator key from beaconcha.in for this example)

```
$ ./check_validators.sh 0x8000558843d93fd74ad009d1f120e657c09fea88c44d1d739dccbafdca9e6f5df6d2649825ac7db5f2078aade4bf03cb

Checking if public key 0x8000558843d93fd74ad009d1f120e657c09fea88c44d1d739dccbafdca9e6f5df6d2649825ac7db5f2078aade4bf03cb is registered...
BloXroute_max_profit ✅
BloXroute_ethical ✅
Blocknative ✅
Flashbots ✅
Eden ❌
BloXroute_regulated ✅
```

# Relays

The following relays are checked:

* BloXroute max profit,  https://bloxroute.max-profit.blxrbdn.com
* BloXroute ethical, https://bloxroute.ethical.blxrbdn.com
* BloXroute regulated, https://bloxroute.regulated.blxrbdn.com
* Blocknative, https://builder-relay-mainnet.blocknative.com
* Eden, https://relay.edennetwork.io
* Flashbots, https://boost-relay.flashbots.net

Manifold's relay is not included because they do not implement the validator_registration endpoint. 

