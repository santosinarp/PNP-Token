const PNPToken = artifacts.require('PNP')

module.exports = function(deployer) {
  deployer.deploy(PNPToken)
}
