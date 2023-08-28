Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B3A12B72
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 16:44:23 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-215-qSw7yUTFPVuaBuk6-hwwRA-1; Mon, 28 Aug 2023 17:43:07 +0100
X-MC-Unique: qSw7yUTFPVuaBuk6-hwwRA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 28 Aug
 2023 17:43:10 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 28 Aug 2023 17:43:10 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'llvm@lists.linux.dev'" <llvm@lists.linux.dev>
Subject: clang mis-compiles "x"[2]
Thread-Topic: clang mis-compiles "x"[2]
Thread-Index: AdnZzqP9RGI2T+X1SOmkqpTL8BmHZg==
Date: Mon, 28 Aug 2023 16:43:10 +0000
Message-ID: <916414bcf1c349e8a3dc78cb208bf30f@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Clang mis-compiles:

int foo(void) { return "a"[2]; }

to be just a 'ret' instruction.

While clearly non-sensical returning the input value of %rax
doesn't make any sense.

gcc generates a real string and then returns the byte after
the '\0' - which is (sort of) what the code asks for.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

