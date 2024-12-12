Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C62F20E339
	for <llvm@lists.linux.dev>; Thu, 12 Dec 2024 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733996423; cv=none; b=Oem9tYllWiqW7JCKyZK1cwB08RrsQNZQERvpgDa2joeuEQGC+0EjZ0BEduPZ/Ah5nI/UWnucLFnz2VuHcN5VZg/kCSM5vR43cvw6P+gAYY3dkSh5x4YbT6BimJT1BWzQboP4jyMUEww0OTzVTrmHMvTeTlADebyUIteZQQ8XaNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733996423; c=relaxed/simple;
	bh=3kiLqS4a1/6z0Lpovs5bIGDCbmoYe7j4L+HDdPQbnTY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=qMx6gO3+qoPPf0NWaDoMCCf5BxImmC6wAorUPOEHVPfgSyVbkl02wAZXrgbh24pnA4u06ic1n5QROG1Aq37uw0SyoCR9r/wmK8Dx6XrDZRoGH54GUUx6BcpdPEi4pbXHjJzTkHZ8A9aH/n0Sw7hZeo46Jil0Ij0SBSNIU14+s6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-148-GZbhliAwNcyb9MfIhgZ_9w-1; Thu, 12 Dec 2024 09:40:18 +0000
X-MC-Unique: GZbhliAwNcyb9MfIhgZ_9w-1
X-Mimecast-MFC-AGG-ID: GZbhliAwNcyb9MfIhgZ_9w
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 12 Dec
 2024 09:39:22 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 12 Dec 2024 09:39:22 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'kernel test robot' <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Andrew
 Morton" <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: RE: [linux-next:master 1948/2656] block/blk-iocost.c:1101:11: error:
 call to __compiletime_assert_560 declared with 'error' attribute: clamp() low
 limit 1 greater than high limit active
Thread-Topic: [linux-next:master 1948/2656] block/blk-iocost.c:1101:11: error:
 call to __compiletime_assert_560 declared with 'error' attribute: clamp() low
 limit 1 greater than high limit active
Thread-Index: AQHbTAO/LBVwjhcfokKsJgYDzh99oLLiWwfQ
Date: Thu, 12 Dec 2024 09:39:22 +0000
Message-ID: <b7cc2610a9cf40a8a33a203f533ad9a5@AcuMS.aculab.com>
References: <202412120322.3GfVe3vF-lkp@intel.com>
In-Reply-To: <202412120322.3GfVe3vF-lkp@intel.com>
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
X-Mimecast-MFC-PROC-ID: ZNBrhdbeudrCTckVSC7wGw-z71wY03w9iH8ZuReab3k_1733996417
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: kernel test robot
> Sent: 11 December 2024 19:35
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   91e71d606356e50f238d7a87aacdee4abc427f07
> commit: 212fe932ee57ec4a0f41bdc42b58c64fe3062147 [1948/2656] minmax.h: si=
mplify the variants of
> clamp()
> config: s390-defconfig (https://download.01.org/0day-ci/archive/20241212/=
202412120322.3GfVe3vF-
> lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project
> 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20241212/202412120322.3GfVe3vF-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412120322.3GfVe3vF-lkp=
@intel.com/
>=20
...
> b0853ab4a238c54 Tejun Heo   2020-09-01  1084  static void __propagate_wei=
ghts(struct ioc_gq *iocg, u32
> active, u32 inuse,
> b0853ab4a238c54 Tejun Heo   2020-09-01  1085  =09=09=09=09bool save, stru=
ct ioc_now *now)
> 7caa47151ab2e64 Tejun Heo   2019-08-28  1086  {
> 7caa47151ab2e64 Tejun Heo   2019-08-28  1087  =09struct ioc *ioc =3D iocg=
->ioc;
> 7caa47151ab2e64 Tejun Heo   2019-08-28  1088  =09int lvl;
> 7caa47151ab2e64 Tejun Heo   2019-08-28  1089
> 7caa47151ab2e64 Tejun Heo   2019-08-28  1090  =09lockdep_assert_held(&ioc=
->lock);
> 7caa47151ab2e64 Tejun Heo   2019-08-28  1091
> e9f4eee9a0023ba Tejun Heo   2021-05-11  1092  =09/*
> e9f4eee9a0023ba Tejun Heo   2021-05-11  1093  =09 * For an active leaf no=
de, its inuse shouldn't be
> zero or exceed
> e9f4eee9a0023ba Tejun Heo   2021-05-11  1094  =09 * @active. An active in=
ternal node's inuse is solely
> determined by the
> e9f4eee9a0023ba Tejun Heo   2021-05-11  1095  =09 * inuse to active ratio=
 of its children regardless of
> @inuse.
> e9f4eee9a0023ba Tejun Heo   2021-05-11  1096  =09 */
> e9f4eee9a0023ba Tejun Heo   2021-05-11  1097  =09if (list_empty(&iocg->ac=
tive_list) && iocg-
> >child_active_sum) {
> e9f4eee9a0023ba Tejun Heo   2021-05-11  1098  =09=09inuse =3D DIV64_U64_R=
OUND_UP(active * iocg-
> >child_inuse_sum,
> e9f4eee9a0023ba Tejun Heo   2021-05-11  1099  =09=09=09=09=09   iocg->chi=
ld_active_sum);
> e9f4eee9a0023ba Tejun Heo   2021-05-11  1100  =09} else {
> db84a72af6be422 Tejun Heo   2020-09-01 @1101  =09=09inuse =3D clamp_t(u32=
, inuse, 1, active);
...

Duplicate - there is an inlined call that passes 'active =3D 0'.
IIRC the clamp() is there to avoid a divide by zero later.
The code is buggy and I think there is a fix pending.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

