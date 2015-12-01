# Introduction
I was curious about the possibility of using Docker outside of its
deployment/ops wheelhouse, so I came up with a contrived use for it in a
front-end workflow. I arrived at this idea, in part, after trying to explain
how/why Docker is useful to a few people who aren't traditionally interested in
ops and being met with either glazed eyes or responses like, "Sounds cool, but
why should I care?" A particular conversation with someone who'd had trouble
installing and configuring [Google's Closure
Compiler](https://developers.google.com/closure/compiler://developers.google.com/closure/compiler)
came to mind, so that's the use-case I ran with.

# Running the example
If you're interested in running this demo, you'll need to do the following:

- [Install Docker](https://docs.docker.com/engine/installation/ubuntulinux/).
    (Note: I was working on a Linux host, so if you're using OS X or Windows,
    you'll need to use Docker Machine, Boot2Docker, etc.)
- run `docker build -t closure-compiler-demo .` from the project root order to
    [build a Docker image from the local
    Dockerfile](https://docs.docker.com/engine/userguide/dockerimages/#building-an-image-from-a-dockerfile).
    This will create an image which contains the latest version of Java and
    Closure Compiler. (Note: in a production environment, you'll want to use
    specific versions of each.) It also specifies the [default
    command](https://docs.docker.com/v1.8/reference/builder/#cmd) to run when
    this image is used to build and execute a container.
- You can build and execute a one-time-use Docker container using your newly
    created image by running, `docker run --rm -v $(pwd)/src/app.js:/app.js -v
    $(pwd)/build:/build closure-compiler-demo`. (I've bundled this up as the
    `rake build` task in the local Rakefile, in order to show how it'd be used
    as part of a standard workflow.)

# Description
If you've run the commands listed above, the result should see be a "compiled"
version of the JavaScript file found in src/app.js in build/app.min.js. The
approach used here involves [mounting files from the project in the
container](https://docs.docker.com/engine/userguide/dockervolumes/#mount-a-host-directory-as-a-data-volume),
but you could just as easily pass their contents to the container using the
usual *nix utilities and a different `CMD`.

# Summary
Hopefully, the value-add provided by Docker here is apparent. Two commands
allowed you to create a sandboxed environment, which can be versioned and
shared with your teammates, which contains everything it needs in order to do
its task. There is also _zero_ chance of causing conflicts on your host system
because you've added/removed/upgraded/downgraded packages in order to satisfy
the current project's dependency requirements.
