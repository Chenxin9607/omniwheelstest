import rospy
import signal
from geometry_msgs.msg import Twist
from omniwheel_control.msg import move_base
from omniwheel_control.msg import num
from omniwheel_control.msg import wheels_trans

dataContainer = {
    'CoveredWheels':[],
    """
    here to store a number of wheels that be covered by the transmitting object
    """
    'objCenter':{
        'centerx':0,
        'centery':0,
    },
    'objAngle': 0

}


class DataInput:
    def __init__(self):
        rospy.init_node("socket", anonymous=True)
        self.linear = [0.0, 0.0, 0.0]
        self.angular = [0.0, 0.0, 1.0]
        # self.subscriber = rospy.Subscriber("cmd_vel", Twist, self.callback)
        self.subscriber_1 = rospy.Subscriber("wheel_number", wheels_trans, self.callback)
        self.tlist = []
        self.flag = 0
        self.CoveredWheels = []


    def callback(self, message):
        # 这个是接收视觉检测topic,读入视觉检测的数据
        self.CoveredWheels = message.wID
        self.centerx = message.wcenterx
        self.centery = message.wcentery

    def Save2buffer(self):
        dataContainer['CoveredWheels'] = self.CoveredWheels
        dataContainer['objCenter']['centerx'] = self.centerx
        dataContainer['objCenter']['centery'] = self.centery
        return dataContainer
