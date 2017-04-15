FROM perl:5

RUN apt-get update && apt-get --yes --no-install-recommends install \
    libnet-ip-perl libnet-netmask-perl libnet-dns-perl libxml-writer-perl libstring-random-perl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/fwaeytens/dnsenum.git /src/dnsenum/ \
    && chmod +x /src/dnsenum/dnsenum.pl

WORKDIR /src/dnsenum

CMD /src/dnsenum/dnsenum.pl
