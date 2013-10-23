"""My own implementation of a Stack FILO Data Struct"""

class Stack:
    def __init__(self):
        self.data = []
    
    def push(self, data):
        self.data = [data] + self.data
    
    def pop(self):
        res = None
        if len(self.data) != 0: 
            res = self.data.pop(0)
        return res
    
    def peek(self):
        res = None
        if len(self.data) != 0:
            res = self.data[0]
        return res