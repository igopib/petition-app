const { ethers } = require("hardhat");

async function main() {
  const petitionContractFactory = await ethers.getContractFactory(
    "PetitionContract"
  );
  console.log("Deploying Contract ...");

  const Petition = await petitionContractFactory.deploy();

  await Petition.deployed();
  console.log(`Contract deployed to : ${Petition.address}`);

  const addPetition = await Petition.createPetition(
    "Petiton to make dogs national animal",
    "Please contribute if you want dogs as our national animal"
  );

  const addPetition2 = await Petition.createPetition(
    "Petiton to make cats national animal",
    "Please contribute if you want cats as our national animal"
  );

  const signPetiton = await Petition.voteForPetition("1");

  // checking if we created a petiton

  let getPetition = await Petition.getPetition();
  console.log(getPetition);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
