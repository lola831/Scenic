param map = localPath('../../assets/maps/CARLA/Town10HD_Opt.xodr')
model scenic.simulators.carla.model
param carla_map = "Town10HD_Opt"
param time_step = 1.0/10

# behavior DriveWithThrottle():
#     while True:
#         take SetThrottleAction(1)

# ego = new Car at (-42, -137), with behavior DriveWithThrottle, with blueprint "vehicle.nissan.patrol"

behavior DriveFullThrottle():
    while True:
        take SetThrottleAction(1)

ego = new Car at (-42, -137),
    with behavior DriveFullThrottle,
    with blueprint "vehicle.nissan.patrol"
print("hello lola")

# Record the very first and very last positions:
record initial  ego.position as StartPos
print("INITIAL POS: ", StartPos)
terminate after 10 seconds
record final    ego.position as EndPos
print("END POS: ", EndPos)