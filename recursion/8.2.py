# First go: works, but will return extra spaces in the path.

def robot_path(current_space, end_space, invalid_spaces, path = []):
    if is_invalid_space(current_space, end_space, invalid_spaces):
        return False

    path.append(current_space)

    if current_space == end_space:
        return path

    right_space = (current_space[0] + 1, current_space[1])
    down_space = (current_space[0], current_space[1] + 1)

    return robot_path(right_space, end_space, invalid_spaces, path) or robot_path(down_space, end_space, invalid_spaces, path)

def is_invalid_space(current_space, end_space, invalid_spaces):
    return current_space in invalid_spaces or current_space[0] > end_space[0] or current_space[1] > end_space[1]

robot_path((0, 0), (4, 3), [(1, 1), (2, 1), (3, 1), (4, 1)])

# Second go - works in O(pq) time.

def robot_path(end_space, invalid_spaces):
    path = []
    if find_path((0, 0), end_space, invalid_spaces, path):
        return path[::-1]
    return false

def find_path(current, end, invalid_spaces, path, bad_points=[]):
    if is_invalid_space(current, end, invalid_spaces):
        return False
    if current in bad_points:
        return False
    if current == end:
        path.append(current)
        return True
    right_space = (current[0] + 1, current[1])
    down_space = (current[0], current[1] + 1)
    if (find_path(right_space, end, invalid_spaces, path, bad_points) or
        find_path(down_space, end, invalid_spaces, path, bad_points)):
        path.append(current)
        return True
    bad_points.append(current)
    return False

def is_invalid_space(space, end_space, invalid_spaces):
    return (space in invalid_spaces) or (space[0] > end_space[0]) or (space[1] > end_space[1])
