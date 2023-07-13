def jaunt(number):
    ones = number % 10
    tens = number % 100
    return ones, tens - ones
print(jaunt(299))