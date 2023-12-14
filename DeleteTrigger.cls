public class DeleteTrigger{
    public static void deleteBefore(List<Market_Name__c> mList)
    {
        for(Market_Name__c ma:mList)
        {
            if(ma.Ristrictions__c==True)
            {
                ma.addError('you canot delete this record');
            }
        }
    }
    //public static void deleteAfter()
 

}