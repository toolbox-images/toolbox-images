It is fairly easy to setup docker.io/library/archlinux:base-devel as a toolbox image.

```shell
$ toolbox create --image docker.io/library/archlinux:base-devel --container archlinux-toolbox
```

But sudo is not configured: you can do that with the utils/setup-sudoers.sh script.
