#!/bin/bash

docker run -it \
  -v /Users/acrow/projects/graalvm/example/:/project --rm \
  adamcrow64/graal-native-image:latest \
  --static -cp . HelloWorld -H:Name=app
