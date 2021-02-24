# coding=utf-8
from trajectory.client import Line
from trajectory.client import Client
# from trajectory.client import Line
from VelocityFact.velocity import VelocityFact
from rosdata.transdata import TransmitMsg
from controller.builder import create_controller
from geometry_msgs.mag import Twist


class Pipline:

    def __init__(self):
        #TODO
        filepath = r"\VelocityFact\wheels_num.txt"
        self.controller = create_controller(trajectory1, CONTROLLER, DELTA_T, SIM_INFO)

        self.velocity = VelocityFact(filepath)
        self.client = Client
        self.transmsg = TransmitMsg
        self.tlist = []

    def Mainpipline(self):
        self.client.start()
        self.BaseModule(self.client.Line)


    def BaseModule(self,Line):
        """
        这个函数就是主流水线
        循环过程中的其中一个基本的模块
        这个模块包含了一下几个部分
        :return:
        """
        for i.element in enumerate(Line):
        # i是离散化后的直线中的每一个点。
            currectInf = self.client.detectOnce()
            self.velocity.vel_pipline()
            self.tlist = self.velocity.Getlist()
            #TODO:这边需要在tlist中叠加上我们的速度的补偿
            self.client #TODO:控制器计算
            self.controller.compute_control_actions(currentPose, currentTwist, i)#TODO：控制器计算补偿
            twist = Twist()
            twist.linear.x = controller.v_c_n
            twist.angular.z = controller.w_c_n



            # self.Overlay #叠加补偿到速度中去


            self.transmsg.SendMsg(self.tlist)

