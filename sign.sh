#!/bin/bash 
#
# An implemenation of Magic Signatures in Bash. Just what you need
# to test interop of your library.
#
# Copyright Laurent Eschenauer <laurent@eschenauer.be>
# MIT License

if [ $# -ne 2 ]
then
  echo "Usage: `basename $0` input.txt key.pem"
  exit -1
fi

DATATYPE="application/atom+xml"
ALG="RSA-SHA256"
ENCODING="base64url"
EXPONENT="010001"


# A wrapper of the base64 command line tool
# to convert to base64url and remove padding.
function b64url_encode {
	base64 -w 0 | sed 's/+/-/g' | sed 's/\//_/g' | sed 's/\=//g'
}

DATA=$(cat $1 | b64url_encode)
M=$DATA.$(echo -n $DATATYPE | b64url_encode).$(echo -n $ENCODING | b64url_encode).$(echo -n $ALG | b64url_encode)
HASH=$(echo -n $M | sha256sum | cut -f1 -d ' ')

SIG=$(echo -n $HASH | openssl rsautl -sign -inkey $2 | b64url_encode)
MOD=$(openssl rsa -noout -modulus -in $2)
MODB64=$(echo -n ${MOD:8} | xxd -ps -r | b64url_encode)
EXPB64=$(echo -n $EXPONENT | xxd -ps -r | b64url_encode)
KEY=RSA.$MODB64.$EXPB64

echo -e "me.data:\t$DATA"
echo -e "me.alg:\t\t$ALG"
echo -e "me.data_type:\t$DATATYPE"
echo -e "me.encoding:\t$ENCODING"
echo -e "M:\t\t$M"
echo -e "Sha256:\t\t$HASH"
echo -e "Key:\t\t$KEY"
echo -e "Signature:\t$SIG"

echo $KEY > $2.txt
echo $SIG > $1.sign
