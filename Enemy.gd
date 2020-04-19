func choose_move_target(player_pos):
    var delta_x = player_pos[0] - pos[0]
    var delta_y = player-pos[1] - pos[1]
    if delta_x > delta_y:
        if delta_x > 0:
            var target = (pos[0] + 1, pos[1])
        else:
            var target = (pos[[0] - 1, pos[1])
    else:
        if delta_y > 0:
            var target = (pos[0], pos[1] + 1)
        else:
            var target = (pos[0], pos[1] - 1)

    if state.is_open(target):
        return target
    else:
        # TODO follow a wall.
        pass
