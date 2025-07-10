param map = localPath('../../assets/maps/CARLA/Town10HD_Opt.xodr')
model scenic.simulators.carla.model
param carla_map = "Town10HD_Opt"
param time_step = 1.0/10

# behavior DriveWithThrottle():
#     while True:
#         take SetThrottleAction(1)

# ego = new Car

# ego = new Car at (369, -326), with behavior DriveWithThrottle

# ego = new Pedestrian with blueprint "walker.pedestrian.0024",
#     with regionContainedIn None,
#     at (-107.52, -50.87)

# ego = new Car at (-3.3, -68), with behavior DriveWithThrottle
    # with regionContainedIn None

#example for comparing car speed !!!!!!!
ego = new Car at (-3.57, -66.12), with behavior FollowLaneBehavior(1)


# #-----
# road = Uniform(*filter(
#     lambda r: len(r.forwardLanes.lanes) > 0
#           and len(r.backwardLanes.lanes) > 0,
#     network.roads
# ))

# egoLane = Uniform(road.forwardLanes.lanes)[0]
# advLane = Uniform(*road.backwardLanes.lanes)

