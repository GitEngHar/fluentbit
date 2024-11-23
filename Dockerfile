FROM fluent/fluent-bit:latest

COPY ./conf/pasers_file.conf /fluent-bit/etc/pasers_file.conf
COPY conf/fluent-bit.conf /fluent-bit/etc/fluent-bit.conf