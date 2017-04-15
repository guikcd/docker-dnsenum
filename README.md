![docker stars](https://img.shields.io/docker/stars/guidelacour/dnsenum.svg) ![docker pulls](https://img.shields.io/docker/pulls/guidelacour/dnsenum.svg) ![docker automated build](https://img.shields.io/docker/automated/guidelacour/dnsenum.svg) ![docker build status](https://img.shields.io/docker/build/guidelacour/dnsenum.svg)
![image size](https://img.shields.io/imagelayers/image-size/_/guidelacour/dnsenum.svg) ![image layers](https://img.shields.io/imagelayers/layers/guidelacour/dnsenum/latest.svg)

# Source

Script from https://github.com/fwaeytens/dnsenum

# How to use

```
docker run --tty --interactive --rm guidelacour/dnsenum \
   ./dnsenum.pl nonexistent.domain --file dns.txt
```

If you want to use another bruteforce file, use volume:

```
docker run --tty --interactive --rm --volume $(pwd)/dnsbig.txt:/tmp/dnsbig.txt guidelacour/dnsenum \
   ./dnsenum.pl nonexistent.domain --file /tmp/dnsbig.txt
```

Same strategy to store the output to file:

```
docker run --tty --interactive --rm --volume $(pwd):/tmp/ guidelacour/dnsenum \
   ./dnsenum.pl nonexistent.domain --file dns.txt --out /tmp/nonexistent.domain
```

# License
[Same license](https://github.com/guikcd/docker-dnsenum/blob/master/LICENSE) as dnsenum [itself](https://github.com/fwaeytens/dnsenum/blob/master/dnsenum.pl#L30-L42)

# Dockerfile
Docker file [here](https://github.com/guikcd/docker-dnsenum)
