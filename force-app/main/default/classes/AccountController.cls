public with sharing class AccountController {
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> accounts = [SELECT Name, CreatedDate FROM Account ORDER BY CreatedDate DESC];
        return accounts;
    }
}