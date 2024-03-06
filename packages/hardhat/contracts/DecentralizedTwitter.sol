// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importing OpenZeppelin contract for ERC20 standard
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DecentralizedTwitter {
    struct Tweet {
        address author;
        string content;
        uint256 likes;
        uint256 retweets;
    }

    mapping(uint256 => Tweet) public tweets;
    uint256 public tweetCount;

    event TweetCreated(uint256 indexed id, address author);

    function createTweet(string memory _content) external {
        tweetCount += 1;
        tweets[tweetCount] = Tweet(msg.sender, _content, 0, 0);
        emit TweetCreated(tweetCount, msg.sender);
    }

    function likeTweet(uint256 _tweetId) external {
        require(_tweetId > 0 && _tweetId <= tweetCount, "Invalid Tweet ID");
        tweets[_tweetId].likes += 1;
    }

    function retweet(uint256 _tweetId) external {
        require(_tweetId > 0 && _tweetId <= tweetCount, "Invalid Tweet ID");
        tweets[_tweetId].retweets += 1;
    }
}