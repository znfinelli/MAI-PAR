#!/usr/bin/env python3
"""
PDDL Problem Generator for Mining Robot Domain
Generates PDDL problem files for the mining-robot domain with configurable parameters.
"""

import random
import os
from typing import List, Tuple, Set


class MiningProblemGenerator:
    def __init__(self):
        self.domain_name = "mining-robot"
        self.areas = []
        self.minecars = []
        self.minerals = []
        self.empty_areas = []
        self.adjacencies = []
        
    def generate_grid_areas(self, rows: int, cols: int) -> List[str]:
        """Generate area names for a grid of given dimensions."""
        areas = []
        for i in range(1, rows + 1):
            for j in range(1, cols + 1):
                areas.append(f"a{i}{j}")
        return areas
    
    def generate_adjacencies(self, rows: int, cols: int) -> List[Tuple[str, str]]:
        """Generate adjacency relationships for a grid."""
        adjacencies = []
        areas = self.generate_grid_areas(rows, cols)
        
        for i in range(rows):
            for j in range(cols):
                current_area = f"a{i+1}{j+1}"
                
                # Right neighbor
                if j < cols - 1:
                    right_area = f"a{i+1}{j+2}"
                    adjacencies.append((current_area, right_area))
                    adjacencies.append((right_area, current_area))
                
                # Down neighbor
                if i < rows - 1:
                    down_area = f"a{i+2}{j+1}"
                    adjacencies.append((current_area, down_area))
                    adjacencies.append((down_area, current_area))
        
        return adjacencies
    
    def generate_minecars(self, num_minecars: int, areas: List[str]) -> List[str]:
        """Generate minecar names and assign them to random areas."""
        minecars = [f"m{i+1}" for i in range(num_minecars)]
        return minecars
    
    def generate_initial_state(self, rows: int, cols: int, num_minecars: int, 
                             num_minerals: int, robot_start_area: str = None) -> dict:
        """Generate the initial state of the problem."""
        areas = self.generate_grid_areas(rows, cols)
        minecars = self.generate_minecars(num_minecars, areas)
        adjacencies = self.generate_adjacencies(rows, cols)
        
        if robot_start_area is None:
            center_row = (rows + 1) // 2
            center_col = (cols + 1) // 2
            robot_location = f"a{center_row}{center_col}"
        else:
            robot_location = robot_start_area
        
        available_areas = [area for area in areas if area != robot_location]
        mineral_areas = random.sample(available_areas, min(num_minerals, len(available_areas)))
        
        minecar_areas = random.sample(areas, min(num_minecars, len(areas)))
        empty_areas = [area for area in areas if area not in minecar_areas and area not in mineral_areas]
        
        return {
            'robot_location': robot_location,
            'minecar_locations': [(minecars[i], minecar_areas[i]) for i in range(len(minecars))],
            'mineral_areas': mineral_areas,
            'empty_areas': empty_areas,
            'adjacencies': adjacencies
        }
    
    def generate_goal_state(self, initial_state: dict, minecars: List[str]) -> dict:
        """Generate a goal state with minecars in different positions and all minerals depleted."""
        areas = [area for area in self.generate_grid_areas(3, 3)]  # Assuming 3x3 for goal
        mineral_areas = initial_state['mineral_areas']
        
        goal_minecar_positions = []
        if len(minecars) >= 1:
            goal_minecar_positions.append((minecars[0], "a11"))  # Top-left
        if len(minecars) >= 2:
            goal_minecar_positions.append((minecars[1], "a13"))  # Top-right
        if len(minecars) >= 3:
            goal_minecar_positions.append((minecars[2], "a31"))  # Bottom-left
        if len(minecars) >= 4:
            goal_minecar_positions.append((minecars[3], "a33"))  # Bottom-right
        
        return {
            'robot_location': "a13",  # Top-right corner
            'minecar_locations': goal_minecar_positions,
            'depleted_areas': mineral_areas
        }
    
    def generate_problem_content(self, problem_name: str, rows: int, cols: int, 
                               num_minecars: int, num_minerals: int, 
                               robot_start_area: str = None) -> str:
        """Generate the complete PDDL problem content."""
        initial_state = self.generate_initial_state(rows, cols, num_minecars, num_minerals, robot_start_area)
        goal_state = self.generate_goal_state(initial_state, [f"m{i+1}" for i in range(num_minecars)])
        
        areas = self.generate_grid_areas(rows, cols)
        minecars = [f"m{i+1}" for i in range(num_minecars)]
        objects = " ".join(areas + minecars)
        
        init_predicates = []
        
        init_predicates.append(f"        (robot-location {initial_state['robot_location']})")
        init_predicates.append("")
        
        for minecar, area in initial_state['minecar_locations']:
            init_predicates.append(f"        (minecar-location {minecar} {area})")
        init_predicates.append("")
        
        for area in initial_state['mineral_areas']:
            init_predicates.append(f"        (mineral {area})")
        init_predicates.append("")
        
        for area in initial_state['empty_areas']:
            init_predicates.append(f"        (empty {area})")
        init_predicates.append("")
        
        for area1, area2 in initial_state['adjacencies']:
            init_predicates.append(f"        (adjacent {area1} {area2})")
        
        goal_predicates = []
        
        goal_predicates.append(f"            (robot-location {goal_state['robot_location']})")
        
        for minecar, area in goal_state['minecar_locations']:
            goal_predicates.append(f"            (minecar-location {minecar} {area})")
        
        for area in goal_state['depleted_areas']:
            goal_predicates.append(f"            (depleted {area})")
        
        problem_content = f"""(define (problem {problem_name}) (:domain {self.domain_name})
(:objects {objects})

    (:init
{chr(10).join(init_predicates)}
    )
    (:goal 
        (and 
{chr(10).join(goal_predicates)}
        )
    )

)"""
        
        return problem_content
    
    def save_problem(self, content: str, filename: str):
        """Save the problem content to a file."""
        with open(filename, 'w') as f:
            f.write(content)
        print(f"Problem saved to: {filename}")


