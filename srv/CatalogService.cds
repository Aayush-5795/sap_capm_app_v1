
using { aayush.db.master, aayush.db.transaction } from '../db/datamodel';


service CatalogService @(path: 'CatalogService', requires: 'authenticated-user') {

    entity EmployeeSet @(restrict: [

                                {grant: ['READ'], to: 'Display',
                                where: 'bankName = $user.spiderman'},
                                { grant: ['WRITE','DELETE'], to: 'Edit'}
                            ])
                             as projection on master.employees;

    
    //  /@Capabilities : { Deletable : false }
    entity PurchaseOrderSet @(restrict: [
                                 { grant: [ 'READ' ], to: 'Display' },
                                 { grant: [ 'WRITE' , 'DELETE' ], to: 'Edit' }
                             ],
                                odata.draft.enabled: true,
                                Common.DefaultValuesFunction: 'getDefaultvalue') as projection on transaction.purchaseorder{
        *,
        case 
            when OVERALL_STATUS = 'P' then cast('Pending' as String(10))
            when OVERALL_STATUS = 'A' then cast('Approved' as String(10))
            when OVERALL_STATUS = 'X' then cast('Rejected' as String(10))
            when OVERALL_STATUS = 'D' then cast('Delivered' as String(10))
            else cast('Unknown' as String(10))
        end as OverallStatus: String(10),

        case 
            when OVERALL_STATUS = 'P' then cast(2 as Integer)
            when OVERALL_STATUS = 'A' then cast(3 as Integer)
            when OVERALL_STATUS = 'X' then cast(1 as Integer)
            when OVERALL_STATUS = 'D' then cast(3 as Integer)
            else cast(0 as Integer)
        end as IconColor: Integer
        
    }
    actions{

        @cds.odata.bindingparameter.name: '_aayush'
        @Common.SideEffects: {
            TargetProperties: ['_aayush/GROSS_AMOUNT','_aayush/OVERALL_STATUS']
        }

        action boost() returns PurchaseOrderSet
    };
    entity PurchaseItemSet as projection on transaction.poitems;
    @readonly
    entity statuscode as projection on master.statuscode;
    entity ProductSet as projection on master.product;
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;

    function getLargestOrder() returns array of PurchaseOrderSet;
    function getDefaultvalue() returns PurchaseOrderSet;
    

}