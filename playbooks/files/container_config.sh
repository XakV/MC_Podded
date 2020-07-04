#!/bin/bash

working_duck=$(/usr/bin/buildah from --name duck localhost/java8)
/usr/bin/buildah config --workingdir /srv $working_duck
working_goat=$(/usr/bin/buildah from --name goat localhost/java8)
/usr/bin/buildah config --workingdir /srv $working_goat
working_bear=$(/usr/bin/buildah from --name bear localhost/java8)
/usr/bin/buildah config --workingdir /srv $working_bear

working_waterfall=$(/usr/bin/buildah from --name waterfall-358.jar localhost/java8)
/usr/bin/buildah config --workingdir /srv $working_waterfall

/usr/bin/buildah config --port 25565 $working_waterfall
/usr/bin/buildah config --port 25566 $working_duck
/usr/bin/buildah config --port 25567 $working_bear
/usr/bin/buildah config --port 25568 $working_goat

/usr/bin/buildah commit --rm --squash $working_duck duck-21
/usr/bin/buildah commit --rm --squash $working_goat goat-21
/usr/bin/buildah commit --rm --squash $working_bear bear-21

/usr/bin/buildah commit --rm --squash $working_waterfall waterfall-358


