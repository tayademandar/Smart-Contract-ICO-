pragma solidity ^0.8.0

contract pretzel_ico {

    //total number of Pretzels available for sale
    uint public max_pretzels = 1000000000;

    //USD to Pretzel conversion rate
    uint public usd_to_pretzels = 1000;

    //total no. of Pretzels that have been bought by the investors
    uint public total_pretzels_bought = 0;

    //mapping from the investors address to its equity in Pretzels and USD
    mapping(address => uint) equity_pretzels;
    mapping(address => uint) equity_usd; 

    //checking if an investor can buy pretzels
    modifier can_buy_pretzels(uint usd_invested) {
        require(usd_invested * usd_to_pretzels + total_pretzels_bought <= max_pretzels);
        _;
    }

    //equity in Pretzels of an investor
    function equity_in_pretzels(address investor) external constant returns(uint) {
        return equity_pretzels[investor];

    }

    //equity in USD of an  investor
    function equity_in_pretzels(address investor) external constant returns(uint) {
        return equity_usd[investor];

    }

    //buying pretzels
    function buy_pretzels(address investor, uint usd_invested) external 
    can_buy_pretzels(usd_invested){
        uint pretzels_bought = usd_invested * usd_to_pretzels;
        equity_pretzels[innvestor] += pretzels_bought;
        equity_usd[investor] = equity_pretzels[investor]/1000;
        total_pretzels_bought += pretzels_bought;
    }

    //sellling pretzels
    function sell_pretzels(address investor, uint pretzels_sold) external {
        equity_pretzels[innvestor] -= pretzels_sold;
        equity_usd[investor] = equity_pretzels[investor]/1000;
        total_pretzels_bought -= pretzels_sold;
    }
    
}