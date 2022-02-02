Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F66A2F27
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 17:33:46 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-323-us7zwamHOdWdmxWFxLqp3g-1; Wed, 02 Feb 2022 17:33:43 +0000
X-MC-Unique: us7zwamHOdWdmxWFxLqp3g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Wed, 2 Feb 2022 17:33:41 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Wed, 2 Feb 2022 17:33:41 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nathan Chancellor' <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Linux Kbuild mailing list
	<linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, # 3.4.x <stable@vger.kernel.org>
Subject: RE: [PATCH] Makefile.extrawarn: Move -Wunaligned-access to W=2
Thread-Topic: [PATCH] Makefile.extrawarn: Move -Wunaligned-access to W=2
Thread-Index: AQHYGFGY4JJHFpiR10CgrsiGoyzAbayAgz3Q
Date: Wed, 2 Feb 2022 17:33:41 +0000
Message-ID: <df408e1fb00442e296f63b8ebd66f9a5@AcuMS.aculab.com>
References: <20220201232229.2992968-1-nathan@kernel.org>
 <CAK8P3a2Y8nQ55sycxbpfN=71BNO9wuEDt=Q24ELS_u_WNRpqZw@mail.gmail.com>
 <YfqwnMB2lLXOuahI@dev-arch.archlinux-ax161>
In-Reply-To: <YfqwnMB2lLXOuahI@dev-arch.archlinux-ax161>
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
> Sent: 02 February 2022 16:26
>=20
> On Wed, Feb 02, 2022 at 09:12:06AM +0100, Arnd Bergmann wrote:
> > On Wed, Feb 2, 2022 at 12:22 AM Nathan Chancellor <nathan@kernel.org> w=
rote:
> > >
> > > -Wunaligned-access is a new warning in clang that is default enabled =
for
> > > arm and arm64 under certain circumstances within the clang frontend (=
see
> > > LLVM commit below). Under an ARCH=3Darm allmodconfig, there are
> > > 1284 total/70 unique instances of this warning (most of the instances
> > > are in header files), which is quite noisy.
> > >
...
> >
> > The warning seems important enough to be considered for W=3D1 on 32-bit=
 arm,
> > otherwise the chances of anyone actually fixing drivers for it is
> > relatively slim.
>=20
> Fair point, I suppose barely anyone does W=3D2 builds, which means we
> might as well just disable it outright.
>=20
> > Can you point post the (sufficiently trimmed) output that you get with
> > the warning
> > enabled in an allmodconfig build?
>=20
> Sure thing.
>=20
> Here is the trimmed version:
>=20
> https://gist.github.com/nathanchance/6682e6894f75790059ca698c29212c71/raw=
/f63d54819afeb96f3ea0bb055096
> 849912ac0185/trimmed.log

So it is objecting to non-packed structures inside packed ones?
I'd have thought it ought to generate the byte accesses for code
that references the data from the __packed structure.

Recent gcc enable -Waddress-of-packed-member (even on x86) if you
take the address to pass somewhere else.
That is a bug if CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dn.

...
> There is this comment above this block in the source code:
>=20
>     // Assume pre-ARMv6 doesn't support unaligned accesses.
>     //
>     // ARMv6 may or may not support unaligned accesses depending on the
>     // SCTLR.U bit, which is architecture-specific. We assume ARMv6
>     // Darwin and NetBSD targets support unaligned accesses, and others d=
on't.
>     //
>     // ARMv7 always has SCTLR.U set to 1, but it has a new SCTLR.A bit
>     // which raises an alignment fault on unaligned accesses. Linux
>     // defaults this bit to 0 and handles it as a system-wide (not
>     // per-process) setting. It is therefore safe to assume that ARMv7+
>     // Linux targets support unaligned accesses. The same goes for NaCl
>     // and Windows.
>     //
>     // The above behavior is consistent with GCC.
>=20
> I notice that CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS under certain
> conditions in arch/arm/Kconfig. Would it be worth telling clang that it
> can generate unaligned accesses in those cases via -munaligned-access or
> would that be too expensive? If we did, these warnings would be
> eliminated for configs with CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy,
> then it could be safely placed under W=3D1.

You really never want to do the fixup.
Except, maybe, if it is a very common path and the data is actually aligned
99.9999% of the time.

Part of the problem is almost certainly structures that are marked __packed
but can never be misaligned.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

