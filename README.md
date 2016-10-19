This is an updated version of [sseefried][1]'s [original Dockerfile][2].
I ([ppelleti][3]) have made the following changes:

* build a GHC 8.0.1 cross-compiler instead of 7.8.3
* use Android NDK r13 instead of r9b
* image is based on Ubuntu 16.04 instead of Debian Wheezy (this was
  necessary to get a new enough system GHC to bootstrap GHC 8.0.1)
* removed build of libnettle and GnuTLS (not sure why they were there)

Original README follows...

[1]: https://github.com/sseefried
[2]: https://github.com/sseefried/docker-build-ghc-android
[3]: https://github.com/ppelleti

#docker-build-ghc-android

This package contains a Dockerfile and associated scripts to build a
GHC 7.8.3 cross compiler targeting the ARM architecture. Big thanks go out
*neuroctye* for the original build script and *joeyh* for additional changes.

You will see some errors in the standard output, some that even look like they might be fatal.
Stay strong and wait. It will build to the end. If it doesn't please contact me.

# Installation

*Please build with at least Docker version 1.6*. Check with `docker version`.

Once you've done that then:

    $ docker build .

# Running

You'll want to run the image inside an interactive shell. At the end of
the build it will tell you the image ID of the final image.

$ docker run -it <image ID> bash

# Motivation

This build script takes between 1 - 2 hours to run. It installs several
packages, some that require patches to make them work with Android.
Developing a build script with this many dependencies is a nightmare.

You can only be sure your script *really* works if you run it on a pristine
environment. But when your script breaks after 50 minutes it is just the sort of
thing that can make you want to consider changing careers, especially if it
happens a few times in a row. Development is made so much easier with
quick turn-around times.

The fantastic thing about Docker is that it effectively takes a snapshot of the *entire
file system* after each Dockerfile command allowing you to return to that
known state and try again.

Docker is great because:

1. It helped *me*. This script was developed much more quickly than it otherwise
   would have been. Because of how Docker works I had the confidence that it
   would build from a pristine environment once I had successfully built it the
   first time.


2. It will help *you*. This script will inevitably succumb to bitrot.
   It may fail but when it does you will not have to go all the way back to the
   beginning. You can make a change to one of the many mini-scripts in the
   ```user-scripts/``` directory and try again from the point of failure.

## More information

For more information read my [blog post](http://lambdalog.seanseefried.com/posts/2014-12-12-docker-build-scripts.html).
