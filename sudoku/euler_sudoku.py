import sudoku

def main():
	with open("sudoku.txt") as f:
		contents = f.read()
		grids = contents.split("Grid")[1::]
		grids = ["".join([i for i in grid if i != "\n"]) for grid in grids]
	
	solved_grids = [sudoku.solve(grid) for grid in grids]
	solution = sum([int("".join([solution[square] 
						for square in ['A1', 'A2', 'A3']])) 
						for solution in solved_grids])
	print solution

if __name__ == '__main__':
	main()