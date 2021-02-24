import socket
import rospy
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



class TransmitMsg:

    def __init__(self, filepath):

        # 下面初始化PLC链接
        initVal = 0
        # buff = [initVal for i in range(21)]  # 这里需要修改成单元的数量
        # cell_number = 0
        self.map_table = list2 = [0.0 for x in range(0, 192)]
        self.CoveredWheels = []
        self.tlist = []  # 用于保存内容
        self.delay = 0  # 这个变量来控制我们的发送频率
        # ip_addr = '192.168.2.201'
        # port = 10500
        ip_addr = '192.168.2.249'
        port = 5000
        # ip_addr = '192.168.2.109'
        # port = 8080
        self.connect_flag = 0
        # address = (ip_addr, port)
        self.mysocket = MySocket()


        self.map = [30, 94, 158,
                    33, 97, 161,
                    41, 105, 169,
                    46, 110, 174,
                    42, 106, 170,
                    34, 98, 162,
                    38, 102, 166,
                    22, 86, 150,
                    26, 90, 154,
                    31, 95, 159,
                    39, 103, 167,
                    47, 111, 175,
                    50, 114, 178,
                    54, 118, 182,
                    49, 113, 177,
                    45, 109, 173,
                    37, 101, 165,
                    29, 93, 157,
                    25, 89, 153]
        try:
            # self.p = socket.socket(socket.AF_INET,socket.SOCK_STREAM)

            print("正在连接{ip}:{port}".format(ip=ip_addr, port=port))
            # self.p.connect((ip_addr,port))
            self.mysocket.connect(ip_addr, port)

            print("SUCCESS：已经成功连接到控制器！")
            self.connect_flag = 1
        except:
            print("ERROR：无法链接到控制器，请重检查硬件链接！")
            rospy.signal_shutdown("ROS Stoped")

    def SendMsg(self, tlist):

        # self.mysocket.mysend(struct.pack('<h', 666))
        # for i in range(len(self.map)):
        #     self.mysocket.mysend(struct.pack('<h', tlist[self.map[i]].vel * 0.1))  # 这里乘以0.1来控制数量级到几十
        # self.mysocket.mysend(struct.pack('<h', 888))  # 结束字符

        tmp = []
        for i in range(len(self.map)):
            tmp.append(self.tlist[self.map[i]].vel * 0.1)
        tmp.append(888)

        self.mysocket.mysend(struct.pack('<59h', 666, *tmp))

        rospy.loginfo("-------------------------------")
        for i in range(len(self.map)):
            rospy.loginfo(tlist[self.map[i]].vel * 0.1)
        rospy.loginfo("-------------------------------")
        # rospy.sleep(0.05)
        return 0



