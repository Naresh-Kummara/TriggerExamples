public class ApexTestClass1 {
    public static void insertOpprtunityBefore(List<Opportunity> oppList)
    {
        for(Opportunity opp:oppList)
        {
            if(opp.amount!=null && opp.amount>=10000 &&opp.amount<=50000)
            {
                opp.description='Hot Opportunity';
            }
        }
    }

}