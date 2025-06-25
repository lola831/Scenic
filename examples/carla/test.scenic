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


ego = new Car at (-3.57, -66.12), with behavior FollowLaneBehavior(1)

# # collect all the curb-side lanes
# curbLanes = [
#   lg.lanes[0]
#   for lg in network.laneGroups
#   if lg is lg.road.forwardLanes
# ]


# # make sure to put '*' to uniformly randomly select from all elements of the list
# lane = Uniform(*curbLanes)

# ego = new Car on lane.centerline

# require (distance to intersection) > 50