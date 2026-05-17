const cds = require('@sap/cds')

module.exports = class CatalogService extends cds.ApplicationService { init() {

  const { EmployeeSet, PurchaseOrderSet, BusinessPartnerSet, AddressSet, PurchaseItemSet, ProductSet } = cds.entities('CatalogService')

  this.before (['CREATE', 'UPDATE'], EmployeeSet, async (req) => {
    console.log('Before CREATE/UPDATE EmployeeSet', req.data)
    let salaryAmount = parseFloat(req.data.salaryAmount);
    if(salaryAmount > 10000000){
      req.error(500,'None of Employee should get 10M Salary amount');
    }
  })
  this.after ('READ', EmployeeSet, async (employeeSet, req) => {
    console.log('After READ EmployeeSet', employeeSet)
  })
  this.before (['CREATE', 'UPDATE'], PurchaseOrderSet, async (req) => {
    console.log('Before CREATE/UPDATE PurchaseOrderSet', req.data)
  })
  this.after ('READ', PurchaseOrderSet, async (purchaseOrderSet, req) => {
    console.log('After READ PurchaseOrderSet', purchaseOrderSet)
    for (let index = 0; index < purchaseOrderSet.length; index++) {
      const element = purchaseOrderSet[index];
      if(element.NOTE === 'NULL'  || element.NOTE === null || element.NOTE === undefined){
        element.NOTE = 'Not Found'
      }
      
    } 
  })
  this.before (['CREATE', 'UPDATE'], BusinessPartnerSet, async (req) => {
    console.log('Before CREATE/UPDATE BusinessPartnerSet', req.data)
  })
  this.after ('READ', BusinessPartnerSet, async (businessPartnerSet, req) => {
    console.log('After READ BusinessPartnerSet', businessPartnerSet)
  })
  this.before (['CREATE', 'UPDATE'], AddressSet, async (req) => {
    console.log('Before CREATE/UPDATE AddressSet', req.data)
  })
  this.after ('READ', AddressSet, async (addressSet, req) => {
    console.log('After READ AddressSet', addressSet)
  })
  this.before (['CREATE', 'UPDATE'], PurchaseItemSet, async (req) => {
    console.log('Before CREATE/UPDATE PurchaseItemSet', req.data)
  })
  this.after ('READ', PurchaseItemSet, async (purchaseItemSet, req) => {
    console.log('After READ PurchaseItemSet', purchaseItemSet)
  })
  this.before (['CREATE', 'UPDATE'], ProductSet, async (req) => {
    console.log('Before CREATE/UPDATE ProductSet', req.data)
  })
  this.after ('READ', ProductSet, async (productSet, req) => {
    console.log('After READ ProductSet', productSet)
  })


  this.on('getDefaultvalue', async (req,res) => {
    return { 
      OVERALL_STATUS: 'N',
      LIFECYCLE_STATUS: 'N'
     }
  });




  // Generic handler for the function

  this.on('getLargestOrder', async (req,res) => {
    try {
      const tx = cds.tx(req);
      const reply = await tx.read(PurchaseOrderSet).orderBy({
        'GROSS_AMOUNT': 'desc'
      }).limit(3);

      return reply;

    } catch (error) {
      req.error(500, "Some error occured : " + error.toString());
    }
  });


  //Implementation of action 
  this.on('boost', async(req)=>{
    try {
      const PrimaryKey = req.params[0];
      const tx = cds.tx(req);

      await tx.update(PurchaseOrderSet).with({
        GROSS_AMOUNT : { '+=' : 20000},
        NOTE : 'Boosted !!!'
      }).where(PrimaryKey);

      return await tx.read(PurchaseOrderSet).where(PrimaryKey);

    } catch (error) {
      
    }
  });

  return super.init()
}}
