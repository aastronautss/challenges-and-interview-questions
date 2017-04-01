class StackWithMin:
    def __init__(self):
        self.data = []
        self.mins = []

    def push(self, val):
        if len(self.mins) == 0 or val <= self.mins(-1):
            self.mins.append(val)
        self.data.append(val)

    def pop(self):
        if self.data[-1] == self.mins[-1]:
            self.mins.pop()
        return self.data.pop()

    def min(self):
        return self.mins[-1]

    def peek(self):
        return self.data[-1]

