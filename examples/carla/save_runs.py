import random
import math
import numpy
import scenic
from scenic.simulators.carla import CarlaSimulator

# import os
# Create folder for all the .bin files
# os.makedirs("simulation_results", exist_ok=True)

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

def run_one(seed, run_id):
    random.seed(seed)
    numpy.random.seed(seed)
    scenario = scenic.scenarioFromString(code, mode2D=True)
    scene, _ = scenario.generate()

    simutalor = CarlaSimulator(
        carla_map="Town10HD_Opt",
        map_path="assets/maps/CARLA/Town10HD_Opt.xodr",
    )

    simulation = simutalor.simulate(scene, enableDivergenceCheck=True)
    data = scenario.simulationToBytes(simulation)
    fname = f"simulation_results2/run_{run_id}.bin"
    with open(fname, "wb") as f:
        f.write(data)
    print(f"Saved simulation to {fname}")

    recs = simulation.result.records

    start_pos = recs["StartPos"]
    end_pos   = recs["EndPos"]
    dx = end_pos[0] - start_pos[0]
    dy = end_pos[1] - start_pos[1]
    return math.hypot(dx, dy)

def run_multiple(seed, runs=20):
    print(f"== Running seed {seed} for {runs} runs ==")
    for i in range(1, runs + 1):
        dist = run_one(seed, i)
        print(f"Run {i:2d}: {dist:.2f} m")

if __name__ == "__main__":
    SEED = 52     
    TRIALS = 30
    run_multiple(SEED, TRIALS)
