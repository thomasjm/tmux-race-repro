
# How to use

``` bash
# Build the image
docker build . -t tmux-race-repro

# Run the image
docker run -it --rm tmux-race-repro
```

About half the time, the config file will load and you'll see a black and white status bar at the bottom.

The rest of the time, the config file won't load and you'll see the default green status bar.
