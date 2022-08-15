public with sharing class AccountControllerExtension {

    private final Account acct;
    
    
    private String searchtext;
    public String getSearchtext() { return searchtext; }
    public void setSearchtext(String value) { 
        system.debug('text input = ' + value);
        searchtext = String.escapeSingleQuotes(value); 
    }
   

    private String maxInput;

    public String getMaxInput() { return maxInput; }
    public void setMaxInput(String value) { 
        if (value != null && value.isNumeric()) {
            maxInput = value;
        } else {
            maxInput = '999999999';
        }
     }



    private String minInput;
    public String getMinInput() { return minInput; }
    public void setMinInput(String value) {
        
        if( value != null && value.isNumeric() ) {
            minInput = value;
        } else {
            minInput = '0';
        }
    }

    public List<Account> accList { 
        get { getAccounts(); return accList;}
        set;
    }


    public AccountControllerExtension(ApexPages.StandardController controller) {
        
    }

    public void getAccounts() {

        system.debug('In get Accts');
        
        String st = '';
        if (searchtext != null) {
            st  = '\'%' + searchtext + '%\'';
        } else {
            st = '\'%' + '%\'';
        }

        if (minInput != null) {
            st = st + ' AND AnnualRevenue >= ' + minInput;
        }

        if (maxInput != null) {
            st = st + ' AND AnnualRevenue <=' + maxInput;
        }
        system.debug('ST = ' + st);
        String q = 'Select Name, Phone, Type, Industry, AnnualRevenue, Rating FROM Account where NAME LIKE ' + st;
        system.debug(q);

        accList = Database.query(q);
        
 
    }
}


