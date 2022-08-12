public with sharing class Primes {

    public static List<Integer> getPrimes(Integer count) {
        Integer i = 0;
        Integer found = 0;
        List<Integer> primes = new List<Integer>();
        do {
            if (isPrime(i)) {
                primes.add(i);
                found += 1;
            }
            i += 1;
        } while (found < count);

        return primes;
    }

    private static Boolean isPrime(Integer n) {
        if(n == 2) return true; 
        if (n < 3 ) return false;
        if (math.mod(n,2) == 0) return false;
        Integer endPoint = (Integer)(math.sqrt(n) + 1);
        for(Integer i = 3; i < endPoint; i += 2) {
            if (math.mod(n,i) == 0) {
                return false;
            }
        }
        return true;
    }

}
