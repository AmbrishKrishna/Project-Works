    def play_game():
        num1 = random.randint(0, 4)
        num2 = random.randint(0, 4)
        building1 = building_list[num1]
        building2 = building_list[num2]
        print('1. Build a {}'.format(building1))
        print('2. Build a {}'.format(building2))
        print('3. See remaining buildings')
        print('4. See current score')
        print()
        print('5. Save game')
        print('0. Exit to main menu')

    num1 = random.randint(0, 4)
    num2 = random.randint(0, 4)
    building1 = building_list[num1]
    building2 = building_list[num2]
    print('1. Build a {}'.format(building1))
    print('2. Build a {}'.format(building2))
    print('3. See remaining buildings')
    print('4. See current score')
    print()
    print('5. Save game')
    print('0. Exit to main menu')

    user_input = int(input('Your choice? '))
    
    
    if user_input == 1:
        while True:
            if turn == 1:
                location = input('Build where?')
                column = letters[location[0]]
                row = int(location[1]) - 1
                column_list.append(column)
                row_list.append(row)
                city[row][column] = building1
                turn += 1
                building_no_list[num1] = building_no_list[num1] - 1
                num1 = random.randint(0, 4)
                num2 = random.randint(0, 4)
            elif turn >= 1:
                print_city()
                to_print_list = []
                print('1. Build a {}'.format(building1))
                print('2. Build a {}'.format(building2))
                print('3. See remaining buildings')
                print('4. See current score')
                print()
                print('5. Save game')
                print('0. Exit to main menu')
                user_build_input = int(input('Your choice? '))
                if user_build_input == 1:
                    location = input('Build where?')
                    column = letters[location[0]]
                    row = int(location[1]) - 1
                    for i in range(len(column_list)):
                        if column_list[i] == column and row_list[i] == row:
                            print("There is already a building there")
                        else:
                            for i in range(len(column_list)):
                                if (column_list[i] == column) and ((row_list[i]+1) == row):
                                    to_print_list.append(True)#spot below
                                elif (column_list[i] == column) and ((row_list[i]-1) == row):
                                    to_print_list.append(True)#spot above
                                elif ((column_list[i]+1) == column) and (row_list[i] == row):
                                    to_print_list.append(True)#spot to the right
                                elif ((column_list[i]-1) == column) and (row_list[i] == row):
                                    to_print_list.append(True)#spot to the left
                    if True in to_print_list:
                        city[row][column] = building1
                        turn += 1
                        column_list.append(column)
                        row_list.append(row)
                        building_no_list[num1] = building_no_list[num1] - 1
                        num1 = random.randint(0, 4)
                        num2 = random.randint(0, 4)
                    else:
                        print("You must build next to an existing building.")
                if user_build_input == 2:
                    location = input('Build where?')
                    column = letters[location[0]]
                    row = int(location[1]) - 1
                    for i in range(len(column_list)):
                        if column_list[i] == column and row_list[i] == row:
                            print("There is already a building there")
                        else:
                            for i in range(len(column_list)):
                                if (column_list[i] == column) and ((row_list[i]+1) == row):
                                    to_print_list.append(True)#spot below
                                elif (column_list[i] == column) and ((row_list[i]-1) == row):
                                    to_print_list.append(True)#spot above
                                elif ((column_list[i]+1) == column) and (row_list[i] == row):
                                    to_print_list.append(True)#spot to the right
                                elif ((column_list[i]-1) == column) and (row_list[i] == row):
                                    to_print_list.append(True)#spot to the left
                            if True in to_print_list:
                                city[row][column] = building2
                                turn += 1
                                column_list.append(column)
                                row_list.append(row)
                                building_no_list[num2] = building_no_list[num2] - 1
                                num1 = random.randint(0,4)
                                num2 = random.randint(0,4)
                            else:
                                print("You must build next to an existing building.")

                if user_build_input == 3:
                    print('''
Building           Remaining
--------           ---------
SHP                {}
BCH                {}
HSE                {}
HWY                {}
FAC                {}         '''.format(building_no_list[0], building_no_list[1], building_no_list[2], building_no_list[3], building_no_list[4]))

                else:
                    print('Please enter a valid choice!')

                if user_build_input == 4:
                    building_score = {"SHP": [], "BCH": [], "HSE": [], "HWY": [], "FAC": []}
                    for r in range(0, 4):
                        for c in range(0, 4):
                            if city[r][c] == "BCH":
                                if c == 1 or c == 4:
                                    building_score["BCH"].append(3)
                                else:
                                    building_score["BCH"].append(1)
                            elif city[r][c] == "SHP":
                                adj_list = []
                                adj_list.append(city[r - 1][c])
                                if city[r + 1][c] not in adj_list:
                                    adj_list.append(city[r + 1][c])
                                if city[r][c + 1] not in adj_list:
                                    adj_list.append(city[r][c + 1])
                                if city[r][c - 1] not in adj_list:
                                    adj_list.append(city[r][c - 1])
                                if '   ' in adj_list:
                                    adj_list.remove('   ')
                                building_score["SHP"].append(len(adj_list))
                            elif city[r][c] == "HWY":
                                if city[r][c - 1] != "HWY":
                                    score_hwy = 0
                                    while city[r][c] == "HWY":
                                        score_hwy += 1
                                        c += 1
                                    for squares in range(score_hwy):
                                        building_score["HWY"].append(score_hwy)
                            elif city[r][c] == "HSE":
                                score_hse = 0
                                #NEXT TO FACTORY
                                if city[r + 1][c] == "FAC":
                                    score_hse = 1
                                if city[r - 1][c] == "FAC":
                                    score_hse = 1
                                if city[r][c + 1] == "FAC":
                                    score_hse = 1
                                if city[r][c - 1] == "FAC":
                                    score_hse = 1
                                #NEXT TO HOUSE
                                if city[r + 1][c] == "HSE":
                                    score_hse += 1
                                if city[r - 1][c] == "HSE":
                                    score_hse += 1
                                if city[r][c + 1] == "HSE":
                                    score_hse += 1
                                if city[r][c - 1] == "HSE":
                                    score_hse += 1
                                #NEXT TO SHOP
                                if city[r + 1][c] == "SHP":
                                    score_hse += 1
                                if city[r - 1][c] == "SHP":
                                    score_hse += 1
                                if city[r][c + 1] == "SHP":
                                    score_hse += 1
                                if city[r][c - 1] == "SHP":
                                    score_hse += 1
                                #NEXT TO BEACH
                                if city[r + 1][c] == "BCH":
                                    score_hse += 2
                                if city[r - 1][c] == "BCH":
                                    score_hse += 2
                                if city[r][c + 1] == "BCH":
                                    score_hse += 2
                                if city[r][c - 1] == "BCH":
                                    score_hse += 2
                                for squares in range(score_hse):
                                        building_score["HSE"].append(score_hse)
                            elif city[r][c] == "FAC":
                                while int(city[r][c]) <= 4:
                                    score_fac = int(city[r][c] == "FAC") ** int(city[r][c] == "FAC")
                                while int(city[r][c]) >= 5:
                                    score_fac = 16 + (int(city[r][c]) - 4)
                                building_score["FAC"].append(score_fac)
                    total_score_list = int(building_score["SHP"]) + int(building_score["BCH"]) + int(building_score["HWY"]) + int(building_score["HSE"]) + int(building_score["FAC"])
                    total_score = sum(total_score_list)
                    print('SHP: {}'.format(building_score["SHP"]))
                    print('BCH: {}'.format(building_score["BCH"]))
                    print('HWY: {}'.format(building_score["HWY"]))
                    print('HSE: {}'.format(building_score["HSE"]))
                    print('FAC: {}'.format(building_score["FAC"]))
                    print('Total Score: {}'.format(total_score_list))
                    
    if user_input == 2:
        while True:
            if turn == 1:
                location = input('Build where?')
                column = letters[location[0]]
                row = int(location[1]) - 1
                column_list.append(column)
                row_list.append(row)
                city[row][column] = building2
                turn += 1
                building_no_list[num2] = building_no_list[num2] - 1
                num1 = random.randint(0, 4)
                num2 = random.randint(0, 4)
            elif turn >= 1:
                print_city()
                to_print_list = []
                print('1. Build a {}'.format(building1))
                print('2. Build a {}'.format(building2))
                print('3. See remaining buildings')
                print('4. See current score')
                print()
                print('5. Save game')
                print('0. Exit to main menu')
                user_build_input = int(input('Your choice? '))
                if user_build_input == 1:
                    location = input('Build where?')
                    column = letters[location[0]]
                    row = int(location[1]) - 1
                    for i in range(len(column_list)):
                        if column_list[i] == column and row_list[i] == row:
                            print("There is already a building there")
                        else:
                            for i in range(len(column_list)):
                                if (column_list[i] == column) and ((row_list[i]+1) == row):
                                    to_print_list.append(True)#spot below
                                elif (column_list[i] == column) and ((row_list[i]-1) == row):
                                    to_print_list.append(True)#spot above
                                elif ((column_list[i]+1) == column) and (row_list[i] == row):
                                    to_print_list.append(True)#spot to the right
                                elif ((column_list[i]-1) == column) and (row_list[i] == row):
                                    to_print_list.append(True)#spot to the left
                    if True in to_print_list:
                        city[row][column] = building1
                        turn += 1
                        column_list.append(column)
                        row_list.append(row)
                        building_no_list[num1] = building_no_list[num1] - 1
                        num1 = random.randint(0, 4)
                        num2 = random.randint(0, 4)
                    else:
                        print("You must build next to an existing building.")
                if user_build_input == 2:
                    location = input('Build where?')
                    column = letters[location[0]]
                    row = int(location[1]) - 1
                    for i in range(len(column_list)):
                        if column_list[i] == column and row_list[i] == row:
                            print("There is already a building there")
                        else:
                            for i in range(len(column_list)):
                                if (column_list[i] == column) and ((row_list[i]+1) == row):
                                    to_print_list.append(True)#spot below
                                elif (column_list[i] == column) and ((row_list[i]-1) == row):
                                    to_print_list.append(True)#spot above
                                elif ((column_list[i]+1) == column) and (row_list[i] == row):
                                    to_print_list.append(True)#spot to the right
                                elif ((column_list[i]-1) == column) and (row_list[i] == row):
                                    to_print_list.append(True)#spot to the left
                    if True in to_print_list:
                                city[row][column] = building2
                                turn += 1
                                column_list.append(column)
                                row_list.append(row)
                                building_no_list[num2] = building_no_list[num2] - 1
                                num1 = random.randint(0, 4)
                                num2 = random.randint(0, 4)
                    else:
                                print("You must build next to an existing building.")
                if user_build_input == 3:
                    print('''
Building           Remaining
--------           ---------
SHP                {}
BCH                {}
HSE                {}
HWY                {}
FAC                {}
'''.format(building_no_list[0], building_no_list[1], building_no_list[2], building_no_list[3], building_no_list[4]))
                else:
                    print('Please enter a valid choice!')

                if user_build_input == 4:
                    building_score = {"SHP": [], "BCH": [], "HSE": [], "HWY": [], "FAC": []}
                    for r in range(0, 4):
                        for c in range(0, 4):
                            if city[r][c] == "BCH":
                                if c == 1 or c == 4:
                                    building_score["BCH"].append(3)
                                else:
                                    building_score["BCH"].append(1)
                            elif city[r][c] == "SHP":
                                adj_list = []
                                adj_list.append(city[r - 1][c])
                                if city[r + 1][c] not in adj_list:
                                    adj_list.append(city[r + 1][c])
                                if city[r][c + 1] not in adj_list:
                                    adj_list.append(city[r][c + 1])
                                if city[r][c - 1] not in adj_list:
                                    adj_list.append(city[r][c - 1])
                                if '   ' in adj_list:
                                    adj_list.remove('   ')
                                building_score["SHP"].append(len(adj_list))
                            elif city[r][c] == "HWY":
                                if city[r][c - 1] != "HWY":
                                    score_hwy = 0
                                    while city[r][c] == "HWY":
                                        score_hwy += 1
                                        c += 1
                                    for squares in range(score_hwy):
                                        building_score["HWY"].append(score_hwy)
                            elif city[r][c] == "HSE":
                                score_hse = 0
                                #NEXT TO FACTORY
                                if city[r + 1][c] == "FAC":
                                    score_hse = 1
                                if city[r - 1][c] == "FAC":
                                    score_hse = 1
                                if city[r][c + 1] == "FAC":
                                    score_hse = 1
                                if city[r][c - 1] == "FAC":
                                    score_hse = 1
                                #NEXT TO HOUSE
                                if city[r + 1][c] == "HSE":
                                    score_hse += 1
                                if city[r - 1][c] == "HSE":
                                    score_hse += 1
                                if city[r][c + 1] == "HSE":
                                    score_hse += 1
                                if city[r][c - 1] == "HSE":
                                    score_hse += 1
                                #NEXT TO SHOP
                                if city[r + 1][c] == "SHP":
                                    score_hse += 1
                                if city[r - 1][c] == "SHP":
                                    score_hse += 1
                                if city[r][c + 1] == "SHP":
                                    score_hse += 1
                                if city[r][c - 1] == "SHP":
                                    score_hse += 1
                                #NEXT TO BEACH
                                if city[r + 1][c] == "BCH":
                                    score_hse += 2
                                if city[r - 1][c] == "BCH":
                                    score_hse += 2
                                if city[r][c + 1] == "BCH":
                                    score_hse += 2
                                if city[r][c - 1] == "BCH":
                                    score_hse += 2
                                for squares in range(score_hse):
                                        building_score["HSE"].append(score_hse)
                            elif city[r][c] == "FAC":
                                while int(city[r][c]) <= 4:
                                    score_fac = int(city[r][c] == "FAC") ** int(city[r][c] == "FAC")
                                while int(city[r][c]) >= 5:
                                    score_fac = 16 + (int(city[r][c]) - 4)
                                building_score["FAC"].append(score_fac)
                    total_score_list = int(building_score["SHP"]) + int(building_score["BCH"]) + int(building_score["HWY"]) + int(building_score["HSE"]) + int(building_score["FAC"])
                    total_score = sum(total_score_list)
                    print('SHP: {}'.format(building_score["SHP"]))
                    print('BCH: {}'.format(building_score["BCH"]))
                    print('HWY: {}'.format(building_score["HWY"]))
                    print('HSE: {}'.format(building_score["HSE"]))
                    print('FAC: {}'.format(building_score["FAC"]))
                    print('Total Score: {}'.format(total_score_list))
