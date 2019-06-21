# this file adds ~/.pythonpath to the python path in jupyter/ipython
# the same is also implemented in ~/.bashrc, such that ~/.pythonpath
# is also available in normal python.
from os.path import expanduser as __expand
from sys import path as __path

__idx = __path.index("")
del __path[__idx]
with open(__expand("~/.pythonpath"), "r") as __file:
    __pth = __file.readlines()
for __p in __pth:
    __path.insert(0, __expand(__p.strip()))
__path.insert(0, "")
del __expand, __path, __file, __pth, __idx
