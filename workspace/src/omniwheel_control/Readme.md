# 使用方法

## 启动节点
先到工作空间的目录下执行
```shell
source devel/setup.bash
```

执行下面的语句来使用键盘控制
```shell
roslaunch omniwheel_keyboard_control move_control.launch 
```

```
Reading from the keyboard  and Publishing to Twist!
---------------------------
Moving around:
   u    i    o
   j    k    l
   m    ,    .

请注意使用大写shift+字母来进行控制。
For Holonomic mode (strafing), hold down the shift key:
---------------------------
   U    I    O
   J    K    L
   M    <    >

t : up (+z)
b : down (-z)

anything else : stop

q/z : increase/decrease max speeds by 10%
w/x : increase/decrease only linear speed by 10%
e/c : increase/decrease only angular speed by 10%
1,2,3,4 to switch the number of the cell to control

CTRL-C to quit
```


## 键盘控制

在弹出的终端中有比较详细的控制方式，u，i，o，j，k，l，m，','，'.'，这几个按键是用来控制运动方向的，直接按的话可以控制启动，q可以用来增加速度，z可以用来减速。数字键1，2，3，4是用来控制单元的编号，默认控制的是1号单元
**一定要使用shift+上述的按键来进行控制**，这样的话输入的U，O，M，'.'表示的是正135°，45°，-135°和-45°的方向。小写的字符是控制的差速运动轮进行运动的表示方法。



