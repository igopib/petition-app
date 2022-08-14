// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";

contract PetitionContract {
    uint256 petitionId;

    // Creates a complex data structure to store pertition info
    struct Petition {
        string petitionName;
        string petitionDescripton;
        uint256 signerCount;
        uint256 id;
    }

    struct signer {
        bool signed;
    }

    // Petition details are saved in a dynamic array.
    Petition[] public petitions;

    // Mapping to track number of signers per Petition
    mapping(uint256 => Petition) public idToPetition;

    mapping(address => signer) signers;

    /*
     * Function takes name and description as parameters and assigns it a petitionID.
     */
    function createPetition(
        string memory _petitionName,
        string memory _petitionDescription
    ) public {
        petitionId++;
        petitions.push(
            Petition(_petitionName, _petitionDescription, 0, petitionId)
        );
        idToPetition[petitionId];
    }

    /*
     * Function takes a uint as parameter and adds vote count to the attached petition.
     */

    function voteForPetition(uint256 _id) public {
        require(_id <= petitions.length, "Petition doesn't exist");
        petitions[_id].signerCount++;
    }

    function getPetition() external view returns (Petition[] memory) {
        return petitions;
    }
}
