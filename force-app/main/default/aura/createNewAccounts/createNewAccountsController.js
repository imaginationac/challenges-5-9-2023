({
    // Clear the form, update the table. On success show a toast message.
    // Add the created record ID to an array.
    // Then use the LDS to iterate through the the array and add the record details.(?)
    init : function (component, event, helper){
        component.set('v.mycolumns', [
            { label: 'Account Name', fieldName: 'Name', type: 'text'},
            { label: 'Created Date', fieldName: 'CreatedDate', type: 'date'}
        ]);
        helper.getData(component);
    },
    handleReset : function(component, event, helper){
        component.find('field').forEach(function(f){
            f.reset();
        });
    },
    handleSuccess : function(compoment, event, helper){
        compoment.find('notifLib').showToast({
            "title": "Account successfully created!",
            "message": event.getParam("message"),
            "variant": "info"
        });
        helper.getData(compoment);

    }

})
