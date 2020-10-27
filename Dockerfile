FROM ubuntu:20.04

RUN apt-get  update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git pkg-config autotools-dev autoconf bison flex
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libevent-dev libncurses5-dev

RUN git clone https://github.com/tmux/tmux.git /tmux
WORKDIR /tmux
RUN git checkout 3.1b # Uncomment to test against master
RUN sh autogen.sh
RUN ./configure
RUN make
RUN make install

RUN useradd -m user
USER user
WORKDIR /user/home

COPY .tmux.conf /home/user/.tmux.conf

CMD tmux -vv start-server & tmux -vv new -t session1
