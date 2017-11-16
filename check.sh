# !/bin/bash
GRAY_TYPE="MQAU2LL/A"
SILVER_TYPE="MQAV2LL/A"


GRAY=$(curl "https://www.apple.com/shop/retail/pickup-message?pl=true&searchNearby=true&cppart=TMOBILE/US&parts.0=$GRAY_TYPE&store=R047")
SILVER=$(curl "https://www.apple.com/shop/retail/pickup-message?pl=true&cppart=TMOBILE/US&parts.0=$SILVER_TYPE&location=80206")
echo 'Space Gray:'

echo $GRAY | jq '.body .stores | map(select(.partsAvailability ."MQAU2LL/A" .storeSelectionEnabled == true)) | .[] | [.storeName, .city]'

echo 'Silver:'

echo $SILVER | jq '.body .stores | map(select(.partsAvailability ."MQAV2LL/A" .storeSelectionEnabled == true)) | .[] | [.storeName, .city]'
