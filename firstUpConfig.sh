echo "Beginning first up configuration"

echo "Changing keyboard mapping to GB"
# Requires x server which isn't running during vagrant setup 
setxkbmap gb

if command -v aws >/dev/null 2>&1; then
    echo "AWS CLI found. Starting interactive config"
    aws configure
fi


echo "First up Configuration complete"  
