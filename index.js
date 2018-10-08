const ethers = require('ethers')

const json = require('./build/contracts/TicTacToe.json')
const provider = new ethers.providers.JsonRpcProvider('http://localhost:7545' )
const contract = new ethers.Contract(json.networks['5777'].address, json.abi, provider)

setInterval(async () => {
  console.log(
    (await contract.board(0, 0)).toString(),
    '|',
    (await contract.board(0, 1)).toString(),
    '|',
    (await contract.board(0, 2)).toString()
  )
  console.log('----------')
  console.log(
    (await contract.board(1, 0)).toString(),
    '|',
    (await contract.board(1, 1)).toString(),
    '|',
    (await contract.board(1, 2)).toString()
  )
  console.log('----------')
  console.log(
    (await contract.board(2, 0)).toString(),
    '|',
    (await contract.board(2, 1)).toString(),
    '|',
    (await contract.board(2, 2)).toString()
  )
  console.log('')
}, 3000)
