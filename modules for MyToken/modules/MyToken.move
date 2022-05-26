address 0x9defcda0d93d42873b521f29e7f46dbc{
module MyToken{
	use 0x1::Signer;
	resource struct Token {
		value: u64,
	}

    const THIS : address = 0x9defcda0d93d42873b521f29e7f46dbc;
    
    public fun register_token(account: &signer) {    
        assert(!exists<Token>(Signer::address_of(account)),111);
        move_to(account, Token {value: 0});       
    }

    public fun signer_value(account: &signer): u64  acquires Token  {  // amount of Token in account
        borrow_global<Token>(Signer::address_of(account)).value
    }

    public fun address_value(account: address): u64  acquires Token  {  // amount of Token in account
        borrow_global<Token>(account).value
    }

    public fun own_value(): u64  acquires Token  {  // amount of Token in THIS
        borrow_global<Token>(THIS).value
    }

    public fun token_value(check:&Token): u64  { // amount of check
        check.value
    }

    //  ############## 03 wrong way to get the value of a resource
    public fun token_value2(check: Token):u64 {
        let Token{value:value} = check;
        value

    }
    //########05 wrong modify of resources,be careful use to modify resourses
    public fun reduce_value(account: address,amount:u64) acquires Token {
	    borrow_global_mut<Token>(account).value = borrow_global_mut<Token>(account).value - amount;
    }
    
    //########05 wrong modify of resources,be careful use to modify resourses
    public fun add_value(account: address,amount:u64) acquires Token{
	    borrow_global_mut<Token>(account).value = borrow_global_mut<Token>(account).value + amount;

    }

    public fun mint(account: &signer, amount: u64): Token {
        let token_address = THIS;
        assert(Signer::address_of(account) == token_address, 111);
        do_mint(amount)
    }
   
    public fun mint2(account: address, amount: u64): Token {
        
        assert(account == THIS, 111);
        do_mint(amount)
    }
    
    fun do_mint(amount: u64): Token{  

        Token{ value: amount }
    }

    //#######02 wrong function visibility
    public fun do_mint2(amount: u64): Token{

        Token{ value: amount }
    }


    // withdraw some Token from the signer's account, if without "public"
    public fun withdraw_from_signer(account: &signer,amount: u64) :Token  acquires Token {
        assert(signer_value(account)>=amount, 003);    
        borrow_global_mut<Token>(Signer::address_of(account)).value = borrow_global_mut<Token>(Signer::address_of(account)).value - amount;
        Token{value:amount}
         
    }

    //#######02 wrong function visibility
    fun withdraw_from_signer2(account: &signer, amount: u64) :Token  acquires Token {    
        borrow_global_mut<Token>(Signer::address_of(account)).value = borrow_global_mut<Token>(Signer::address_of(account)).value - amount;
        Token{value:amount}
             
    }

    // add the check to signer's accout
    public fun addtoken_to_signer(account: &signer, check:Token) acquires Token {
        let Token { value } = check;
       
        borrow_global_mut<Token>(Signer::address_of(account)).value = borrow_global_mut<Token>(Signer::address_of(account)).value + value;

    }

    // ########1   wrong use of "signer"
    public fun withdraw_from_address(account: address, amount: u64) :Token  acquires Token {
        assert(address_value(account)>=amount, 003);
        borrow_global_mut<Token>(account).value = borrow_global_mut<Token>(account).value - amount;
        Token{value:amount}
             
    }

    // add the check to account's accout
    public fun addtoken_to_address(account:address, check:Token) acquires Token {
        let Token { value } = check;
        borrow_global_mut<Token>(account).value = borrow_global_mut<Token>(account).value + value;

    }

 

   //########04 wrong arithmetic 
   public fun deposit_to_address(account: &signer, to: address, amount: u64) acquires Token {
        assert(signer_value(account)>=amount, 003);  
        borrow_global_mut<Token>(Signer::address_of(account)).value = borrow_global_mut<Token>(Signer::address_of(account)).value - amount;
        
        borrow_global_mut<Token>(to).value = borrow_global_mut<Token>(to).value - amount;       
             
   }





}
}






