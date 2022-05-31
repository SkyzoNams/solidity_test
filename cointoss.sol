// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./chainlink.sol";

contract CoinToss {
    uint256 public consecutiveWins = 0;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 public varOne;

    function flip(bool _guess) public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        require(lastHash == blockValue);

        lastHash = blockValue;
        uint256 coinFlip = getRandom();
        bool side = coinFlip == 1 ? true : false;

        if (side == _guess) {
            consecutiveWins++;
            return true;
        } else {
            consecutiveWins = 0;
            return false;
        }
    }

    function getRandom() public  returns (uint256) {
        RandomGenerator generator;
        varOne = uint256(generator.getRandomNumber());
        return varOne;
    }
}
