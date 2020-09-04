#!/usr/bin/env python
# -*- coding: UTF-8 -*-
 
# import socket
# import json


import rospy
import socket 
from geometry_msgs.msg import Twist
from omniwheel_control.msg import move_base
from omniwheel_control.msg import num
import json
import socket
import signal
import sys
import struct


# address = ('127.0.0.1', 31500)
# s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
# mylist = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# json_string = json.dumps(mylist)
# s.sendto(json_string, address)
# s.shutdown(socket.SHUT_RDWR)
# s.close()


initVal = 0
buff = [initVal for i in range(21)]  # 这里需要修改成单元的数量
cell_number = 0
map_table = [[0, 1, 2],
              [3, 4, 5],
              [6, 7, 8],
              [9,10,11],
              [12,13,14],
              [15,16,17],
              [18,19,20]]


# ip_addr = '192.168.1.102'
# port = 5000
ip_addr = '192.168.2.249'
port = 5000
connect_flag = 0
address = (ip_addr, port)

try:
    p = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    print("正在连接{ip}:{port}".format(ip=ip_addr, port=port))
    p.connect((ip_addr,port))
    print("SUCCESS：已经成功连接到控制器！")
    connect_flag = 1
except:
    print("ERROR：无法链接到控制器，请重检查硬件链接！")


def exit(signum, frame):
    if connect_flag:
        print('Disconnect from {ip}:{port} '.format(ip=ip_addr, port=port))
        p.shutdown(socket.SHUT_RDWR)
        p.close()
    # exit()
    rospy.signal_shutdown("manual shutdown")



def fun1(message):
    # global cell_number
    buff[map_table[cell_number][0]] = message.v_right
    buff[map_table[cell_number][1]] = message.v_left
    buff[map_table[cell_number][2]] = message.v_back
    print(buff)  #TODO:test
    # struct.pack('>h', buff[0])
    # json_string = json.dumps(buff)
    # p.sendto(json_string.encode('utf-8'), address)


    #>:小端模式， h： int
    # p.send(struct.pack('<h', 666)) #起始字符
    p.send(struct.pack('<h', 666)) #起始字符    

    for i in range(len(buff)):
        p.send(struct.pack('<h', buff[i]*0.1))#这里乘以0.1来控制数量级到几十
    p.send(struct.pack('<h', 888)) # 结束字符

    return 0

def fun2(message):
    global cell_number
    cell_number = message.cell - 1
    # print(cell_number)s
    return 0

    


if __name__ == '__main__':
    # parameters = sys.argv[1]
    # if len(parameters) not in (1):
    #     print('Error:', end=' ')
    #     if len(parameters) < 1:
    #         print('missing arguments!')
    #     elif len(parameters) > 1:
    #         print('too much arguments!')
    #下面不用判断了，只读一个数
    # print(parameters)
    # if len(parameters) != 1:
    #     if len(parameters) > 1:
    #         print("too much arguments!")
    #         # print('Try: rosrun teleop_twist_keyboard_cpp trans.py <cell_number> ')
    #         # sys.exit(-1)
    #     elif len(parameters) <1:
    #         print("missing arguments")
    #     print('Try: rosrun teleop_twist_keyboard_cpp trans.py <cell_number> ')
    #     sys.exit(-1)
    # cell_number = int(parameters)
    rospy.init_node("socket", anonymous=True)
    subscriber = rospy.Subscriber("vel", move_base, fun1)
    subscriber_1 = rospy.Subscriber("cell_number", num, fun2)
    signal.signal(signal.SIGINT, exit)
    signal.signal(signal.SIGTERM, exit)
    rospy.spin()
    # ("Node exit")
    print("\nTranspy Process exit\n")


    
    
    