#See Remaining Buildings
    if user_input == 3:
        def dislay_remaining_buildings():
            print('''
Building           Remaining
--------           ---------
SHP                {}
BCH                {}
HSE                {}
HWY                {}
FAC                {}
    '''.format(building_no_list[0], building_no_list[1], building_no_list[2], building_no_list[3], building_no_list[4]))

        display_remaining_buildings()
        print_city()
        to_print_list = []
        print('1. Build a {}'.format(building1))
        print('2. Build a {}'.format(building2))
        print('3. See remaining buildings')
        print('4. See current score')
        print()
        print('5. Save game')
        print('0. Exit to main menu')
        user_build_input = int(input('Your choice? '))
        if user_build_input == 1:
            location = input('Build where?')
            column = letters[location[0]]
            row = int(location[1]) - 1
            for i in range(len(column_list)):
                if column_list[i] == column and row_list[i] == row:
                    print("There is already a building there")
                else:
                    for i in range(len(column_list)):
                        if (column_list[i] == column) and ((row_list[i]+1) == row):
                            to_print_list.append(True)#spot below
                        elif (column_list[i] == column) and ((row_list[i]-1) == row):
                            to_print_list.append(True)#spot above
                        elif ((column_list[i]+1) == column) and (row_list[i] == row):
                            to_print_list.append(True)#spot to the right
                        elif ((column_list[i]-1) == column) and (row_list[i] == row):
                            to_print_list.append(True)#spot to the left
            if True in to_print_list:
                city[row][column] = building1
                turn += 1
                column_list.append(column)
                row_list.append(row)
                building_no_list[num1] = building_no_list[num1] - 1
                num1 = random.randint(0, 4)
                num2 = random.randint(0, 4)
            else:
                print("You must build next to an existing building.")
        if user_build_input == 2:
            location = input('Build where?')
            column = letters[location[0]]
            row = int(location[1]) - 1
            for i in range(len(column_list)):
                if column_list[i] == column and row_list[i] == row:
                    print("There is already a building there")
                else:
                    for i in range(len(column_list)):
                        if (column_list[i] == column) and ((row_list[i]+1) == row):
                            to_print_list.append(True)#spot below
                        elif (column_list[i] == column) and ((row_list[i]-1) == row):
                            to_print_list.append(True)#spot above
                        elif ((column_list[i]+1) == column) and (row_list[i] == row):
                            to_print_list.append(True)#spot to the right
                        elif ((column_list[i]-1) == column) and (row_list[i] == row):
                            to_print_list.append(True)#spot to the left
                    if True in to_print_list:
                        city[row][column] = building2
                        turn += 1
                        column_list.append(column)
                        row_list.append(row)
                        building_no_list[num2] = building_no_list[num2] - 1
                        num1 = random.randint(0, 4)
                        num2 = random.randint(0, 4)
                    else:
                        print("You must build next to an existing building.")

        if user_build_input == 3:
            print('''
Building           Remaining
--------           ---------
SHP                {}
BCH                {}
HSE                {}
HWY                {}
FAC                {}         '''.format(building_no_list[0], building_no_list[1], building_no_list[2], building_no_list[3], building_no_list[4]))

        else:
            print('Please enter a valid choice!')

        if user_build_input == 4:
            building_score = {"SHP": [], "BCH": [], "HSE": [], "HWY": [], "FAC": []}
            for r in range(0, 4):
                for c in range(0, 4):
                    if city[r][c] == "BCH":
                        if c == 1 or c == 4:
                            building_score["BCH"].append(3)
                        else:
                            building_score["BCH"].append(1)
                    elif city[r][c] == "SHP":
                        adj_list = []
                        adj_list.append(city[r - 1][c])
                        if city[r + 1][c] not in adj_list:
                            adj_list.append(city[r + 1][c])
                        if city[r][c + 1] not in adj_list:
                            adj_list.append(city[r][c + 1])
                        if city[r][c - 1] not in adj_list:
                            adj_list.append(city[r][c - 1])
                        if '   ' in adj_list:
                            adj_list.remove('   ')
                        building_score["SHP"].append(len(adj_list))
                    elif city[r][c] == "HWY":
                        if city[r][c - 1] != "HWY":
                            score_hwy = 0
                            while city[r][c] == "HWY":
                                score_hwy += 1
                                c += 1
                            for squares in range(score_hwy):
                                building_score["HWY"].append(score_hwy)
                    elif city[r][c] == "HSE":
                        score_hse = 0
                        #NEXT TO FACTORY
                        if city[r + 1][c] == "FAC":
                            score_hse = 1
                        if city[r - 1][c] == "FAC":
                            score_hse = 1
                        if city[r][c + 1] == "FAC":
                            score_hse = 1
                        if city[r][c - 1] == "FAC":
                            score_hse = 1
                        #NEXT TO HOUSE
                        if city[r + 1][c] == "HSE":
                            score_hse += 1
                        if city[r - 1][c] == "HSE":
                            score_hse += 1
                        if city[r][c + 1] == "HSE":
                            score_hse += 1
                        if city[r][c - 1] == "HSE":
                            score_hse += 1
                        #NEXT TO SHOP
                        if city[r + 1][c] == "SHP":
                            score_hse += 1
                        if city[r - 1][c] == "SHP":
                            score_hse += 1
                        if city[r][c + 1] == "SHP":
                            score_hse += 1
                        if city[r][c - 1] == "SHP":
                            score_hse += 1
                        #NEXT TO BEACH
                        if city[r + 1][c] == "BCH":
                            score_hse += 2
                        if city[r - 1][c] == "BCH":
                            score_hse += 2
                        if city[r][c + 1] == "BCH":
                            score_hse += 2
                        if city[r][c - 1] == "BCH":
                            score_hse += 2
                        for squares in range(score_hse):
                                building_score["HSE"].append(score_hse)
                    elif city[r][c] == "FAC":
                        while int(city[r][c]) <= 4:
                            score_fac = int(city[r][c] == "FAC") ** int(city[r][c] == "FAC")
                        while int(city[r][c]) >= 5:
                            score_fac = 16 + (int(city[r][c]) - 4)
                        building_score["FAC"].append(score_fac)
            total_score_list = int(building_score["SHP"]) + int(building_score["BCH"]) + int(building_score["HWY"]) + int(building_score["HSE"]) + int(building_score["FAC"])
            total_score = sum(total_score_list)
            print('SHP: {}'.format(building_score["SHP"]))
            print('BCH: {}'.format(building_score["BCH"]))
            print('HWY: {}'.format(building_score["HWY"]))
            print('HSE: {}'.format(building_score["HSE"]))
            print('FAC: {}'.format(building_score["FAC"]))
            print('Total Score: {}'.format(total_score_list))
    else:
        print('Please enter a valid choice!')

