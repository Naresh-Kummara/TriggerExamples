trigger TriggersTask2 on Account (before insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            TriggerTask2.beforeInsertingEmail(Trigger.New);
        }
    }
    

}