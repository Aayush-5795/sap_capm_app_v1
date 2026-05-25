using CatalogService as service from '../../srv/CatalogService';
annotate service.EmployeeSet with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : nameFirst,
            Label : 'First Name',
        },
        {
            $Type : 'UI.DataField',
            Value : nameLast,
            Label : 'Last Name',
        },
        {
            $Type : 'UI.DataField',
            Value : phoneNumber,
            Label : 'Phone Number',
        },
        {
            $Type : 'UI.DataField',
            Value : email,
            Label : 'Email',
        },
        {
            $Type : 'UI.DataField',
            Value : bankName,
            Label : 'Bank Name',
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code,
        },
    ],
    UI.SelectionFields : [
        nameFirst,
        nameLast,
        bankName,
    ],
    UI.HeaderInfo:{
        TypeName: 'Employee Details',
        TypeNamePlural: 'Employee Details',

        Title: {Value : nameFirst},
        Description: {Value: bankName},
        ImageUrl: 'https://media.licdn.com/dms/image/v2/D4D03AQFkn0Q2qLtfhg/profile-displayphoto-scale_400_400/B4DZ3Xm78QGcAg-/0/1777438802888?e=1781136000&v=beta&t=h_JNpVkI_5l7_mx19PlqpoMkqNsYpZMzohtxNR32-qA'
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
                    Target : '@UI.EmploymentInformation',
                    Label : 'Employment Information'
                }
            ],
        },


        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Employee Information',
            ID : 'EmployeeInformation',
            Target : '@UI.Identification',
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
        }
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : accountNumber,
            Label : 'Account Number',
        },
        {
            $Type : 'UI.DataField',
            Value : bankName,
            Label : 'Bank Name',
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code,
            Label : 'Currency Code',
        },
        {
            $Type : 'UI.DataField',
            Value : email,
            Label : 'Email',
        },
        {
            $Type : 'UI.DataField',
            Value : language,
            Label : 'Language',
        },
        {
            $Type : 'UI.DataField',
            Value : loginName,
            Label : 'Login Name',
        },
        {
            $Type : 'UI.DataField',
            Value : nameFirst,
        },
        {
            $Type : 'UI.DataField',
            Value : nameInitials,
            Label : 'nameInitials',
        },
        {
            $Type : 'UI.DataField',
            Value : nameLast,
        },
        {
            $Type : 'UI.DataField',
            Value : nameMiddle,
            Label : 'Middle Name',
        },
        {
            $Type : 'UI.DataField',
            Value : phoneNumber,
            Label : 'Phone Number',
        },
        {
            $Type : 'UI.DataField',
            Value : salaryAmount,
            Label : 'Salary Amount',
        },
        {
            $Type : 'UI.DataField',
            Value : sex,
            Label : 'Sex',
        },
    ],
);

annotate service.EmployeeSet with {
    nameFirst @Common.Label : 'First Name'
};

annotate service.EmployeeSet with {
    nameLast @Common.Label : 'Last Name'
};





