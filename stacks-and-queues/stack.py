class Stack:
    def __init__(self):
        self.data = []

    def push(self, item):
        self.data.append(item)

    def pop(self):
        return data.pop()

    def peek(self):
        return data[-1]

    def is_empty(self):
        return len(data) == 0
