"""My own implementation of a Stack FILO Data Struct"""

class Stack:
    def __init__(self):
        self.data = []
    
    def push(self, data):
        self.data = [data] + self.data
    
    def pop(self):
        return self.data.pop(0)
    
    def peek(self):
        return self.data[0]