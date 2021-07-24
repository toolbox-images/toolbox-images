# OpenSUSE images

OpenSUSE provides [toolbox containers](https://registry.opensuse.org/cgi-bin/cooverview?srch_term=project%3D%5EopenSUSE%3AContainers%3A+container%3Dtoolbox):

```
toolbox create --image registry.opensuse.org/opensuse/toolbox:latest --container opensuse-toolbox
```

should give you a Tumbleweed toolbox.

But sudo is not configured: you can do that with the `utils/setup-sudoers.sh` script.
