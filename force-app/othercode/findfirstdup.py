#
#find first duplicate in array
#solution should be O(n)
#
def FindFirstDup(lst):
    
    seen = set()
    for i in lst:
        if i in seen:
            return i
        seen.add(i)
        
    return -1    
   
   
#==================================

lst = [1,2,3,4,6,7,4,5,3,2,9] 
print (FindFirstDup(lst))