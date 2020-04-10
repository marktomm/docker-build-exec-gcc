FROM alpine:3.11.5

ARG gcc_v=8.2.0
ENV gcc_v=${gcc_v}

RUN apk add --no-cache make build-base coreutils strace mlocate 

WORKDIR /gcc/ftpsrc
RUN wget https://ftp.gnu.org/gnu/gcc/gcc-${gcc_v}/gcc-${gcc_v}.tar.gz && \
	tar -xzvf gcc-${gcc_v}.tar.gz && \
	cd gcc-${gcc_v} && \
	./contrib/download_prerequisites

RUN mkdir objdir && \
	cd objdir && \
	./../gcc-${gcc_v}/configure --prefix=/root/GCC-${gcc_v} --disable-multilib && \
	make -j8 all-gcc && \
	make -j8 all-target-libgcc

RUN cd objdir && \
	make install-gcc && \
	make install-target-libgcc

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT docker-entrypoint.sh ${gcc_v}