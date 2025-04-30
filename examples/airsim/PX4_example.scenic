# NOTE: add your world info path here
param worldInfoPath = "./airsimWorldInfo"
param worldOffset = Vector(0,0,50) # blocks world offset

model scenic.simulators.airsim.model


drone1 = new PX4Drone at (0,1,5)