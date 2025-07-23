public class AccountDescription implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext db)
    {
        return Database.getQueryLocator([select id, Description from Account]);
    }
    public void execute(Database.BatchableContext db , List<Account> acc)
    {
        if(!acc.isEmpty())
        {
            for(Account ac : acc)
            {
                ac.Description = 'My Love';
            }
            update acc;
            
        }
    }
    public void finish(Database.BatchableContext db)
    {
        System.debug('hii sree');
    }

}