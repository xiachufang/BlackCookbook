#!/usr/bin/env python
#coding:utf8

def ditstance(source, target):
    """ ditstance(source, target)->int return the levenshtein ditstance 
>>> ditstance("126.com", "127.com")
1
>>> ditstance("127.com", "126.com")
1
>>> ditstance("hotmail.com", "hotmail.com")
0
>>> ditstance("", "")
0
>>> ditstance("sina.com", "")
8
>>> ditstance("", "gmail.com")
9
>>> ditstance("sina.com", "sina.cn")
2
>>> ditstance("qq.cn", "qq.com")
2
>>> ditstance("139.com", ".139.com")
1
>>> ditstance("qq.", "qq.com")
3
>>> ditstance("gmail.com", ".gmail.com")
1
>>> ditstance(".gmail.com", "gmail.com")
1
    """
    src_length = len(source)+1
    tgt_length = len(target)+1

    if src_length == 1:
        return tgt_length - 1
    if tgt_length == 1:
        return src_length - 1

    matrix = [range(tgt_length)]
    for i in range(1, src_length):
        row = [0]*tgt_length
        row[0] = i
        matrix.append(row)

    for i in range(1, src_length):
        src_char = source[i-1]
        for j in range(1, tgt_length):
            tgt_char = target[j-1]
            cost = 0 if src_char == tgt_char else 1
            above = matrix[i-1][j]+1
            left = matrix[i][j-1]+1
            diag = matrix[i-1][j-1]+cost
            value = min(above, left, diag)
            matrix[i][j]=value

    return matrix[src_length-1][tgt_length-1]

if __name__=="__main__":
    import doctest
    doctest.testmod()