def get_user_input():
    """Get input parameters from the user."""
    print("=== PDDL Mining Robot Problem Generator ===")
    print()
    
    while True:
        try:
            rows = int(input("Enter number of rows (default: 3): ") or "3")
            cols = int(input("Enter number of columns (default: 3): ") or "3")
            if rows > 0 and cols > 0:
                break
            else:
                print("Please enter positive numbers.")
        except ValueError:
            print("Please enter valid numbers.")
    
    max_minecars = rows * cols
    while True:
        try:
            num_minecars = int(input(f"Enter number of minecars (max: {max_minecars}, default: 4): ") or "4")
            if 0 <= num_minecars <= max_minecars:
                break
            else:
                print(f"Please enter a number between 0 and {max_minecars}.")
        except ValueError:
            print("Please enter a valid number.")
    
    max_minerals = rows * cols - 1
    while True:
        try:
            num_minerals = int(input(f"Enter number of minerals (max: {max_minerals}, default: 3): ") or "3")
            if 0 <= num_minerals <= max_minerals:
                break
            else:
                print(f"Please enter a number between 0 and {max_minerals}.")
        except ValueError:
            print("Please enter a valid number.")
    
    areas = [f"a{i}{j}" for i in range(1, rows + 1) for j in range(1, cols + 1)]
    print(f"Available areas: {', '.join(areas)}")
    robot_start = input("Enter robot start area (optional, press Enter for center): ").strip()
    if not robot_start or robot_start not in areas:
        robot_start = None
    
    default_filename = f"problem_{rows}x{cols}.pddl"
    filename = input(f"Enter output filename (default: {default_filename}): ").strip()
    if not filename:
        filename = default_filename
    
    if not filename.endswith('.pddl'):
        filename += '.pddl'
    
    return rows, cols, num_minecars, num_minerals, robot_start, filename


def main():
    """Main function to run the problem generator."""
    try:

        rows, cols, num_minecars, num_minerals, robot_start, filename = get_user_input()
        
        generator = MiningProblemGenerator()
        problem_name = f"mining_{rows}x{cols}"
        
        print(f"\nGenerating problem: {problem_name}")
        print(f"Grid size: {rows}x{cols}")
        print(f"Minecars: {num_minecars}")
        print(f"Minerals: {num_minerals}")
        print(f"Robot start: {robot_start or 'center'}")
        print(f"Output file: {filename}")
        print()
        
        content = generator.generate_problem_content(
            problem_name, rows, cols, num_minecars, num_minerals, robot_start
        )
        
        generator.save_problem(content, filename)
        
        print("Problem generation completed successfully!")
        
    except KeyboardInterrupt:
        print("\nOperation cancelled by user.")
    except Exception as e:
        print(f"Error: {e}")


if __name__ == "__main__":
    main()