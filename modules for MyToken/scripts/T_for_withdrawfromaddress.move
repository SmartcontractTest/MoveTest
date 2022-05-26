script {
	
//###### this scripts can work after "addr" get some Token( < value), which means that a pro-transaction need to be run before this scripts

    use 0xf30590e882573d70bf5e4b958e8cd6ac::MyToken;

    fun main(addr:address,value:u64) {
	// some one only can manage his own account's resourses 
	// assert that addr is not the msgsender's address 
		
        let v1 = MyToken::address_value(addr); 
	
	

        let token = MyToken::withdraw_from_address(account,value); // fuzzer : any function 
       
        MyToken::add_Token(addr,token);// fuzzer : any function 
	
        
        let v2 = MyToken::address_value(addr);

        assert (v1 == v2 , 777); //test oracle

    }

}
