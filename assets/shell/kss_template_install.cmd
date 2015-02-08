if [ -e libs/kss-node-template ]; then
  echo "kss-node-template has already installed"
else
  echo "kss-node-template has not been installed yet, start install..."
  git clone https://github.com/katsew/kss-node-template.git libs/kss-node-template
fi