if [ ! "$(id -u)" != "0" ]; then    
    echo "Do not run this script as root. Docker will not have permission to write to the shared volume"
    exit 1
else
    if [ ! -d ~/.mono-develop ]; then
        echo "Creating directory ~/.mono-develop to store mono-develop plugins and settings"
        mkdir -p ~/.mono-develop/.local/share
        mkdir -p ~/.mono-develop/.cache/MonoDevelop-5.0
    fi
fi

docker run -ti --rm -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /workspace:/workspace \
    -v ~/.mono-develop/.local/share.MonoDevelop-5.0:/home/developer/.local/share/MonoDevelop-5.0 \
    -v ~/.mono-develop/.cache/MonoDevelop-5.0:/home/developer/.cache/MonoDevelop-5.0 \
    -p 9000:9000  monodevelop 
