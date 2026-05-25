using CatalogService as service from '../../srv/CatalogService';

annotate service.PurchaseOrderSet with @(

    UI.SelectionFields : [
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        GROSS_AMOUNT,
        OVERALL_STATUS
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT
        },
        {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS,
            Criticality: IconColor
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.boost',
            Label : 'boost',
            Inline : true,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.changeStatus',
            Label : 'Change Status',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.offerPrice',
            Label : '10% Offer',
        },
    ],
    UI.HeaderInfo:{
        TypeName: 'Purchase Order',
        TypeNamePlural: 'Purchase Orders',

        Title: {Value : PO_ID},
        Description: {Value: PARTNER_GUID.COMPANY_NAME},
        ImageUrl: 'https://s3.us-east-1.amazonaws.com/cdn.designcrowd.com/blog/120-cool-logos-for-a-fresh-new-look/colorful-company-logo-design-by-kreative-fingers-designcrowd.png'
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'General Information',
            Facets : [
                {
                    $Type: 'UI.ReferenceFacet',
                    Target : '@UI.Identification',
                    Label : 'General Information'
                },
                {
                    $Type: 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#Spiderman'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#Superman'
                },
                

            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Amount of Items',
            ID : 'AmountofItems',
            Target : '@UI.FieldGroup#AmountofItems',
        },
        {
                    $Type : 'UI.ReferenceFacet',
                    Label   : 'Items',
                    Target : 'Items/@UI.LineItem'
        },
        {
                    $Type : 'UI.ReferenceFacet',
                    Label   : 'Google',
                    Target : 'https://www.google.com'
                    
        },
        
    ],
    UI.Identification :[
        {
            $Type : 'UI.DataField',
            Value: PO_ID
        },
        {
            $Type : 'UI.DataField',
            Value: PARTNER_GUID_NODE_KEY
        },
        {
            $Type : 'UI.DataField',
            Value: NOTE
        }
    ],
    UI.FieldGroup #Spiderman: {
        Label: 'Pricing Details',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: GROSS_AMOUNT,
            },
            {
                $Type: 'UI.DataField',
                Value: NET_AMOUNT,
            },
            {
                $Type: 'UI.DataField',
                Value: TAX_AMOUNT,
            }
        ]
    },
    UI.FieldGroup #Superman: {
        Label : 'Additional Data',
        Data : [
            {
                $Type : 'UI.DataField',
                Value: CURRENCY_code,
            },
            {
                $Type: 'UI.DataField',
                Value: OVERALL_STATUS,
            },
            {
                $Type: 'UI.DataField',
                Value: LIFECYCLE_STATUS,
            }
        ]
    },
    UI.FieldGroup #AmountofItems : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
            },
        ],
    },
);

// Annotate for meaningful name 
annotate service.PurchaseOrderSet with{
    @(
        Common.Text: OverallStatus,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'statuscode',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : OVERALL_STATUS,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Status',
        },
        Common.ValueListWithFixedValues : true,
    )
    OVERALL_STATUS;
    @Common.Text: NOTE
    PO_ID;
    @Common.Text: PARTNER_GUID.COMPANY_NAME
    @ValueList.entity: service.BusinessPartnerSet
    PARTNER_GUID;
}

annotate service.PurchaseItemSet with @(
    UI.HeaderInfo:{
        TypeName: 'PO Item',
        TypeNamePlural: 'Purchase Order Items',

        Title: {Value : PO_ITEM_POS},
        Description: {Value: PRODUCT_GUID.DESCRIPTION},
    },
    UI.LineItem: [
        {
            $Type:'UI.DataField',
            Value: PO_ITEM_POS,
        },
        {
            $Type: 'UI.DataField',
            Value:  PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type: 'UI.DataField',
            Value:  GROSS_AMOUNT,
        }
        ,
        {
            $Type: 'UI.DataField',
            Value:  NET_AMOUNT,
        },
        {
            $Type: 'UI.DataField',
            Value: TAX_AMOUNT,
        }
    ],
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label: 'Item Details',
            Facets : [
                {
                    $Type: 'UI.ReferenceFacet',
                    Target : '@UI.Identification'
                }

            ],
        }
    ],
    UI.Identification :[
        {
            $Type : 'UI.DataField',
            Value: PO_ITEM_POS
        },
        {
            $Type : 'UI.DataField',
            Value: PRODUCT_GUID_NODE_KEY
        },
        {
            $Type : 'UI.DataField',
            Value:  GROSS_AMOUNT
        },
        {
            $Type : 'UI.DataField',
            Value:  NET_AMOUNT
        },
        {
            $Type : 'UI.DataField',
            Value: TAX_AMOUNT
        },
        {
            $Type : 'UI.DataField',
            Value: CURRENCY_code
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.CATEGORY,
            Label : 'CATEGORY',
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.CURRENCY_CODE,
            Label : 'CURRENCY_CODE',
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DEPTH,
            Label : 'DEPTH',
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DESCRIPTION,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DIM_UNIT,
            Label : 'DIM_UNIT',
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.HEIGHT,
            Label : 'HEIGHT',
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.MEASURE_UNIT,
            Label : 'MEASURE_UNIT',
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.PRICE,
            Label : 'PRICE',
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.texts.DESCRIPTION,
            Label : 'DESCRIPTION',
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.texts.locale,
            Label : 'locale',
        },
    ],
    UI.LineItem #AmountInformation : [
    ],
    
);

annotate service.PurchaseItemSet with {
    @Common.Text: PRODUCT_GUID.DESCRIPTION
    @ValueList.entity : service.ProductSet
    PRODUCT_GUID;
};


@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(
    UI.Identification: [
        {
            $Type : 'UI.DataField',
            Value: COMPANY_NAME
        }
    ]
);

@cds.odata.valuelist
annotate service.ProductSet with @(
    UI.Identification: [
        {
            $Type : 'UI.DataField',
            Value: DESCRIPTION
        }
    ]
);
annotate service.statuscode with {
    code @Common.Text : value
};

