'''
Given a string s consists of some words separated by spaces, return the length of the last word in the string. If the last word does not exist, return 0.

A word is a maximal substring consisting of non-space characters only.

 

Example 1:

Input: s = "Hello World"
Output: 5
Example 2:

Input: s = " "
Output: 0
 
'''

class Solution:
    
    #take a string return int
    def solution(self,s):
        #forgot to do the strip .. so "a " would fail the test
        l = s.strip()
        l = l.split(" ")

        sz = len(l)
        return len(l[len(l)-1])
 
 
    #without split
    def s2(self,s):
        count = 0;
        sep = ' '
        for i in reversed(range(len(s))):
            if s[i] == sep:
                if count == 0:
                    continue;
                else:
                    return count
            else:
                count += 1
                
        return count;
    
#=============================

str = "hello world "
S = Solution()
print (S.s2(str))
        