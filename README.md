Simplify building executables with different gcc versions.

Build and run in same environment on different hosts.

# Building & running

```bash
docker-compose build
docker-compose up
```

# How-to

Put code with Makefile that creates `a.out` executable in **make** directory.
Run `docker-compose up`

# GCC version

Default in 8.2.0.
Change in `Dockerfile`.

# Example

```make
# ./make/Makefile
a.out: hello.c
	$(CC) hello.c
```

```c
// ./make/hello.c
#include <stdio.h>

int main()
{
	printf("Hello world!");
	return 0;
}
```

```bash
#output
$ docker-compose up
Starting docker-gcc_gcc_1 ... done
Attaching to docker-gcc_gcc_1
gcc_1  | cc hello.c
gcc_1  | Hello world!docker-gcc_gcc_1 exited with code 0
```
