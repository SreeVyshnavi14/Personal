public class totalSalaryOfEmployees {
    public static void empRelatedToContacts()
    {
        List<Account> accWithEmp = [select id, Total_Salary__c,(select id, Employee_Salary__c from Employees__r) from Account ];
        if(!accWithEmp.isEmpty())
        {
            for(Account ac : accWithEmp)
            {
                Decimal totalSalary = 0;
                for(Employee__c em : ac.Employees__r)
                {
                    totalSalary= totalSalary + em.Employee_Salary__c;
                }
                ac.Total_Salary__c = totalSalary;
            }
        
        }
        if(!accWithEmp.isEmpty())
        {
            update accWithEmp;
        }
        
    }
    //test

}