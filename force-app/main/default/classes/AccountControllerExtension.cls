public with sharing class AccountControllerExtension {


    public String searchText {
        get;
        set {
            searchtext = String.escapeSingleQuotes(value);             
        }
    }
    

    public String maxInput {
        get;
        set {
            if (value != null && value.isNumeric()) {
                maxInput = value;
            } else {
                maxInput = '999999999';
            }
        }
    }

    public String minInput {
        get;
        set {
            if( value != null && value.isNumeric() ) {
                minInput = value;
            } else {
                minInput = '0';
            }
    
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


