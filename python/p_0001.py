#!/sbin/env python3

def multiples_of_three_and_five(limit):
    sum = 0
    for i in range(limit):
        if 0 == i%3:
            sum += i
        else:
            if 0 == i%5:
                sum += i

    return sum

if __name__ == '__main__':
   print(multiples_of_three_and_five(1000))
