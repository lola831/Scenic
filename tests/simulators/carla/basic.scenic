param map = localPath('../../../assets/maps/CARLA/Town10HD_Opt.xodr')
param carla_map = 'Town10HD_Opt'
from scenic.simulators.carla.model import *

ego = new Car in intersection

ego = new Car on ego.lane.predecessor

new Pedestrian on visible sidewalk

third = new Car on visible ego.road
require abs((apparent heading of third) - 180 deg) <= 30 deg
