#!/bin/env python2.7
#coding:utf8

"""
元类编程演示
===============
仅限于 Python 2.x 的演示

metaclass
====================
调用对象成员时，Python 先查找对象的定义，然后是 metaclass，然后是父类。

需要引入来自多个类型的定义，但是又不想使用多继承时，metaclass 是一个可选的方法。

Python 2 中，可以通过定义类成员 __metaclass__ 引入元类。在 Python 3 中，
我们使用形如 class X(metaclass=Meta) 的方式。

type.__new__
====================
经常在介绍 metaclass 的文章里出现的形如

::
class MetaClass(type):
    def __new__(meta, name, bases, attr):
        ...
        type.__new__(meta, name, bases, attr)

的示例其实有点误导人，type.__new__ 只是 metaclass 编程中常用到的一个技巧。
但是它本身跟 metaclass 没什么必然联系。type.__new__ 构造出一个类型而非普通的实例对象，
这样，只要像函数一样调用这个类型，就会构造出实例对象，这就是我们通常在 Python
代码中定义对象的形式

::
obj = MyClass(param) #type.__new__ 返回的结果就是 MyClass 之类的东西

通常 metaclass 编程会用到这个方法，主要是为了通过重载 __new__ 定义，抢在 __init__ 之前
做一些魔术动作，例如加载一些实例变量，但是如果没有这个需要的话，metaclass 就跟普通的类定义
没什么区别，只是将 metaclass 与类定义组合起来，合并成为一个类而已。

真正的魔法是 type.__new__ ，它可以在运行时动态的构造新的类型。我在 socrates
项目中使用过这个技巧。

"""
import math
import copy

class MetaVector3(type):
    def __new__(meta, name, bases, attrs):
        #attrs["__abs__"] = MetaVector3.__abs__
        return type.__new__(meta, name, bases, attrs)

    def __abs__(self):
        return self.x**2+self.y**2+self.z**2

class Vector(object):
    def __init__(self, x, y):
        """obj = Vector(int, int)
        向量类型的构造方法，接收两个整型作为两个坐标
        """
        self.x = x
        self.y = y

    def __abs__(self):
        """ 
>>> vec = Vector(3, 4)
>>> abs(vec)
5.0
        """
        return math.sqrt(self.x**2+self.y**2)

class Vector3(Vector):
    #这里 metaclass 覆盖了父类的 abs 运算，提供一个三维版本，
    #如果没有这行代码，就会调用二维的 abs 运算，doctest 会出错。
    __metaclass__ = MetaVector3
    """ 
>>> vec = Vector3(2, 2, 2)
>>> abs(vec)
3.4641016151377544
    """
    def __init__(self, x, y, z):
        super(Vector3, self).__init__(x, y)
        self.z=z

def defineMetaVector3(z):
    """三维向量元类，将二维向量扩展为三维向量。
    用元类构造一个新平面上的向量类型，修改元类之后，求模变成三维运算。
>>> vec = defineMetaVector3(2)(2, 2)
>>> abs(vec)
3.4641016151377544
    """
    absFunc = lambda self:math.sqrt(self.x**2+self.y**2+z**2)
    return type("Vector3On%s"%z, (Vector,), {"z":z,"__abs__":absFunc})

if __name__=="__main__":
    import doctest
    doctest.testmod()
