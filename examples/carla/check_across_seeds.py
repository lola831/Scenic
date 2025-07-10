import random
import math
import scenic
from scenic.simulators.carla import CarlaSimulator

code = """
param map = "assets/maps/CARLA/Town10HD_Opt.xodr"
model scenic.simulators.carla.model
param carla_map = "Town10HD_Opt"
param time_step = 1.0/10

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

def run_one(seed):
    random.seed(seed)
    scenario = scenic.scenarioFromString(code, mode2D=True)
    scene, _ = scenario.generate()

    sim = CarlaSimulator(
        carla_map="Town10HD_Opt",
        map_path="assets/maps/CARLA/Town10HD_Opt.xodr",
    )
    records = sim.simulate(scene).result.records

    start_pos = records["StartPos"]
    end_pos   = records["EndPos"]
    dx = end_pos[0] - start_pos[0]
    dy = end_pos[1] - start_pos[1]
    return math.hypot(dx, dy)

def test_across_seeds(seeds, tol=1e-6):
    distances = {}
    for s in seeds:
        d = run_one(s)
        print(f"Seed {s:2d}: {d:.2f} m")
        distances[s] = d

    mn = min(distances.values())
    mx = max(distances.values())
    if mx - mn > tol:
        return distances
    return {}

#  Seed 52: 136.66 m 
# Seed 96: 136.66 m
# (VS USUAL 140.69)

if __name__ == "__main__":
    seeds    = list(range(1, 5))     # seeds 1–20, 21-33, 34-59, 60-99, 100-105
    failures = test_across_seeds(seeds)

    if failures:
        print("\nDistance varied across seeds:")
        for s, d in failures.items():
            print(f"  Seed {s:2d}: {d:.2f} m")
    else:
        print("\nAll seeds produced the same distance.")
