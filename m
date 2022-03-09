Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4805387
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 22:44:56 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-130-G6u0jimIM3m0Ki7tttEtKA-1; Wed, 09 Mar 2022 22:44:53 +0000
X-MC-Unique: G6u0jimIM3m0Ki7tttEtKA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 22:44:52 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Wed, 9 Mar 2022 22:44:52 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Kees Cook' <keescook@chromium.org>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>
CC: Nathan Chancellor <nathan@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Yanteng Si <siyanteng01@gmail.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Mark Rutland <mark.rutland@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: RE: [PATCH v2] MIPS: Only use current_stack_pointer on GCC
Thread-Topic: [PATCH v2] MIPS: Only use current_stack_pointer on GCC
Thread-Index: AQHYNAKAxELb5a0xTk6/Jkk5NqddlKy3pmYg
Date: Wed, 9 Mar 2022 22:44:52 +0000
Message-ID: <3bb36a2d506a4b73aefec200d1edd40a@AcuMS.aculab.com>
References: <20220309220939.392227-1-keescook@chromium.org>
In-Reply-To: <20220309220939.392227-1-keescook@chromium.org>
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

From: Kees Cook
> Sent: 09 March 2022 22:10
>=20
> Unfortunately, Clang did not have support for "sp" as a global register
> definition, and was crashing after the addition of current_stack_pointer.
> This has been fixed in Clang 15, but earlier Clang versions need to
                               ^^ 14
> avoid this code, so add a versioned test and revert back to the
> open-coded asm instances. Fixes Clang build error:
>=20
> fatal error: error in backend: Invalid register name global variable

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

