public class insertContacts {
	/*public static void insertThreeContacts()
    {
        List<Account> acc = [select Id , name from Account limit 1];
        List<Contact> conList = new List<Contact>();
        System.debug('Contact'+ acc);
        for(Integer i = 0 ; i<=3 ; i++)
        {
            Contact con = new Contact(
                FirstName = 'contact',
                LastName = 'Number'+i ,
                AccountId = acc[0].Id
            );
            conList.add(con);
        }
        insert conList;
    }*/
    public static void deleteClosedLOstOpportunities()
    {
        List<Opportunity> closedLostOpps = [select id from Opportunity where StageName = 'Closed Lost'];
        delete closedLostOpps;
    }
    /*public static Decimal oppTotalAmountAcc()
    {
        Decimal amount;
        Account acc = [select id from Account limit 1];
        List<Opportunity> opps = [select id,Amount from Opportunity where AccountId = :acc.id];
        for(Opportunity opp : opps)
        {
            amount+=opp.Amount ;
        }
        System.debug('oppamount'+amount);
        return amount;
    }*/
      public static void queryInsideLoopExample() {
        List<Account> accList = [SELECT Id, Name FROM Account LIMIT 5];
        
        for (Account acc : accList) {
            List<Contact> conList = [SELECT Id, LastName FROM Contact WHERE AccountId = :acc.Id];
            System.debug('Contacts for ' + acc.Name + ' => ' + conList.size());
        }
    }
}