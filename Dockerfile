FROM fstarlang/fstar-emacs

USER root
RUN apt-get update && apt-get install -y coreutils openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:hello' | chpasswd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ADD setup.sh /tmp/setup.sh

USER FStar
RUN bash /tmp/setup.sh

EXPOSE 22
VOLUME /home/FStar/workdir

USER root
RUN echo 'FStar:hello' | sudo chpasswd

CMD ["sudo", "/usr/sbin/sshd", "-D"]
