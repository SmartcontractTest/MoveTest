script {
	
//###### this scripts can work after "account" get some Token( < value), which means that a pro-transaction need to be run before this scripts

    use 0xf30590e882573d70bf5e4b958e8cd6ac::MyToken;

    fun main(account: &signer, addr:address, value:u64) {
 
		
        let v1 = MyToken::address_value(addr) + MyToken::signer_value(account); 


        MyToken::deposit_to_address2(account,addr,value); // fuzzer : any function 
	
        
        let v2 = MyToken::address_value(addr) + MyToken::signer_value(account); 

        assert (v1 == v2 , v2); //test oracle

    }

}
