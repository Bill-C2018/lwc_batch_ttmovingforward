@isTest
public with sharing class AccountControllerExtensionTests {



    private static void showResults(List<Account> acct, String seq) {
        System.debug('+++++++++++++++++  seq #: ' + seq);
        if(acct == null) {
            System.debug('null list');
        } else {
            System.debug(acct);
        }

    }

    @isTest
    public static void testProps() {

        Account ac = new Account(Name = 'Test Account', AnnualRevenue = 50000);   
        insert ac;
        ac = new Account(Name = 'bob', AnnualRevenue = 5000); 
        insert ac;

        PageReference testPage = Page.AccountSearch;
        Test.setCurrentPage(testPage);
       

        ApexPages.StandardController sc = new  ApexPages.StandardController(ac);     
        AccountControllerExtension ext = new AccountControllerExtension(sc);   
        
        showResults(ext.accList, 'A');

        ext.searchtext = 'bob';
        showResults(ext.accList, 'B');
        system.assertEquals(1,ext.accList.size());

        ext.searchtext = 'bob\'AND';
        showResults(ext.accList, 'C');
        system.assertEquals('bob\\\'AND', ext.searchtext);

        ext.minInput = '23n';
        system.assertEquals('0',ext.minInput);

        ext.maxInput = '99j';
        system.assertEquals('999999999',ext.maxInput);

        ext.searchtext = '';
        system.assertEquals(2,ext.accList.size());
        showResults(ext.accList, 'D');

        ext.minInput = '0';
        ext.maxInput = '10000';
        showResults(ext.accList, 'E');
        system.assertEquals(1,ext.accList.size());

        ext.minInput = '10000';
        ext.maxInput = '100000000';
        showResults(ext.accList, 'F');
        system.assertEquals(1,ext.accList.size());

    }


}
