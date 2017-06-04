[shairport-sync](https://github.com/mikebrady/shairport-sync) is an Apple AirPlay receiver. It can receive audio directly from iOS devices, iTunes, etc. Multiple instances of shairport-sync will stay in sync with each other and other AirPlay devices when used with a compatible multi-room player, such as iTunes or [forked-daapd](https://github.com/jasonmc/forked-daapd).
Shairport-snyc version: 3.0.2-OpenSSL-Avahi-ALSA-pipe-soxr-metadata (latest git version) 

Forked from [kevineye/docker-shairport-sync](https://github.com/kevineye/docker-shairport-sync).

## Build

```
docker build -t akosasztalos/shairport .
```

## Run

```
docker run -d \
    --name shairport \
    --net host \
    --device /dev/snd \
    -e AIRPLAY_NAME=Docker \
    akosasztalos/shairport
```

### Parameters

* `--net host` must be run in host mode
* `--device /dev/snd` share host alsa system with container. Does not require `--privileged` as `-v /dev/snd:/dev/snd` would
* `-e AIRPLAY_NAME=Docker` set the AirPlay device name. Defaults to Docker
* extra arguments will be passed to shairplay-sync (try `-- help`)

## More examples

Send output to a named pipe:

```
mkfifo /some/pipe
docker run -d \
    --name shairport-pipe \
    --net host \
    --device /dev/snd \
    -e AIRPLAY_NAME=Docker \
    -v /some/pipe:/output \
    kevineye/shairport-sync \
        -o pipe \
        -- /output
```