#2.3 See Current Score
    if user_input == 4:
        def display_current_score():
            building_score = {"SHP": [], "BCH": [], "HSE": [], "HWY": [], "FAC": []}
            for r in range(0, 4):
                for c in range(0, 4):
                    if city[r][c] == "BCH":
                        if c == 1 or c == 4:
                            building_score["BCH"].append(3)
                        else:
                            building_score["BCH"].append(1)
                    elif city[r][c] == "SHP":
                        adj_list = []
                        adj_list.append(city[r - 1][c])
                        if city[r + 1][c] not in adj_list:
                            adj_list.append(city[r + 1][c])
                        if city[r][c + 1] not in adj_list:
                            adj_list.append(city[r][c + 1])
                        if city[r][c - 1] not in adj_list:
                            adj_list.append(city[r][c - 1])
                        if '   ' in adj_list:
                            adj_list.remove('   ')
                        building_score["SHP"].append(len(adj_list))
                    elif city[r][c] == "HWY":
                        if city[r][c - 1] != "HWY":
                            score_hwy = 0
                            while city[r][c] == "HWY":
                                score_hwy += 1
                                c += 1
                            for squares in range(score_hwy):
                                building_score["HWY"].append(score_hwy)
                    elif city[r][c] == "HSE":
                        score_hse = 0
                        #NEXT TO FACTORY
                        if city[r + 1][c] == "FAC":
                            score_hse = 1
                        if city[r - 1][c] == "FAC":
                            score_hse = 1
                        if city[r][c + 1] == "FAC":
                            score_hse = 1
                        if city[r][c - 1] == "FAC":
                            score_hse = 1
                        #NEXT TO HOUSE
                        if city[r + 1][c] == "HSE":
                            score_hse += 1
                        if city[r - 1][c] == "HSE":
                            score_hse += 1
                        if city[r][c + 1] == "HSE":
                            score_hse += 1
                        if city[r][c - 1] == "HSE":
                            score_hse += 1
                        #NEXT TO SHOP
                        if city[r + 1][c] == "SHP":
                            score_hse += 1
                        if city[r - 1][c] == "SHP":
                            score_hse += 1
                        if city[r][c + 1] == "SHP":
                            score_hse += 1
                        if city[r][c - 1] == "SHP":
                            score_hse += 1
                        #NEXT TO BEACH
                        if city[r + 1][c] == "BCH":
                            score_hse += 2
                        if city[r - 1][c] == "BCH":
                            score_hse += 2
                        if city[r][c + 1] == "BCH":
                            score_hse += 2
                        if city[r][c - 1] == "BCH":
                            score_hse += 2
                        for squares in range(score_hse):
                                building_score["HSE"].append(score_hse)
                    elif city[r][c] == "FAC":
                        while int(city[r][c]) <= 4:
                            score_fac = int(city[r][c] == "FAC") ** int(city[r][c] == "FAC")
                        while int(city[r][c]) >= 5:
                            score_fac = 16 + (int(city[r][c]) - 4)
                        building_score["FAC"].append(score_fac)
            
            total_score_list = int(building_score["SHP"]) + int(building_score["BCH"]) + int(building_score["HWY"]) + int(building_score["HSE"]) + int(building_score["FAC"])
            total_score = sum(total_score_list)
            print('SHP: {}'.format(building_score["SHP"]))
            print('BCH: {}'.format(building_score["BCH"]))
            print('HWY: {}'.format(building_score["HWY"]))
            print('HSE: {}'.format(building_score["HSE"]))
            print('FAC: {}'.format(building_score["FAC"]))
            print('Total Score: {}'.format(total_score_list))
