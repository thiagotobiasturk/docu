 TOKEN="xoxp-6209710763493-6236228023216-6985219927970-11eb62cab9358a8a317ec77b9e802ede"
PHOTO_FILE="captura.png"
CHANNEL_ID="C07NWTGR5GV" 

curl -F "token=$TOKEN" -F "channels=$CHANNEL_ID" -F "file=@$PHOTO_FILE" https://slack.com/api/files.upload

