Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBF12C9F
	for <llvm@lists.linux.dev>; Wed, 27 Oct 2021 21:31:25 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-42-fJv27yKXNbKPUHGUB7ziEQ-1; Wed, 27 Oct 2021 22:31:22 +0100
X-MC-Unique: fJv27yKXNbKPUHGUB7ziEQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.24; Wed, 27 Oct 2021 22:31:21 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.024; Wed, 27 Oct 2021 22:31:21 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mark Rutland' <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen
	<samitolvanen@google.com>, "x86@kernel.org" <x86@kernel.org>, Kees Cook
	<keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "ardb@kernel.org"
	<ardb@kernel.org>
Subject: RE: [PATCH v5 00/15] x86: Add support for Clang CFI
Thread-Topic: [PATCH v5 00/15] x86: Add support for Clang CFI
Thread-Index: AQHXyyrmFu1L74SRSES6mpaoExEoXavmyV5Q///5hQCAAJkGUA==
Date: Wed, 27 Oct 2021 21:31:21 +0000
Message-ID: <fba51c06395740afa325bbccc8bff170@AcuMS.aculab.com>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211026201622.GG174703@worktop.programming.kicks-ass.net>
 <20211027120515.GC54628@C02TD0UTHF1T.local>
 <456321a9fc5245408fc0d2798e497fe0@AcuMS.aculab.com>
 <20211027131730.GF54628@C02TD0UTHF1T.local>
In-Reply-To: <20211027131730.GF54628@C02TD0UTHF1T.local>
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

From: Mark Rutland
> Sent: 27 October 2021 14:18
>=20
> On Wed, Oct 27, 2021 at 12:55:17PM +0000, David Laight wrote:
> > From: Mark Rutland
> > > Sent: 27 October 2021 13:05
> > ...
> > > Taking a step back, it'd be nicer if we didn't have the jump-table sh=
im
> > > at all, and had some SW landing pad (e.g. a NOP with some magic bytes=
)
> > > in the callees that the caller could check for. Then function pointer=
s
> > > would remain callable in call cases, and we could explcitly add landi=
ng
> > > pads to asm to protect those. I *think* that's what the grsecurity fo=
lk
> > > do, but I could be mistaken.
> >
> > It doesn't need to be a 'landing pad'.
> > The 'magic value' could be at 'label - 8'.
>=20
> Sure; I'd intended to mean the general case of something at some fixed
> offset from the entrypoint, either before or after, potentially but not
> necessarily inline in the executed instruction stream.

What you really want is to be able to read the value using the I-cache
so as not to pollute the D-cache with code bytes and to avoid having
both an I-cache and D-cache miss at the same time for the same memory.

Even if the I-cache read took an extra clock (or two) I suspect it
would be an overall gain.
This is also true for code that uses pc-relative instructions to
read constants - common in arm-64.

Not sure any hardware lets you do that though :-(

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

