public class AccountRecords {
    public static void getRecords()
    {
        List<Account> accrec = [select id, Name from Account limit 10];
       	for(Account acc : accrec)
        {
            System.debug('\n' +acc);
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}