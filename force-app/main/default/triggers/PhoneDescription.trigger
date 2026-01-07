trigger PhoneDescription on Account (before update) {
    if(Trigger.IsBefore && (Trigger.IsUpdate))
    {
        for(Account newAcc: Trigger.new)
        {
            Account acold =Trigger.OldMap.get(newAcc.id);
            if(newAcc.phone != acold.phone)
            {
                newAcc.Description = 'phone was modified';
            }
            
            
        }
    }

}