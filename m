Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737ACAD5F
	for <llvm@lists.linux.dev>; Wed, 26 Jul 2023 09:47:18 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-287-FtAxNye8P7C75kYr0fZLXg-1; Wed, 26 Jul 2023 10:47:15 +0100
X-MC-Unique: FtAxNye8P7C75kYr0fZLXg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 26 Jul
 2023 10:47:13 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 26 Jul 2023 10:47:13 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'kernel test robot' <lkp@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, 'Andy Shevchenko'
	<andriy.shevchenko@linux.intel.com>, 'Andrew Morton'
	<akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>
Subject: RE: [PATCH next 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Thread-Topic: [PATCH next 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Thread-Index: Adm+2wKUQ5yQ6t/FR+W/hRy2DuErJQAJNLOAAClusXA=
Date: Wed, 26 Jul 2023 09:47:13 +0000
Message-ID: <39d5316ee16e4588af888d68b77fdba1@AcuMS.aculab.com>
References: <454f967d452548a9acfa7c0a0872507e@AcuMS.aculab.com>
 <202307252241.W1SwUDKu-lkp@intel.com>
In-Reply-To: <202307252241.W1SwUDKu-lkp@intel.com>
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

From: kernel test robot
> Sent: 25 July 2023 15:57
...
> >> mm/mm_init.c:908:14: error: static_assert expression is not an integra=
l constant expression
>            start_pfn =3D clamp(start_pfn, zone_start_pfn, zone_end_pfn);
..
>    include/linux/minmax.h:45:17: note: expanded from macro '__clamp_once'
>                    static_assert(!__is_constexpr((lo) > (hi)) || (lo) <=
=3D (hi),

That didn't fail in my test builds.
The compiler I was using must short-circuited the ||.
I'll substitute a 'choose_expr' in v2.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

