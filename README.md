# Ceasar Cipher #
Simple implementation of a [Caesar cipher](https://en.wikipedia.org/wiki/Caesar_cipher)

I made a few assumptions with my implementation

* Only encrypt/decrypt alpha characters a-z and A-Z.  Numbers, whitespace and punctuation 
are not changed
*  Preserve upper and lower case letters


I think a better implementation would be to encrypt all visible ASCII characters, that way it might be a little harder to guess the shift character, especially with common, short words like "a", "I", or "the".  Of course a Caesar cipher is pretty easy to crack with either a brute force or a statistics based approach

## Running Tests ##
To run the tests, run rake

```
rake
```
