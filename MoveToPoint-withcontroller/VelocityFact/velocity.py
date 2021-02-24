import math



class Wheels:
    def __init__(self, x, y, angle):
        self.x = x
        self.y = y
        self.angle = angle
        self.vel = 0.0
        self.distance = 0.0

    @classmethod
    def from_txtline(cls, line):
        sp = line.split('\t')
        return cls(float(sp[1]), float(sp[2]), float(sp[3]))



class VelocityFact:
    def __init__(self, filepath):
        self.tlist = []
        self.ReadFiles(filepath)
        self.CoveredWheels


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
                whe = Wheels.from_txtline(line)
                self.tlist.append(whe)


    def Getlist(self):
        return self.tlist


    def AngleCal(self, center, whecenter):
        ang = math.atan2(-(whecenter[1] - center[1]), whecenter[0] - center[0])
        if ang < 0:
            ang = ang + 2 * math.pi
        return ang



    def VelFact(self, vx, vy, omega):

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

                if self.flag == 1:
                    self.tmp1 = self.ang1

                self.ang1 = self.AngleCal([self.centerx, self.centery], [self.tlist[i].x, self.tlist[i].y])


                if self.ang1 > math.pi / 3 and self.ang1 < math.pi / 3 * 4:
                    sign1 = 1
                elif self.ang1 == math.pi / 3 or self.ang1 == math.pi / 3 * 4:
                    if self.tmp1 == 1:
                        sign1 = 1
                    else:
                        sign1 = -1
                else:
                    sign1 = -1
                self.tlist[i].vel = -vx * math.cos(math.pi - math.pi * 2 / 3) - vy * math.cos(
                    math.pi * 2 / 3 - math.pi / 2) + sign1 * self.tlist[i].distance * omega


            elif i < 192:
                if self.flag == 1:
                    self.tmp2 = self.ang2
                self.ang2 = self.AngleCal([self.centerx, self.centery], [self.tlist[i].x, self.tlist[i].y])

                if self.ang2 > math.pi / 3 * 2 and self.ang2 < math.pi / 3 * 5:
                    sign2 = -1
                elif self.ang2 == math.pi / 3 * 2 or self.ang2 == math.pi / 3 * 5:
                    if self.tmp2 == 1:
                        sign2 = 1
                    else:
                        sign2 = -1
                else:
                    sign2 = 1
                self.tlist[i].vel = -vx * math.cos(math.pi / 3) + vy * math.sin(math.pi / 3) + sign2 * self.tlist[
                    i].distance * omega

        self.flag = 1
        self.SendMsg()
        self.CoveredWheels = []
        for j in range(len(self.tlist)):
            self.tlist[j].vel = 0.0
            self.tlist[j].distance = 0.0
            self.tlist[j].angle = 0.0

    def vel_pipline(self):
        self.velocity_cal()
        self.VelFact(self.linear[0], self.linear[1], self.angular[2])

