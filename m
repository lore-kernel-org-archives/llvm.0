Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE652CA4
	for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 21:04:59 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-59-nuyPE1CKP524lUkKQActcw-1; Tue, 26 Oct 2021 22:04:56 +0100
X-MC-Unique: nuyPE1CKP524lUkKQActcw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.24; Tue, 26 Oct 2021 22:04:55 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.024; Tue, 26 Oct 2021 22:04:55 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nathan Chancellor' <nathan@kernel.org>
CC: 'Nick Terrell' <terrelln@fb.com>, Nick Desaulniers
	<ndesaulniers@google.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: RE: [PATCH] lib: zstd: Add cast to silence clang's
 -Wbitwise-instead-of-logical
Thread-Topic: [PATCH] lib: zstd: Add cast to silence clang's
 -Wbitwise-instead-of-logical
Thread-Index: AQHXxrmhV8EJKX2UAE+nrwZQNmVvMavkgQmAgACZsECAACtYgIAAgqUg
Date: Tue, 26 Oct 2021 21:04:55 +0000
Message-ID: <2c664a6701b44050a0525b541292ce21@AcuMS.aculab.com>
References: <20211021202353.2356400-1-nathan@kernel.org>
 <4245BD7A-4B12-4172-B4EE-76A99C717C7D@fb.com>
 <d21e97487ba3447194538ccf0e88ead9@AcuMS.aculab.com>
 <YXgKgQMHQzvQgE4J@archlinux-ax161>
In-Reply-To: <YXgKgQMHQzvQgE4J@archlinux-ax161>
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

From: Nathan Chancellor
> Sent: 26 October 2021 15:03
...
> > Isn't enabling that warning completely stupid?
> > The casts required to silence it could easily cause more problems
> > - by hiding more important bugs. And seriously affect code readability.
>=20
> Which warning?
>=20
> -Wbitwise-instead-of-logical is included in clang's -Wall and I do not
> think it should be disabled; this is the first instance of the warning
> that has been silenced with a cast.

I'm not sure about that one.
I have a feeling it will generate false positives for carefully optimised
code more often that it finds anything where 'short circuiting' will
be a real gain.
Especially for values with are known to be either 0 or 1.
=20
> -Wshorten-64-to-32 will never be enabled for Linux but zstd is a
> separate project that can be built for a variety of operating systems so
> that has to be considered when developing changes for the kernel because
> the kernel changes need to go upstream eventually if they touch core
> zstd code, otherwise they will just get blown away on the next import.
> Specifically, this warning was enabled on iOS:
> https://github.com/facebook/zstd/pull/2062

That one...
If you are going to enable it, then you need a static inline function
to convert u64 to u32, not a C cast.

I'm sure that it won't be long before the compiler writes start an
'open season' on casts.
They really are more dangerous than the warnings they are trying to remove.

> > ...c
> > > > index 05570ed5f8be..5105e59ac04a 100644
> > > > --- a/lib/zstd/decompress/huf_decompress.c
> > > > +++ b/lib/zstd/decompress/huf_decompress.c
> > > > @@ -886,7 +886,7 @@ HUF_decompress4X2_usingDTable_internal_body(
> > > >             HUF_DECODE_SYMBOLX2_0(op2, &bitD2);
> > > >             HUF_DECODE_SYMBOLX2_0(op3, &bitD3);
> > > >             HUF_DECODE_SYMBOLX2_0(op4, &bitD4);
> > > > -            endSignal =3D (U32)LIKELY(
> > > > +            endSignal =3D (U32)LIKELY((U32)
> > > >                         (BIT_reloadDStreamFast(&bitD1) =3D=3D BIT_D=
Stream_unfinished)
> > > >                       & (BIT_reloadDStreamFast(&bitD2) =3D=3D BIT_D=
Stream_unfinished)
> > > >                       & (BIT_reloadDStreamFast(&bitD3) =3D=3D BIT_D=
Stream_unfinished)
> >
> > Isn't that the same as:
> > =09((BIT_reload() & BIT_reload() & BIT_reload()) =3D=3D BIT_DStream_unf=
inished)
> > which will generate much better code.
> > Especially on cpu without 'seteq' instructions.
>=20
> I don't think so. Feel free to double check my math.
>=20
> BIT_reloadDStreamFast() can return either BIT_DStream_unfinished (0) or
> BIT_DStream_overflow (3)....

Ah, I'd assumed that BIT_DStream_unfinished was non-zero.
So you actually want:
=09endSignal =3D !(BIT() | BIT() | BIT());

Just kill the CaMeLs and unnecessary constants.
Then the code becomes succint, easier to read/check etc.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

