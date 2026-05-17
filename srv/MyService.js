const cds = require('@sap/cds')

module.exports = class MyService extends cds.ApplicationService { init() {

  this.on ('aayush', async (req) => {
    console.log('On aayush', req.data)
    let myName = req.data.name;
    return `Welcome Aayush to your first Service !!! ${myName}`;
  })

  return super.init()
}}
