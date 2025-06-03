param map = localPath('../../assets/maps/CARLA/Town10HD_Opt.xodr')
model scenic.simulators.carla.model
param carla_map = "Town10HD_Opt"
param time_step = 1.0/10

behavior DriveWithThrottle():
    while True:
        take SetThrottleAction(1)

ego = new Car

# ego = new Car at (369, -326), with behavior DriveWithThrottle
   