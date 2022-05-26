script {

// resourses will be moved after be used unless be refered"&"	
// this scripts need the signer holds some Token


    use 0xf30590e882573d70bf5e4b958e8cd6ac::MyToken;

    fun main(account: &signer,value:u64) {

        let v1:u64 = (MyToken::signer_value(account));
	
	let check = MyToken::withdraw_from_signer(account,value);
	let val = MyToken::token_value2(check); //resourses will be moved, lead to a decrease of signer's Token
	assert (value == val, value);
	
	
	let v2:u64 = (MyToken::signer_value(account));
        assert (v1== v2, v2); //test oracle
    }

}
