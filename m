Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E8F1BD03B
	for <llvm@lists.linux.dev>; Thu, 28 Nov 2024 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732809198; cv=none; b=bM9yi55Fpu/g9Zo11ffIB8VGvCVdsGI7AVZImikenftKpKevZpH8v22RqFi5GijCMpDyULq9Ta2oazRBbJHTVYgoqeGY7KR749J9Skqx5WbsQjtuhkKflHgNWwot0pwRF0GvP+8oFI3HNCT7hhZXvgrPZBsjabP1W875sBGbRmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732809198; c=relaxed/simple;
	bh=O9/0G4w7vfZ8wd45kOEAe5fDEBovVWRsYAdK/7h34Jg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=D3BPKaY4ju6MrUh7x0tvayfbmQonxo85SW/mftfMaP5Xo11YblGDX8un74oOGw+4QWYerEy0y68oJ4C5Fxu4ZQkG50YQQd0AXo3EwqRnL5i4BBqP28yl2GcH3l0i5YB9LyHfBCk7CJc9JB528No6rh/KHRM+tMerVR1URaAoqck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-304-SDpqaHlOPaSaQN7EJINjig-1; Thu, 28 Nov 2024 15:53:07 +0000
X-MC-Unique: SDpqaHlOPaSaQN7EJINjig-1
X-Mimecast-MFC-AGG-ID: SDpqaHlOPaSaQN7EJINjig
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 28 Nov
 2024 15:52:53 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 28 Nov 2024 15:52:53 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'kernel test robot' <lkp@intel.com>, Linus Torvalds
	<torvalds@linux-foundation.org>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>, 'Arnd Bergmann' <arnd@kernel.org>, "'Jens
 Axboe'" <axboe@kernel.dk>, 'Matthew Wilcox' <willy@infradead.org>,
	"'Christoph Hellwig'" <hch@infradead.org>, 'Andrew Morton'
	<akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>, 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
	'Dan Carpenter' <dan.carpenter@linaro.org>, "'Jason A . Donenfeld'"
	<Jason@zx2c4.com>, "'pedro.falcato@gmail.com'" <pedro.falcato@gmail.com>,
	'Mateusz Guzik' <mjguzik@gmail.com>, 'Lorenzo Stoakes'
	<lorenzo.stoakes@oracle.com>
Subject: RE: [PATCH next 6/7] minmax.h: Simplify the variants of clamp()
Thread-Topic: [PATCH next 6/7] minmax.h: Simplify the variants of clamp()
Thread-Index: Ads57ipn63eWKuUFSOOk3Sda6NOThQHuL4sAAAGWieA=
Date: Thu, 28 Nov 2024 15:52:53 +0000
Message-ID: <27c5b7e0a0a2492191d5f3716cd9b473@AcuMS.aculab.com>
References: <8f69f4deac014f558bab186444bac2e8@AcuMS.aculab.com>
 <202411282222.oF0B4110-lkp@intel.com>
In-Reply-To: <202411282222.oF0B4110-lkp@intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pc0UvWgHBqLgT3FpM82npLfYi71vEJHJ1Iw6HhQ2acs_1732809186
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: kernel test robot
> Sent: 28 November 2024 15:05
>=20
> Hi David,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on next-20241121]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minma=
x-h-Add-whitespace-around-
> operators-and-after-commas/20241121-152617
> base:   next-20241121
> patch link:    https://lore.kernel.org/r/8f69f4deac014f558bab186444bac2e8=
%40AcuMS.aculab.com
> patch subject: [PATCH next 6/7] minmax.h: Simplify the variants of clamp(=
)
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/202411=
28/202411282222.oF0B4110-
> lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project
> 592c0fe55f6d9a811028b5f3507be91458ab2713)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20241128/202411282222.oF0B4110-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411282222.oF0B4110-lkp=
@intel.com/
...
> vim +414 drivers/iio/magnetometer/yamaha-yas530.c
...
> 65f79b50103067 Jakob Hauser  2022-08-13  407  =09if (yas5xx->version =3D=
=3D YAS537_VERSION_1) {
> 65f79b50103067 Jakob Hauser  2022-08-13  408  =09=09for (i =3D 0; i < 3; =
i++)
> 65f79b50103067 Jakob Hauser  2022-08-13  409  =09=09=09s[i] =3D xy1y2[i] =
- BIT(13);
> 65f79b50103067 Jakob Hauser  2022-08-13  410  =09=09h[0] =3D (c->k *   (1=
28 * s[0] + c->a2 * s[1] + c-> >a3 * s[2])) / BIT(13);
> 65f79b50103067 Jakob Hauser  2022-08-13  411  =09=09h[1] =3D (c->k * (c->=
a4 * s[0] + c->a5 * s[1] + c-> >a6 * s[2])) / BIT(13);
> 65f79b50103067 Jakob Hauser  2022-08-13  412  =09=09h[2] =3D (c->k * (c->=
a7 * s[0] + c->a8 * s[1] + c-> >a9 * s[2])) / BIT(13);
> 65f79b50103067 Jakob Hauser  2022-08-13  413  =09=09for (i =3D 0; i < 3; =
i++) {
> 65f79b50103067 Jakob Hauser  2022-08-13 @414  =09=09=09clamp_val(h[i], -B=
IT(13), BIT(13) - 1);
> 65f79b50103067 Jakob Hauser  2022-08-13  415  =09=09=09xy1y2[i] =3D h[i] =
+ BIT(13);
> 65f79b50103067 Jakob Hauser  2022-08-13  416  =09=09}
> 65f79b50103067 Jakob Hauser  2022-08-13  417  =09}

Duplicate, very buggy code...
It very much needs BIT(13) to be signed.
And it shouldn't ignore the result of clamp()

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

