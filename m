Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78F2C80
	for <llvm@lists.linux.dev>; Wed, 10 Nov 2021 10:46:46 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-287-8KJ161tcNHKlvygMg9XwRA-1; Wed, 10 Nov 2021 10:46:44 +0000
X-MC-Unique: 8KJ161tcNHKlvygMg9XwRA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.24; Wed, 10 Nov 2021 10:46:42 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.024; Wed, 10 Nov 2021 10:46:42 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Peter Zijlstra' <peterz@infradead.org>, Nick Desaulniers
	<ndesaulniers@google.com>
CC: Bill Wendling <morbo@google.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
	"x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "dvyukov@google.com" <dvyukov@google.com>,
	"seanjc@google.com" <seanjc@google.com>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>
Subject: RE: [PATCH 20/22] x86,word-at-a-time: Remove .fixup usage
Thread-Topic: [PATCH 20/22] x86,word-at-a-time: Remove .fixup usage
Thread-Index: AQHX1a3cTPOCK2YRr06RWvi0T9RbLav8lJ+g
Date: Wed, 10 Nov 2021 10:46:42 +0000
Message-ID: <f6dbe42651e84278b44e44ed7d0ed74f@AcuMS.aculab.com>
References: <20211105171023.989862879@infradead.org>
 <20211105171821.654356149@infradead.org>
 <20211108164711.mr2cqdcvedin2lvx@treble>
 <YYlshkTmf5zdvf1Q@hirez.programming.kicks-ass.net>
 <CAKwvOdkFZ4PSN0GGmKMmoCrcp7_VVNjau_b0sNRm3MuqVi8yow@mail.gmail.com>
 <YYov8SVHk/ZpFsUn@hirez.programming.kicks-ass.net>
 <CAKwvOdn8yrRopXyfd299=SwZS9TAPfPj4apYgdCnzPb20knhbg@mail.gmail.com>
 <20211109210736.GV174703@worktop.programming.kicks-ass.net>
In-Reply-To: <20211109210736.GV174703@worktop.programming.kicks-ass.net>
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
> Sent: 09 November 2021 21:08
...
>=20
> GCC does the same, but I wanted to have the exception stuff be in
> .text.cold, but alas it doesn't do that. I left the attribute because of
> it's descriptive value.
>=20
> >  Unless the cold attribute is helping move
> > ("shrink-wrap"?) the basic block to a whole other section
> > (.text.cold.)?
>=20
> I was hoping it would do that, but it doesn't on gcc-11.

Wouldn't moving part of a function to .text.cold (or .text.unlikely)
generate the same problems with the stack backtrace code as the
.text.fixup section you are removing had??

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

