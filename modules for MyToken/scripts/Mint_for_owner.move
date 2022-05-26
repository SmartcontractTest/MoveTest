// test for mint_token

script {

    use 0xf30590e882573d70bf5e4b958e8cd6ac::MyToken;
    use 0x1::Signer;

    fun main(account: &signer, amount:u64) {
        
        let token = MyToken::mint(account,amount);
    	MyToken::addtoken_to_address((Signer::address_of(account)),token); 
    }
}
