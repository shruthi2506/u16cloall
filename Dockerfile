FROM drydock/u16all:{{%TAG%}}

ADD . /u16cloall

RUN /u16cloall/install.sh
