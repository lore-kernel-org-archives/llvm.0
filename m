Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9880E33D3
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 13:10:36 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-319-oFCxxHf5MgGGf8WvpDCCEg-1; Sun, 20 Mar 2022 13:10:33 +0000
X-MC-Unique: oFCxxHf5MgGGf8WvpDCCEg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Sun, 20 Mar 2022 13:10:33 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Sun, 20 Mar 2022 13:10:33 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Ammar Faizi' <ammarfaizi2@gnuweeb.org>, Willy Tarreau <w@1wt.eu>
CC: "Paul E. McKenney" <paulmck@kernel.org>, Alviro Iskandar Setiawan
	<alviro.iskandar@gnuweeb.org>, Nugraha <richiisei@gmail.com>, "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>, GNU/Weeb Mailing List
	<gwml@vger.gnuweeb.org>, "x86@kernel.org" <x86@kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: RE: [RFC PATCH v1 3/6] tools/nolibc: i386: Implement syscall with 6
 arguments
Thread-Topic: [RFC PATCH v1 3/6] tools/nolibc: i386: Implement syscall with 6
 arguments
Thread-Index: AQHYPD5aHmXDAqFOcUemVcZ8MoFj5azIOuNw
Date: Sun, 20 Mar 2022 13:10:33 +0000
Message-ID: <2e335ac54db44f1d8496583d97f9dab0@AcuMS.aculab.com>
References: <20220320093750.159991-1-ammarfaizi2@gnuweeb.org>
 <20220320093750.159991-4-ammarfaizi2@gnuweeb.org>
In-Reply-To: <20220320093750.159991-4-ammarfaizi2@gnuweeb.org>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Ammar Faizi
> Sent: 20 March 2022 09:38
>=20
> In i386, the 6th argument of syscall goes in %ebp. However, both Clang
> and GCC cannot use %ebp in the clobber list and in the "r" constraint
> without using -fomit-frame-pointer. To make it always available for any
> kind of compilation, the below workaround is implemented.
>=20
> For clang (the Assembly statement can't clobber %ebp):
>   1) Save the %ebp value to the redzone area -4(%esp).

i386 doesn't have a redzone.
If you get a signal it will trash -4(%sp)

>   2) Load the 6-th argument from memory to %ebp.
>   3) Subtract the %esp by 4.
>   4) Do the syscall (int $0x80).
>   5) Pop %ebp.
>=20
> For GCC, fortunately it has a #pragma that can force a specific function
> to be compiled with -fomit-frame-pointer, so it can always use "r"(var)
> where `var` is a variable bound to %ebp.

How is that going to work for an inlined functon?

And using xchg is slow - it is always locked.

One possibility might be to do:
=09push arg6
=09push %ebp
=09mov  %ebp, 4(%sp)
=09int  0x80
=09pop  %ebp
=09add  %esp,4

Although I'm not sure you really want to allocate 4k pages
for every malloc() call.

Probably better to write a mini 'libc' that uses sbrk()
and a best fit scan of a linear free list.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

