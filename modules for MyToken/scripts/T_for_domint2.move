script {
	
	//only the owner can mint Token	
	//this scripts can work after the account register Token, which means a pro-transaction is needed before this transaction

    use 0x1::Signer;
    use 0xf30590e882573d70bf5e4b958e8cd6ac::MyToken;


    fun main(account: &signer,value:u64) {
		 	
	let v1 = MyToken::signer_value(account);	
	
        let token = MyToken::do_mint2(value); // fuzzer : any function 
        MyToken::addtoken_to_address((Signer::address_of(account)),token); // fuzzer : any function 

        let v2 = MyToken::signer_value(account);
	assert(v1 == v2,777); //test oracle

    }

}


