# -*- coding:utf-8 -*-
#!/usr/bin/env python
from util.angle import get_euler_orientation


class Controller:
    def __init__(self, trajectory, simulation_data):
        self.trajectory = trajectory
        self.simulation_time = simulation_data['time']
        self.delta = simulation_data['delta']

    def set_current_orientation(self, orientation):
        self.theta_n = get_euler_orientation(orientation)[2] # quaternion 2 euler

    def set_current_position(self, position):
        self.x_n = position.x
        self.y_n = position.y

    def set_current_omega(self, omega):
        self.omega = omega

    def set_current_reference(self, reference):
        self.x_ref_n = reference.x
        self.y_ref_n = reference.y

    def set_current_reference_omega(self, reference):
        self.x_ref_omega = reference