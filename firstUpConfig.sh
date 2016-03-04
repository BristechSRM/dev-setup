echo "Beginning first up configuration"
if command -v aws >/dev/null 2>&1; then
    echo "AWS CLI found. Starting interactive config"
    aws configure
fi

echo "Changing keyboard mapping to GB"
setxkbmap gb
echo "First up Configuration complete"  
