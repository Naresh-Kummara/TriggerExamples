trigger TriggersTask1 on Opportunity (before insert,after insert) {
    if(Trigger.isInsert)
    {
        if(Trigger.isAfter||Trigger.isBefore)
        {
            TriggerTask1.updateCaseData(Trigger.New);
           // TriggerTask1.updateAnnualRevenue(Trigger.New);
        }
    }

}