Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379553C1D
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 11:19:55 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-233-kVB3OncmNJKG28V9ejQR5Q-1; Tue, 15 Aug 2023 12:19:52 +0100
X-MC-Unique: kVB3OncmNJKG28V9ejQR5Q-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 15 Aug
 2023 12:19:50 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 15 Aug 2023 12:19:50 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'minyard@acm.org'" <minyard@acm.org>, Justin Stitt
	<justinstitt@google.com>
CC: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	"openipmi-developer@lists.sourceforge.net"
	<openipmi-developer@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>, kernel test robot
	<lkp@intel.com>
Subject: RE: [PATCH] ipmi_si: fix -Wvoid-pointer-to-enum-cast warning
Thread-Topic: [PATCH] ipmi_si: fix -Wvoid-pointer-to-enum-cast warning
Thread-Index: AQHZzJJNhRgyMCyjXUCyrlg7Yy+IN6/rOtTw
Date: Tue, 15 Aug 2023 11:19:50 +0000
Message-ID: <85c5e4b69dbb4ff699f380b373f6440f@AcuMS.aculab.com>
References: <20230809-cbl-1902-v1-1-92def12d1dea@google.com>
 <ZNaZrHEs5FP7Lf8A@mail.minyard.net>
In-Reply-To: <ZNaZrHEs5FP7Lf8A@mail.minyard.net>
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

From: Corey Minyard
> Sent: 11 August 2023 21:27
...
> >  =09memset(&io, 0, sizeof(io));
> > -=09io.si_type=09=3D (enum si_type) match->data;
> > +=09io.si_type=09=3D (unsigned long) match->data;
>=20
> Wouldn't you want to use intptr_t or uintptr_t?

The kernel tends to use 'long' for the same reason
it doesn't use uint8_t.

Although I'm sure the correct/better fix is to either add variants
of the match/lookup functions that return (say) unsigned long
or change all the drivers to allocate a structure that contains
the required value.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

