trigger AccessApprovalTrigger on Access__c (after update) {
    for (Access__c task : Trigger.new)
            {
                if (task.Approval_Status__c == 'APPROVED')
                {
                    String RecordId = task.Id;
                    RequestAccessApexClass.upgradeAccess(RecordId);
                }
        }

}