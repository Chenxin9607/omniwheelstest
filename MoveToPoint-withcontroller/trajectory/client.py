# coding=utf-8
from pipline import Pipline
from rosdata.data_input import DataInput

# 从键盘输入处理后
# 得到一条离散后的直线

targetPoint = {
    'x': 0,
    'y': 0
}
# Line = []  # line 用来保存离散后的直线。



class Client:
    def __init__(self):
        self.wheelsData = DataInput
        self.Line = []

    def detectOnce(self):
        return self.wheelsData.Save2buffer()

    def targetInput(self):
        """
        请你以逗号分割xy两个点
        :return:
        """
        tmp_string = raw_input("Please input target point:")
        print tmp_string
        if len(tmp_string.split(",")) == 2:
            targetPointx = int(tmp_string.split(",")[0])
            targetPointy = int(tmp_string.split(",")[1])
        else:
            print "Your input is in Wrong"

        targetPoint['x'] = targetPointx
        targetPoint['y'] = targetPointy


    def LineGenerator(self, source, target, grading):
        """
        :param source: tumple--(x,y) start position of the Line.
        :param target: tumple--(x,y) end position of the Line.
        :param grading: must be integer.

        :return:
        """
        xsam = range(source[0], target[0], grading)
        ysam = range(source[1], target[1], grading)
        return zip(xsam, ysam)  # 包含元祖的列表
        # print xsam
        # print ysam


    def start(self):
        global Line
        #首先检测一次初始位置
        #TODO: readbuffer
        initPoint = self.detectOnce()
        self.Line = self.LineGenerator(initPoint, targetPoint, 1)








