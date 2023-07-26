Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB59BA4A
	for <llvm@lists.linux.dev>; Wed, 26 Jul 2023 10:25:15 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-239-fUxCrhtrNSu2GVWHIquJNA-1; Wed, 26 Jul 2023 11:25:13 +0100
X-MC-Unique: fUxCrhtrNSu2GVWHIquJNA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 26 Jul
 2023 11:25:11 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 26 Jul 2023 11:25:11 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Marc Zyngier' <maz@kernel.org>
CC: 'kernel test robot' <lkp@intel.com>, "'linux-kernel@vger.kernel.org'"
	<linux-kernel@vger.kernel.org>, 'Andy Shevchenko'
	<andriy.shevchenko@linux.intel.com>, 'Andrew Morton'
	<akpm@linux-foundation.org>, "'Matthew Wilcox (Oracle)'"
	<willy@infradead.org>, 'Christoph Hellwig' <hch@infradead.org>, "'Jason A.
 Donenfeld'" <Jason@zx2c4.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Rob Herring <robh@kernel.org>
Subject: RE: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Thread-Topic: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Thread-Index: Adm+7j8pPhAgcq+TRICTXJcSfHQLRAAL9FKAACBy3mD///zQgP//50cA
Date: Wed, 26 Jul 2023 10:25:11 +0000
Message-ID: <4d15014d6b4f434786d50bc4f2199f23@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
	<202307260256.nzImScXA-lkp@intel.com>
	<6bed42e871e74e898b400a404ec6d142@AcuMS.aculab.com>
 <86ila7t30q.wl-maz@kernel.org>
In-Reply-To: <86ila7t30q.wl-maz@kernel.org>
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

From: Marc Zyngier
> Sent: 26 July 2023 10:51
>=20
> On Wed, 26 Jul 2023 10:19:48 +0100,
> David Laight <David.Laight@ACULAB.COM> wrote:
> >
> > > From: kernel test robot <lkp@intel.com>
> > > Sent: 25 July 2023 19:33
> > ...
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> drivers/irqchip/irq-mips-cpu.c:288:1: error: call to undeclared fu=
nction '__typecheck'; ISO C99
> and
> > > later do not support implicit function declarations [-Wimplicit-funct=
ion-declaration]
> > >      288 | IRQCHIP_DECLARE(cpu_intc, "mti,cpu-interrupt-controller", =
mips_cpu_irq_of_init);
> > >          | ^
> > >    include/linux/irqchip.h:37:38: note: expanded from macro 'IRQCHIP_=
DECLARE'
> > >       37 |         OF_DECLARE_2(irqchip, name, compat, typecheck_irq_=
init_cb(fn))
> > >          |                                             ^
> > >    include/linux/irqchip.h:24:3: note: expanded from macro 'typecheck=
_irq_init_cb'
> > >       24 |         (__typecheck(typecheck_irq_init_cb, &fn) ? fn : fn=
)
> > >          |          ^
> > > >> drivers/irqchip/irq-mips-cpu.c:288:1: error: initializer element i=
s not a compile-time constant
> > >      288 | IRQCHIP_DECLARE(cpu_intc, "mti,cpu-interrupt-controller", =
mips_cpu_irq_of_init);
> > >          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
> > >    include/linux/irqchip.h:37:2: note: expanded from macro 'IRQCHIP_D=
ECLARE'
> > >       37 |         OF_DECLARE_2(irqchip, name, compat, typecheck_irq_=
init_cb(fn))
> > >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
> > >    include/linux/of.h:1493:3: note: expanded from macro 'OF_DECLARE_2=
'
> > >     1493 |                 _OF_DECLARE(table, name, compat, fn, of_in=
it_fn_2)
> > >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
> > >    include/linux/of.h:1481:2: note: expanded from macro '_OF_DECLARE'
> > >     1481 |         _OF_DECLARE_STUB(table, name, compat, fn, fn_type)
> > >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    include/linux/of.h:1470:16: note: expanded from macro '_OF_DECLARE=
_STUB'
> > >     1470 |                      .data =3D (fn =3D=3D (fn_type)NULL) ?=
 fn : fn }
> > >          |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
> >
> > It looks like irqchip.h is using __typecheck() which is really
> > an internal part of the implementation of min() and max().
> > The patched version doesn't use it - hence the build fail.
> > I can re-instate it, but this all looks wrong to me.
>=20
> Please see f1985002839a ("irqchip: Provide stronger type checking for
> IRQCHIP_MATCH/IRQCHIP_DECLARE") for the rationale.
>=20
> Given that this has uncovered a number of bugs, I'm not letting this
> go without an equivalent replacement.
..
>=20
> They are used in different contexts. See IRQCHIP_MATCH().

Ah, I was seeing the error in the expansion of IRQCHIP_DECLARE()
which is doing the type check twice.
It can just pass 'fn'.

The cast NULL check does work.
So IRQCHIP_MATCH() can use the simpler 'fn =3D (fn_type)NULL ? fn : fn' tes=
t
that _OF_DECLARE_STUB() uses.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

