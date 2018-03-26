cdef class Shrubbery:
    def __init__(self, int w, int l):
        self.width = w
        self.length = l
    def get_length(self):
        return self.length
    def get_width(self):
        return self.width

cpdef standard_shrubbery():
    return Shrubbery(3, 7)

def get_width(sh):
    """
    :type sh: Shrubbery
    """
    return sh.width

def get_length(sh):
    """
    :type sh: Shrubbery
    """
    return sh.length
