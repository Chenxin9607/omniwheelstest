# -*-coding:utf-8 -*-
import socket
import struct


class MySocket:
    """demonstration class only
      - coded for clarity, not efficiency
    """

    def __init__(self, sock=None):
        if sock is None:
            self.sock = socket.socket(
                            socket.AF_INET, socket.SOCK_STREAM)
        else:
            self.sock = sock

    def connect(self, host, port):
        self.sock.connect((host, port))

    def mysend(self, msg):
        totalsent = 0
        while totalsent < 2:
            sent = self.sock.send(msg[totalsent:])
            if sent == 0:
                raise RuntimeError("socket connection broken")
            totalsent = totalsent + sent

def main():
    mysocket = MySocket()
    mysocket.connect('192.168.2.109', 8080)
    # mysocket.mysend("10000")
    buff = [1, 2, 3,
            4, 5, 6,
            7, 8, 9,
            10, 11, 12,
            13, 14, 15,
            16, 17, 18,
            19, 20, 21
    ]

    mysocket.mysend(struct.pack('<h', 666)) #起始字符
    for i in range(len(buff)):
        mysocket.mysend(struct.pack('<h', buff[i]*0.1)) #这里乘以0.1来使速度减小到几十这个数量级
    mysocket.mysend(struct.pack('<h', 888)) # 结束字符


    print repr(struct.pack('<h', 666))
    for i in range(len(buff)):
        print repr(struct.pack('<h', buff[i]))
    print repr(struct.pack('<h', 888))




if __name__ == "__main__":
    main()
