// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//key word. Similar a uma "class" em outras linguagens. Define quando o contrato começa.
contract SimpleStorage {
    //uint256 FavoriteNumber é o mesmo que a linha de baixo.

    //public na variavel a torna visivel para ser chamada e visualizada.
    uint256 favoriteNumber;

    //Pense no mapping como se fosse um dicionário.
    //mapping é um tipo. A linha abaixo então significa:
    //Crie uma variável chamada nameToFavoriteNumber que será publica e VINCULARÁ uma string(name) á um
    //um inteiro(favoriteNumber), e essa variável será do tipo mapping.
    mapping(string => uint256) public nameToFavoriteNumber;

    //Criar um struct é equivalente a criar um novo tipo. Como boolean, uint, string, e agora, people.
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    //uint256[] public favoriteNumbersList;
    People[] public people;

    //public na função serve para escrever algo na blockchain.
    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        //People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        //people.push(newPerson);

        //People memory newPerson = People(_favoriteNumber, _name);
        //people.push(newPerson);

        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
        //key(string) do mapping -> vinculado ao valor int do mapping.
        //Entramos com uma string e é retornado um número.
    }
}

//0xd9145CCE52D386f254917e481eB44e9943F39138 - Endereço do smart contract (do primeiro, que já foi apagado).
