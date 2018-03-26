cimport shrubbery.shrubbing
import shrubbery.shrubbing

cdef class Bush(shrubbery.shrubbing.Shrubbery):
    cdef readonly int height
    def __init__(self, int w, int l, int h):
        shrubbery.shrubbing.Shrubbery.__init__(self, w, l)
        self.height = h

def test():
    cdef shrubbery.shrubbing.Shrubbery sh
    sh = shrubbery.shrubbing.standard_shrubbery()
    #sh = standard_shrubbery()
    print( "Shrubbery size is %d x %d" %(sh.width, sh.length))
    cdef bu = Bush(3, 6, 9)
    print( "Bush size is %d x %d x %d" %(bu.width, bu.length, bu.height))
