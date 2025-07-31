wget https://dl.fbaipublicfiles.com/mega/wt103.zip
wget https://dl.fbaipublicfiles.com/mega/data/wt103_data_bin.zip
mkdir -p data
mkdir -p checkpoints
unzip wt103_data_bin.zip -d data
rm wt103_data_bin.zip
unzip wt103.zip -d checkpoints
rm wt103.zip