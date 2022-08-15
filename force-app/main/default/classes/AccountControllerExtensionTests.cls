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

        ext.setSearchtext('bob');
        showResults(ext.accList, 'B');
        system.assertEquals(1,ext.accList.size());

        ext.setSearchtext('bob\'AND');
        showResults(ext.accList, 'C');
        system.assertEquals('bob\\\'AND', ext.getSearchtext());

        ext.setMinInput('23n');
        system.assertEquals('0',ext.getMinInput());

        ext.setMaxInput('99j');
        system.assertEquals('999999999',ext.getMaxInput());

        ext.setSearchtext('');
        system.assertEquals(2,ext.accList.size());
        showResults(ext.accList, 'D');

        ext.setMinInput('0');
        ext.setMaxInput('10000');
        showResults(ext.accList, 'E');
        system.assertEquals(1,ext.accList.size());

        ext.setMinInput('10000');
        ext.setMaxInput('100000000');
        showResults(ext.accList, 'F');
        system.assertEquals(1,ext.accList.size());

    }


}
