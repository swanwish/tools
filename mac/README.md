# Compress audio files

Use the following command to compress all the audio files in current folder with `ffmpeg` command.

The converted file name will be `_` add the orignal file name, and the file with `_` prefix will be ignored.

```
curl https://raw.githubusercontent.com/swanwish/tools/master/mac/compress_audio.sh | bash
```

# Navigate to iOS simulator data director from terminal

The `simpath.sh` is a tool to navigate to the iOS simulator's data dir from terminal, in order to use this tool, 
you should create a file `~/simpath.conf`, the sample `simpath.conf` are like below:

## Sample simpath.conf

```
testapp1=com.example.app1
testapp2=com.example.app2
```

With the simpath.conf file in place, then we can use `simpath.sh` to navigate to the data dir of the iOS Simulator.

```
simpath testapp1
```

Install on `simpath.sh`

```
sudo curl https://raw.githubusercontent.com/swanwish/tools/master/mac/simpath.sh -o /usr/local/bin/simpath.sh
sudo chmod +x /usr/local/bin/simpath.sh
touch ~/simpath.conf
```

## Install tool to convert_audio.sh

```
curl https://raw.githubusercontent.com/swanwish/tools/master/mac/install_convert_audio.sh | sudo bash
```
