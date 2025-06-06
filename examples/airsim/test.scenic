import math
from scenic.simulators.airsim.utils import getPrexistingObj
import random

# NOTE: add your world info path here
param worldInfoPath = "./airsimWorldInfo"

param worldOffset = Vector(0,0,50) # blocks world offset
param timestep = .1

model scenic.simulators.airsim.model

droneAboveLeftCone = new Drone at (35,45,1), 
    # with width 2

drone2 = new Drone at (35,55,10)

ground = getPrexistingObj("ground")

leftCone = new StaticObj at (35,45,0),
    with assetName "Cone",
    with width 1, with length 1, with height 1

cone2 = new StaticObj at (35,40,0),
    with assetName "Cone",
    with width 5, with length 5, with height 5


# ground = getPrexistingObj("ground")

# ego = new StaticObj on ground,
#     with assetName "Cone",
#     with width 10,
#     with length 10,
#     with height 10


# centerArea = RectangularRegion(Vector(0,200,30), 0, 100,100)

# blocks = []
# blockCount = 10


# positions = []

# for i in range(blockCount):
#     pos = Vector(i*3,math.cos(i)*Uniform(1,3),1)
#     positions.append(pos+ Vector(0,0,3))

#     new StaticObj at pos + Vector(0,0,1), 
#         with assetName "Cone",
#         with width 1,
#         with length 1,
#         with height 1

    


# drone = new Drone on positions[0], with behavior Patrol(positions,smooth=False,speed=5)



# # NOTE: add your world info path here
# param worldInfoPath = "./airsimWorldInfo"
# param worldOffset = Vector(0,0,50) # blocks world offset


# model scenic.simulators.airsim.model


# ground = getPrexistingObj("ground")

# # new Drone at (0, 0, 10)

# new StaticObj at (10, 10, 20), with assetName "Cone", with height 100
# # obj = new StaticObj at (20, 0, 10),  # offset from drone
# #     with height 10.0,
# #     with assetName "Cone",