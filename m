Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673C6314D37;
	Sun, 27 Sep 2026 21:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790544535; cv=none; b=VHuO//mZqS5jqqzVC9fzMC/hDyG1TXuvxKNPhdRGWW1kcvchXqyMT2audgmKV3+Cx+feFxQ7z97eLe6io45lkEfXpewgurnaNuGTKTAeoZAEYvhVL4qmFx+iFleFqdOuHmrJkBQzMaPOUZRDaU2rH6NKLLRFV6gXFY3S21hGwJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790544535; c=relaxed/simple;
	bh=9tobvYgVpos8yo/VK/ElrCs0kOmAr2UgfJNGL+rMJq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eTLlVzbzRrfk43tLctAAiVWYpYwMBYcL+qyPHVvlVGdLuXNuZaiXZ3uNs37vFznlu4CkISwurMib8pt5vf/SjbWYphfT7Jxhn7eb7xaQCkAT/6W9RQ3J5CnadUijgCK4Ed2uvjVkkOrEw32LC7UBYW8BD73IPH95SCBH9qw0yJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqxQZcez; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqxQZcez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790544533; x=1822080533;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9tobvYgVpos8yo/VK/ElrCs0kOmAr2UgfJNGL+rMJq0=;
  b=lqxQZcezqOLeI3IqqYX5IaejShj9ke7h7GgSeUgcVqOmhSZgRu5y5YVd
   QgHDqo7BI0CfBnhcRfZsHCgzpDlBFR2KVhSsarK5rpfJ9QNcDGP5yrco2
   JSTJMT57kU2Ig9qcTwTUNxRWB90eCbERRm21GLEObSHD4OA44/d7kCx+E
   HjYmSpDyAs4FLudMkb9+hBLFO2wbLVz7uawT2hyKqlFwheDMjzsJAx1F8
   1c57eg6ao7jgYBpdTiP84z+8RWy+yb+66Uqo4nV5mHPz4Lsd/cy4HPVx6
   paSq3cLINDRgFgjS0c60I5akqWcyV0CCODMFuu45uqRfwCmrfMMjmBTWd
   Q==;
X-CSE-ConnectionGUID: cVKrceeDTJOflrIG7f0ysQ==
X-CSE-MsgGUID: qporFcvqSg67VhAXgQvgwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="108736261"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="108736261"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 14:28:52 -0700
X-CSE-ConnectionGUID: FuveklkhQT64J/mvpTGKRg==
X-CSE-MsgGUID: x1oSQllSSae+0vfbi7mrWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="273028005"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Sep 2026 14:28:51 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAwQR-00000000NBg-3LFc;
	Sun, 27 Sep 2026 21:28:47 +0000
Date: Mon, 28 Sep 2026 05:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-timens-conditional 12/12]
 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:483:10: error:
 call to undeclared function 'clock_getres_fallback'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202609280758.uT2tKvOE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-timens-conditional
head:   dbe6d2a5ee3233a9e819a0663236161d27841d5a
commit: dbe6d2a5ee3233a9e819a0663236161d27841d5a [12/12] VDSO_HAS_CLOCK_GET=
RES
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260928=
/202609280758.uT2tKvOE-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f6=
09f950d2e80addf5566623013db68394334db)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260928/202609280758.uT2tKvOE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609280758.uT2tKvOE-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/vdso/vclock_gettime.c:22:
>> arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:483:10: erro=
r: call to undeclared function 'clock_getres_fallback'; ISO C99 and later d=
o not support implicit function declarations [-Wimplicit-function-declarati=
on]
     483 |                 return clock_getres_fallback(clock, res);
         |                        ^
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:483:10: note=
: did you mean 'clock_getres32_fallback'?
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:97:28: note:=
 'clock_getres32_fallback' declared here
      97 | static __always_inline int clock_getres32_fallback(clockid_t clk=
id, struct old_timespec32 *ts)
         |                            ^
   1 error generated.


vim +/clock_getres_fallback +483 arch/sparc/include/uapi/../../../../lib/vd=
so/gettimeofday.c

502a590a170b3b3 Thomas Gleixner   2019-07-28  473 =20
08cd5e1de815842 Thomas Wei=C3=9Fschuh  2026-02-27  474  static
ac1a42f4e4e296b Thomas Wei=C3=9Fschuh  2025-02-04  475  int __cvdso_clock_g=
etres_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993e Christophe Leroy  2020-02-07  476  			      struct __kernel=
_timespec *res)
502a590a170b3b3 Thomas Gleixner   2019-07-28  477  {
34f888e3405acef Thomas Wei=C3=9Fschuh  2025-07-01  478  	bool ok;
00b26474c2f1613 Vincenzo Frascino 2019-06-21  479 =20
34f888e3405acef Thomas Wei=C3=9Fschuh  2025-07-01  480  	ok =3D  __cvdso_cl=
ock_getres_common(vd, clock, res);
34f888e3405acef Thomas Wei=C3=9Fschuh  2025-07-01  481 =20
34f888e3405acef Thomas Wei=C3=9Fschuh  2025-07-01  482  	if (unlikely(!ok))
00b26474c2f1613 Vincenzo Frascino 2019-06-21 @483  		return clock_getres_fa=
llback(clock, res);
502a590a170b3b3 Thomas Gleixner   2019-07-28  484  	return 0;
00b26474c2f1613 Vincenzo Frascino 2019-06-21  485  }
00b26474c2f1613 Vincenzo Frascino 2019-06-21  486 =20

:::::: The code at line 483 was first introduced by commit
:::::: 00b26474c2f1613d7ab894c525f775c67c8a9e8f lib/vdso: Provide generic V=
DSO implementation

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
