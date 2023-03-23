pragma solidity >=0.4.25 <0.9.0;

contract Voting {
    // Our predefined values for vote status listed as enums
    enum VoteStatus { Registered, Voted }
    // Save enum VoteStatus in variable status
    VoteStatus private status;

    // This creates a mapping of address type to bool type, which can be used to keep track of whether an address has already registered to vote or not
    mapping(address => bool) registeredVoters;

    // Event to launch when vote is registered
    event LogNewRegistration(string description);

    // Event to launch when vote is casted
    event LogNewVote(string description);

    // This initializes our contract state (sets enum to Registered once the program starts)
    constructor() public {
        status = VoteStatus.Registered;
    }

    // Function to change vote status to Voted
    function Vote() public {
    require(registeredVoters[msg.sender], "You need to be registered to vote");
    require(status == VoteStatus.Registered, "Voting has already ended");
    status = VoteStatus.Voted;
    emit LogNewVote("Your vote has been casted");
    }


    // Function to get the status of the vote
    function getStatus(VoteStatus _status) internal pure returns (string memory) {
        // Check the current status and return the correct name
        if (VoteStatus.Registered == _status) return "Registered";
        if (VoteStatus.Voted == _status) return "Voted";
    }

    // Get status of your vote
    function Status() public view returns (string memory) {
        VoteStatus _status = status;
        return getStatus(_status);
    }

    // Function to register new voter
    function Register() public {
    require(status == VoteStatus.Registered, "Voting has already started");
    require(!registeredVoters[msg.sender], "You have already registered to vote");
    registeredVoters[msg.sender] = true;
    emit LogNewRegistration("You are now registered to vote");
}
}