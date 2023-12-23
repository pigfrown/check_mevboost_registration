#!/usr/bin/env bash


if [ -z ${1+x} ] ; then
	echo "Usage: ./check_validators PUBLICKEY"
	exit 1
fi

validator_key_to_check=$1
# Check we have required programs
if ! command -v curl &> /dev/null ; then
	echo curl command is required.. bye bye
	exit 2
fi

if ! command -v jq &> /dev/null ; then
	echo jq command is required.. bye bye
	exit 3
fi

url_path="relay/v1/data/validator_registration?pubkey="

# map where key = relay name, value = relay url
declare -A relays

relays[BloXroute_max_profit]="https://bloxroute.max-profit.blxrbdn.com"
relays[Ultrasound_Money]="https://relay.ultrasound.money"
relays[BloXroute_ethical]="https://bloxroute.ethical.blxrbdn.com"
relays[BloXroute_regulated]="https://bloxroute.regulated.blxrbdn.com"
relays[Blocknative]="https://builder-relay-mainnet.blocknative.com"
relays[Eden]="https://relay.edennetwork.io"
relays[Flashbots]="https://boost-relay.flashbots.net"
relays[Agnostic]="https://agnostic-relay.net"


# Manifold doesn't follow the spec.. leaving this out for now
#relays[Manifold]="https://mainnet-relay.securerpc.com"



echo Checking if public key $validator_key_to_check is registered...

for key in "${!relays[@]}" ; do
	check_url="${relays[$key]}/${url_path}$validator_key_to_check"
	# Some relays redirect, follow the redirection
	if [ "$(curl -Ls $check_url | jq .code)"  = null ] ; then
		echo "$key ✅"
	else
		echo "$key ❌"
	fi
done
