# -*-coding:utf-8-*-
# !/usr/bin/python
import threading
import rospy
from pipline import Pipline
from rosdata.data_input import DataInput


def ThreadingJob1():
    rospy.spin()
    # 这里我先用

def ThreadingJob2():


def ThreadStart(self):
    # 这个函数我想让他专门搞多线程,因为我们的这个文件其实他是需要完成三个任务的,
    # 线程1: 接收键盘的控制信号,这个不需要要连续的接收,但是需要一直等在那个地方,
    # 线程2: 接收视觉的检测结果,视觉的检测结果是实时的一个检测,每次接收到视觉检测的数据之后处理完
    # 还在同一个线程中把这个数据发出去
    add_thread1 = threading.Thread(target=ThreadingJob1)
    add_thread2 = threading.Thread(target=ThreadingJob2)
    add_thread1.start()
    add_thread2.start()


if __name__ == "__main__":
    targetPoint = raw_input("Please input target point:")
    print targetPoint
    pipline = Pipline()
    pipline.Mainpipline()
     # 初始化ROS节点，让该节点开始接收视觉节点的检测位置。

