#!/usr/bin/env python
# -*- coding: UTF-8 -*-
 


import rospy
import socket 
from geometry_msgs.msg import Twist
from omniwheel_control.msg import move_base
from omniwheel_control.msg import num
from omniwheel_control.msg import wheels_trans
import math
import json
import socket
import signal
import sys
import struct
import threading
import time
import sys

    
class Wheels:
    def __init__(self, x, y, angle):
        self.x = x
        self.y = y
        self.angle = angle
        self.vel = 0.0
        self.distance = 0.0

class KeyboardCtrlVelocityFactory:

    def __init__(self, filepath):

        #下面初始化PLC链接
        initVal = 0
        # buff = [initVal for i in range(21)]  # 这里需要修改成单元的数量
        # cell_number = 0
        self.map_table = list2=[0.0 for x in range(0,192)]
        self.CoveredWheels = []
        self.tlist = [] #用于保存内容
        self.delay = 0 # 这个变量来控制我们的发送频率
        #ip_addr = '192.168.2.201'
        #port = 10500
        ip_addr = '192.168.2.249'
        port = 5000
        self.connect_flag = 0
        address = (ip_addr, port)

        try:
            self.p = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
            print("正在连接{ip}:{port}".format(ip=ip_addr, port=port))
            self.p.connect((ip_addr,port))
            print("SUCCESS：已经成功连接到控制器！")
            self.connect_flag = 1
        except:
            print("ERROR：无法链接到控制器，请重检查硬件链接！")
            rospy.signal_shutdown("ROS Stoped")

            



        #下面初始化ROS的节点
        rospy.init_node("socket", anonymous=True)
        self.linear = [0.0, 0.0, 0.0]
        self.angular = [0.0, 0.0, 0.0]
        self.subscriber = rospy.Subscriber("cmd_vel", Twist, self.callback)
        self.subscriber_1 = rospy.Subscriber("wheel_number", wheels_trans, self.callback2)
        signal.signal(signal.SIGINT, self.exit)
        signal.signal(signal.SIGTERM, self.exit)
        self.tlist = []
        self.flag = 0
        # self.ang1 = 0
        # self
        self.ReadFiles(filepath)
        self.ThreadStart()
        # 因为轮子还没装完，因此我需要在这里做一个映射，将我的轮子的编号map到控制器的编号
        # self.map =list2=[0 for x in range(0,21)]
        # self.map = [30, 94, 158,
        #             34, 98, 162,
        #             38, 102, 166,
        #             44, 108, 172,
        #             37, 101, 165,
        #             33, 97, 161,
        #             39, 103, 167]
        self.map = [30, 94, 158,
                    33, 97, 161,
                    41, 105, 169,
                    46, 110, 174,
                    42, 106, 170,
                    34, 98, 162,
                    38, 102, 166] 
        # self.map = [30, 158, 94,
        #             33, 161, 97,
        #             41, 169, 105,
        #             46, 174, 110,
        #             42, 170, 106,
        #             34, 162, 98,
        #             38, 166, 102,]
        
        # self.start = time.clock()
        
        # print "\nTranspy Process exit\n"s


    def exit(signum, frame):
        if self.connect_flag:
            print('Disconnect from {ip}:{port} '.format(ip=ip_addr, port=port))
            p.shutdown(socket.SHUT_RDWR)
            p.close()
        # exit()
        rospy.signal_shutdown("manual shutdown")

    def MainPipline(self):
        # 这里我想要实现以我自己的速率进行采集callback并指定速率发送
        pass
    def callback(self, message):
        # 这个函数用来接收键盘的输入
        self.linear[0] = message.linear.x
        self.linear[1] = message.linear.y
        self.linear[2] = message.linear.z

        self.angular[0] = message.angular.x
        self.angular[1] = message.angular.y
        self.angular[2] = message.angular.z
        # rospy.loginfo(self.linear)

    def callback2(self, message):
        # 这个是接收视觉检测topic
        self.delay = self.delay + 1
        if self.delay > 3:

            # elapsed = (time.clock() - self.start)
            # print "\nTime used:", elapsed

            self.CoveredWheels = message.wID
            self.centerx = message.wcenterx
            self.centery = message.wcentery
            # rospy.loginfo(self.CoveredWheels)
            # 我要在下面做速度计算和速度分解
            self.velocity_cal()
            self.VelFact(self.linear[0], self.linear[1], self.angular[2])
            self.delay = 0
            # self.start = time.clock()



    def length_cal(self, point1, point2):
        # 计算距离的函数
        return math.sqrt((point1[0] - point2[0]) ** 2 + (point1[1] - point2[1]) ** 2)

    def velocity_cal(self):
        # 计算每个covered到轮子中心到物体中心的距离
        for i in self.CoveredWheels:
            self.tlist[i].distance = self.length_cal([self.tlist[i].x, self.tlist[i].y], [self.centerx, self.centery])

    def ReadFiles(self, filepath):
        # 这个函数是想在读出我们的wheels_num.txt的文件中的内容,通过视觉检测出来的的编号对应
        # 文件中的轮子的信息,计算文件的内容,
        with open(filepath) as f:
            for line in f:
                sp = line.split('\t')
                # wheelsnumbers = int(sp[0])
                # wheelsposx = float(sp[1])
                # wheelsposy = float(sp[2])
                whe = Wheels(float(sp[1]), float(sp[2]), float(sp[3]))
                self.tlist.append(whe)

    def Getlist(self):
        return self.tlist

    
    def AngleCal(self, center, whecenter):
        ang = math.atan2(-(whecenter[1]-center[1]), whecenter[0]-center[0])
        if ang < 0:
            ang = ang + 2 * math.pi
        return ang

    def VelFact(self, vx, vy, omega):
        # 分解模型
        # print omega
        # print vx, " ,",vy

        for i in self.CoveredWheels:
            if i < 64:
                if self.tlist[i].y < self.centery:
                    sign0 = -1
                elif self.tlist[i].y > self.centery:
                    sign0 = 1
                else:
                    # if 
                    sign0 = 0    
                self.tlist[i].vel = vx + self.tlist[i].distance * sign0 * omega
            
            elif i < 128:
                # TODO：这里的ang1还有问题就是角度不对导致的21号轮的输出数据是一个负数，它本来应该是一个正数。按D的时候
                # print "num: ", i,", ",self.tlist[i].x,", ",self.tlist[i].y
                # print "CENTER: ", i,", ",self.centerx,", ",self.centery
                
                if self.flag == 1:
                    self.tmp1 = self.ang1
                
                self.ang1 =  self.AngleCal([self.centerx, self.centery], [self.tlist[i].x, self.tlist[i].y])
                # print ang1
                
                if self.ang1 > math.pi/3 and self.ang1 < math.pi/3*4:
                    sign1 = 1
                elif self.ang1 == math.pi/3 or self.ang1 == math.pi/3*4:
                    if self.tmp1 == 1:
                        sign1 = 1
                    else:
                        sign1 = -1
                else:
                    sign1 = -1
                self.tlist[i].vel = -vx * math.cos(math.pi - math.pi*2/3) - vy * math.cos(math.pi*2/3 - math.pi/2) + sign1 * self.tlist[i].distance * omega
            
            
            elif i < 192:
                # print "num: ", i,", ",self.tlist[i].x,", ",self.tlist[i].y
                if self.flag == 1:
                    self.tmp2 = self.ang2               
                self.ang2 =  self.AngleCal([self.centerx, self.centery], [self.tlist[i].x, self.tlist[i].y])
                # print ang2
                if self.ang2 > math.pi/3*2 and self.ang2 < math.pi/3*5:                
                    sign2 = -1
                elif self.ang2 == math.pi/3*2 or self.ang2 == math.pi/3*5:
                    if self.tmp2 == 1:                
                        sign2 = 1
                    else:
                        sign2 = -1
                else:
                    sign2 = 1
                self.tlist[i].vel = -vx * math.cos(math.pi/3) + vy * math.sin(math.pi/3) + sign2 * self.tlist[i].distance * omega
            
        # print "---------------------------"
        # for j in self.CoveredWheels:
        #     print self.tlist[j].distance
        # print self.centerx, " ,", self.centery
        self.flag = 1
        self.SendMsg()
        self.CoveredWheels = []
        for j in range(len(self.tlist)):
            self.tlist[j].vel = 0.0
            self.tlist[j].distance = 0.0
            self.tlist[j].angle = 0.0

    def ThreadingJob(self):
        rospy.spin()

    def SendMsg(self):
        # global cell_number
        # 下面是发送的格式报文开始666,结束888

        # p.send(struct.pack('<h', 666)) #起始字符    
        # for i in range(len(self.tlist)):
        #     p.send(struct.pack('<h', self.tlist[i].vel*0.1))#这里乘以0.1来控制数量级到几十
        #     rospy.INFO(self.tlist[i].vel)
        # p.send(struct.pack('<h', 888)) # 结束字符

        
        
        # rospy.sleep(0.05)
        # self.p.send(struct.pack('<h', 666)) #起始字符
        self.p.send(struct.pack('<h', 666)) #起始字符    
            
        for i in range(len(self.map)):
            self.p.send(struct.pack('<h', self.tlist[self.map[i]].vel*0.1))#这里乘以0.1来控制数量级到几十
        self.p.send(struct.pack('<h', 888)) # 结束字符

        rospy.loginfo("-------------------------------")
        for i in range(len(self.map)):
            rospy.loginfo(self.tlist[self.map[i]].vel*0.1)
        rospy.loginfo("-------------------------------")
        # rospy.sleep(0.05)


        return 0

    def ThreadStart(self):
        # 这个函数我想让他专门搞多线程,因为我们的这个文件其实他是需要完成三个任务的,
        # 线程1: 接收键盘的控制信号,这个不需要要连续的接收,但是需要一直等在那个地方,
        # 线程2: 接收视觉的检测结果,视觉的检测结果是实时的一个检测,每次接收到视觉检测的数据之后处理完
        # 还在同一个线程中把这个数据发出去   
        add_thread = threading.Thread(target = self.ThreadingJob)
        add_thread.start()


if __name__ == '__main__':
    filepath = r"/home/soft/catkin_ws/src/omniwheelstest/omniwheel_control/src/wheels_num.txt"
    function = KeyboardCtrlVelocityFactory(filepath)

