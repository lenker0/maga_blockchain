const Voting = artifacts.require('Voting');

contract('Voting', function(accounts) {

  let instance;

  before(async function() {
    instance = await Voting.deployed();
  });

  it('should initialize with Registered status', async function() {
    const status = await instance.Status();
    assert.equal(status, 'Registered');
  });

  it('should allow a voter to register', async function() {
    const result = await instance.Register({from: accounts[0]});
    assert.equal(result.logs[0].event, 'LogNewRegistration');
  });

  it('should not allow a voter to register twice', async function() {
    try {
      await instance.Register({from: accounts[0]});
      assert.fail('The transaction should have thrown an error');
    } catch(error) {
      assert.include(error.message, 'revert', 'The error message should contain "revert"');
    }
  });
  
  it('should not allow a voter to vote twice', async function() {
    try {
      await instance.Vote({from: accounts[1]});
      assert.fail('The transaction should have thrown an error');
    } catch(error) {
      assert.include(error.message, 'revert', 'The error message should contain "revert"');
    }
  });

});
