'''
找出一个锯齿数组里长度大于5的子数组
在符合要求的子数组里的数据里找出所有偶数
如果数据小于10的话乘以2,大于10的除以2
最后统计符合要求的数据的和
'''
inputdata = [
       [2,8,9,13,72,67,88,35,44],
       [33,28,47,2,10,45,66,92],
       [22,34,60,43,0,72,52],
       [10,11,53,58]
        ]

#经同行测试，如果先生成 list 再sum，对
#此示例来说，速度更快。
def sumIt(_input):
    return sum(sum(item *2 if item < 10 else item/2
                     for item in data_area
                     if item%2 == 0)
                for data_area in _input
                if len(data_area)>5)

print sumIt(inputdata)
