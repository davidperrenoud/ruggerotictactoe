pragma solidity 0.4.24;

contract TicTacToe {
	// State

	// Address of playerOne, creator of the board
  address public playerOne;

	// Address of playerTwo
  address public playerTwo;

	// Board turn: 
	// - Turn = false -> PlayerOne's turn
	// - Turn = true -> PlayerTwo's turn
  bool public turn;

  // Tic Tac Toe Board:
	// - Board[x][y] = 1 -> PlayerOne's move
	// - Board[x][y] = 2 -> PlayerTwo's move
  uint[3][3] public board;


	// Events

	// Event launched when a player plays
  event Played(address indexed player, uint row, uint column);


	// Modifiers

	// Ensure that msg.sender is either playerOne or playerTwo
  modifier onlyRegistered {
    require(isPlayerRegistered(msg.sender));
    _;
  }

	// Ensure that is msg.sender's turn
  modifier whenPlayerTurn {
    if (msg.sender == playerOne) {
      require(turn == false);
    } else {
      require(turn == true);
    }
    _;
  }

	// Ensure that board[row][column] is free
  modifier onlyFreeSquare(uint row, uint column) {
    require(board[row][column] == 0);
    _;
  }


	// Functions

	// TicTacToe contract constructor
  constructor(address _playerTwo) public {
    playerOne = msg.sender;
    playerTwo = _playerTwo;
    turn = true;
  }

	// Check if _player is either playerOne or playerTwo
  function isPlayerRegistered (address _player) public view returns (bool) {
    return playerOne == _player || playerTwo == _player;
  }
	
	// Play function to let the players play and set 1 or 2 on the board
  function play (uint row, uint column) public onlyRegistered whenPlayerTurn onlyFreeSquare(row, column) {
    if (msg.sender == playerOne) {
      board[row][column] = 1;
	  } else {
      board[row][column] = 2;
	  }

    turn = !turn;

    emit Played(msg.sender, row, column);
  }
}
