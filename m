Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E276C13AF0
	for <llvm@lists.linux.dev>; Sun, 30 Jul 2023 17:33:06 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-20-JTYvPV41NHyB98w7zWF5lQ-1; Sun, 30 Jul 2023 18:33:03 +0100
X-MC-Unique: JTYvPV41NHyB98w7zWF5lQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 30 Jul
 2023 18:33:02 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 30 Jul 2023 18:33:02 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nathan Chancellor' <nathan@kernel.org>
CC: 'kernel test robot' <lkp@intel.com>, "'linux-kernel@vger.kernel.org'"
	<linux-kernel@vger.kernel.org>, 'Andy Shevchenko'
	<andriy.shevchenko@linux.intel.com>, 'Andrew Morton'
	<akpm@linux-foundation.org>, "'Matthew Wilcox (Oracle)'"
	<willy@infradead.org>, 'Christoph Hellwig' <hch@infradead.org>, "'Jason A.
 Donenfeld'" <Jason@zx2c4.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [PATCH next v2 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Thread-Topic: [PATCH next v2 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Thread-Index: AdnBYvtzc0TxoNEXQSCZpxDmi1SwuQAVSEEAAE9F14AAAp/MAAAC081w
Date: Sun, 30 Jul 2023 17:33:02 +0000
Message-ID: <671b7f5aafdd41c5bc1f6b935dba23c0@AcuMS.aculab.com>
References: <bf92800b0c5445e2b2ca8c88e1f5e90f@AcuMS.aculab.com>
 <202307290943.ODVeyeK6-lkp@intel.com>
 <b6bbfa2e3c374714a6f0f7d5a3cb9afa@AcuMS.aculab.com>
 <20230730170546.GA1666163@dev-arch.thelio-3990X>
In-Reply-To: <20230730170546.GA1666163@dev-arch.thelio-3990X>
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

From: Nathan Chancellor
> Sent: 30 July 2023 18:06
>=20
> On Sun, Jul 30, 2023 at 02:55:50PM +0000, David Laight wrote:
> > From: kernel test robot
> > > Sent: 29 July 2023 03:01
> > >
> > > kernel test robot noticed the following build errors:
> > >
> > ...)
> > > compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.=
git
> > > 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> > > reproduce: (https://download.01.org/0day-ci/archive/20230729/20230729=
0943.ODVeyeK6-
> > > lkp@intel.com/reproduce)
> > >
> > ...
> > > >> mm/percpu.c:3102:10: error: static assertion expression is not an =
integral constant expression
> > >                    base =3D min(ptr, base);
> > >                           ^~~~~~~~~~~~~~
> > ...                    ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    include/linux/minmax.h:23:2: note: expanded from macro '__types_ok=
'
> > >            (is_signed_type(typeof(x)) =3D=3D is_signed_type(typeof(y)=
))
> > >            ^
> > ...
> > >    mm/percpu.c:3102:10: note: cast that performs the conversions of a=
 reinterpret_cast is not allowed
> > > in a constant expression
> >
> > That is a C++ error that seems to have crept into C.
> > The relevant definition is:
> >
> > #define is_signed_type(type)  (((type)(-1)) < (type)1)
> >
> > This seems to have been fixed in clang 16.0.0.
>=20
> Indeed, it looks like
>=20
> https://github.com/llvm/llvm-project/commit/a181de452df311d7647329120d05f=
4eb9c158b6c
>=20
> fixed this as a result of the discussion at
>=20
> https://github.com/llvm/llvm-project/issues/57687, which certainly makes
> sense.

Annoyingly it also isn't a 'proper' compile time constant for pointers.
Wrapping as:
=09__builtin_choose_expr(__is_constexpr(is_signed(type(x)), is_signed_type(=
x), 0)
fixes it for old clang and is also needed to fix the >=3D 0 check in 5/5.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

