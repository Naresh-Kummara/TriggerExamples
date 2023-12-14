trigger RequestAccessForApproval on Request_Access__c (after Update) 
{
    if (Trigger.isUpdate)
        {
            for (Request_Access__c task : Trigger.new)
            {
                if (task.Approval_Status__c == 'APPROVED')
                {
                    String RecordId = task.Id;
                    System.debug('Trigger RecordId : ' + RecordId);
                    RequestAccessApexClass.updateToRequestedProfile(RecordId);
                }
        }
    }

}