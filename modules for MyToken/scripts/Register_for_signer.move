// test for register_token

script {

    use 0xf30590e882573d70bf5e4b958e8cd6ac::MyToken;

    fun main(account: &signer) {
        
        MyToken::register_token(account);
    }
}
