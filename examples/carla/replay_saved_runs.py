import sys
import math
import scenic
from scenic.simulators.carla import CarlaSimulator

# -- Same Scenic model string as in save_runs.py --
code = """
param map = "assets/maps/CARLA/Town10HD_Opt.xodr"
model scenic.simulators.carla.model
param carla_map = "Town10HD_Opt"
param time_step = 1.0/10
param weather = "HardRainNoon"

behavior DriveFullThrottle():
    while True:
        take SetThrottleAction(1)

ego = new Car at (-42, -137),
    with behavior DriveFullThrottle,
    with blueprint "vehicle.nissan.patrol"

record initial ego.position as StartPos
record final   ego.position as EndPos
record final ego.speed as CarSpeed
terminate after 8 seconds
"""
scenario = scenic.scenarioFromString(code, mode2D=True)

binfile = "simulation_results/run_1.bin"

with open(binfile, "rb") as f:
    data = f.read()

simulator = CarlaSimulator(
    carla_map="Town10HD_Opt",
    map_path="assets/maps/CARLA/Town10HD_Opt.xodr",
)

# Replay it
replay = scenario.simulationFromBytes(
    data, 
    simulator, 
    continueAfterDivergence=True
)


recs = replay.result.records
start_pos = recs["StartPos"]
end_pos   = recs["EndPos"]
dx = end_pos[0] - start_pos[0]
dy = end_pos[1] - start_pos[1]
dist = math.hypot(dx, dy)
print(f"Replayed {binfile}: traveled {dist:.2f} m")