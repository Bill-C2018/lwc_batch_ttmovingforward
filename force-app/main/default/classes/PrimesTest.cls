@isTest
public with sharing class PrimesTest {

    @isTest
    public static void testIt() {

        List<Integer> expected = new List<Integer>{2, 3, 5, 7, 11, 13, 17, 19, 23};

        List<Integer> res = Primes.getPrimes(9);
        system.assertEquals(9, res.size());
        system.debug(res);
        for (Integer i: expected) {
            system.assertEquals(true, res.contains(i));
        }

        res = Primes.getPrimes(1);
        system.assertEquals(1,res.size());
        system.debug(res);
        system.assertEquals(true, res.contains(2));

/*        
        Datetime tn = System.now();
        test.StartTest();
        List<Integer> res = Primes.getPrimes(10000);
        test.StopTest();
        system.debug('Stop: ' + tn + ' - ' + System.now());
*/
    }

}
