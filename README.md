bash-salmon
============

An implementation of the [Magic Signature](http://salmon-protocol.googlecode.com/svn/trunk/draft-panzer-magicsig-01.html) in bash using OpenSSL.

Copyright (C) 2010 Laurent Eschenauer <laurent@eschenauer.be>

Why ?
-----

While implementing the [Salmon Protocol](http://www.salmon-protocol.org/) in my [node-ostatus](https://github.com/eschnou/node-ostatus) library,
I realised I needed a quick way to generate signatures in order to debug interoperability of my implementation.

It is possible to perform the signature part of salmon entirely in command line, using simple shell tools and
OpenSSL. Being able to peak at each stage is handy for debugging.

Usage
------

    ./sign.sh input.txt key.pem

    me.data:		Tm90IHJlYWxseSBBdG9t
    me.alg:		RSA-SHA256
    me.data_type:	application/atom+xml
    me.encoding:	base64url
    M:			Tm90IHJlYWxseSBBdG9t.YXBwbGljYXRpb24vYXRvbSt4bWw.YmFzZTY0dXJs.UlNBLVNIQTI1Ng
    Sha256:		6a53649f53d8b284f73387a4a68b56f527525d6a83d8f908d0c7a30a2d992f1d
    Key:		RSA.2YmPB7i6h_eJbkXWV8qaEfcI-V0JwQcj73ncG6KJx1TFPYxooYcMKGgK0IDV_em2KV4WEJu9HuedUyJkSDWHwSj18UvNfZ6Pue2uc6vFDPO8mN0q56PShGagdg4XdOxCXlUv2iAp7-malaJaIlLHyjhvxoVtD3itkXe2cgCed7c.AQAB
    Signature:		zy9v1tHjOhjDJWyuIIaBZyqNW9ly0QQr43r5dmuaFe3C1zIz6dp947B5Wh-KZ8LlqM_E_-pCQbx9Ule3DqiPtpyYz5ZDEDkS0SgLSRwg0z2zd0utXFeRfAotTRObQNuf3AeKzPlhM0ehvhP_X0zK1bvxBP9kw78hFeuX9GWeM1U

You can easily generate a key per encoded in a PEM file with Openssl:

    openssl genrsa -out key.pem 1024

License
-------

The MIT License

Copyright (c) 2010 Laurent Eschenauer <laurent@eschenauer.be>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
