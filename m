Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F9F2CA4
	for <llvm@lists.linux.dev>; Wed, 27 Oct 2021 10:03:00 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-212-F1zRjfSTOoCL9nIp_zwQSg-1; Wed, 27 Oct 2021 11:02:57 +0100
X-MC-Unique: F1zRjfSTOoCL9nIp_zwQSg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.24; Wed, 27 Oct 2021 11:02:56 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.024; Wed, 27 Oct 2021 11:02:56 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Peter Zijlstra' <peterz@infradead.org>, Sami Tolvanen
	<samitolvanen@google.com>
CC: "x86@kernel.org" <x86@kernel.org>, Kees Cook <keescook@chromium.org>,
	"Josh Poimboeuf" <jpoimboe@redhat.com>, Nathan Chancellor
	<nathan@kernel.org>, "Nick Desaulniers" <ndesaulniers@google.com>, Sedat
 Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "ardb@kernel.org"
	<ardb@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Subject: RE: [PATCH v5 00/15] x86: Add support for Clang CFI
Thread-Topic: [PATCH v5 00/15] x86: Add support for Clang CFI
Thread-Index: AQHXyqbRFu1L74SRSES6mpaoExEoXavmm4bQ
Date: Wed, 27 Oct 2021 10:02:56 +0000
Message-ID: <7ebed28b73bb48cd9b69e9097f0aa613@AcuMS.aculab.com>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211026201622.GG174703@worktop.programming.kicks-ass.net>
In-Reply-To: <20211026201622.GG174703@worktop.programming.kicks-ass.net>
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

From: Peter Zijlstra
> Sent: 26 October 2021 21:16
>=20
> On Wed, Oct 13, 2021 at 11:16:43AM -0700, Sami Tolvanen wrote:
> > This series adds support for Clang's Control-Flow Integrity (CFI)
> > checking to x86_64. With CFI, the compiler injects a runtime
> > check before each indirect function call to ensure the target is
> > a valid function with the correct static type. This restricts
> > possible call targets and makes it more difficult for an attacker
> > to exploit bugs that allow the modification of stored function
> > pointers. For more details, see:
> >
> >   https://clang.llvm.org/docs/ControlFlowIntegrity.html
>=20
> So, if I understand this right, the compiler emits, for every function
> two things: 1) the actual funcion and 2) a jump-table entry.
>=20
> Then, every time the address of a function is taken, 2) is given instead
> of the expected 1), right?
>=20
> But how does this work with things like static_call(), which we give a
> function address (now a jump-table entry) and use that to write direct
> call instructions?
>=20
> Should not this jump-table thingy get converted to an actual function
> address somewhere around arch_static_call_transform() ? This also seems
> relevant for arm64 (which already has CLANG_CFI supported) given:
>=20
>   https://lkml.kernel.org/r/20211025122102.46089-3-frederic@kernel.org
>=20
> Or am I still not understanding this CFI thing?

From what I remember the compiler adds code prior to every jump indirect
to check that the function address is in the list of valid functions
(with a suitable prototype - or some similar check).

So it add a run-time search to every indirect call.

What would be more sensible would be a hidden extra parameter that is
a hash of the prototype that is saved just before the entry point.
Then the caller and called function could both check.
That is still a moderate cost for an indirect call.

Anything that can write asm can get around any check - it just gets a
bit harder.
But overwritten function pointers would be detected - which I assume
is the main threat.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

