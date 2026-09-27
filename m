Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A5C2F6188;
	Sun, 27 Sep 2026 20:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540942; cv=none; b=lqyfNMx5gmnIEk0bE3gqbbBo4igmTTJMPvacWPTnlNN2aBFTJmtUHu6zOYbLWVNwHuiB0umQjCI7owVJTnrN8TcLI/Q5iILqfnnOvi8KwTrM89lBa3fFX/zJsnScEeWzLqFxm6hY1otj4kYTqffqTOJ9HetpO6iS3tTTkxnelx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540942; c=relaxed/simple;
	bh=yJseRHOEDLQ1zK0Dj8ka8ajSpbODt8p8YW0HRntLhtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l5ewIal+JeWpa8vxGGNamKHchdHOLFlF8e9QsU5PIN2pj506eEGW01nID4m+bl58CuWr+QhsziaeZKbFDOewzI2n6iuHmtgKjl3JoeO6MT3hjHRjGfloW1OXn91RKYIMrAGyJ6W6PMrLWpLz87eQdomRUHTV6wA75GURrNeheeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZWWImMC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZWWImMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790540941; x=1822076941;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yJseRHOEDLQ1zK0Dj8ka8ajSpbODt8p8YW0HRntLhtk=;
  b=CZWWImMCIo1N/CHB6zA8Gz3eqSTLq7ZoKUAyJTX8weqQbLUw4Z5Kje7Z
   dfegB5L/cOxSUjAU/HFvQEaFcj9KjCU/O2Rp4Am4PIh68XlZfY4/2vmOj
   8W11veT3wrHL47UXtZ3DeJ9GeEfIlg49x7Tj6Zs9Dqrc+JeOKBRCsmnXE
   r2dkK61EFNcYsNSds0sE1QvrVSz3sMGkKbdJlJ5MCmmEDu/0dUVGpiyqX
   VZF28yhbRPd1b/T3d5eM/5jf0rWq/cmwfnstUkQLD7GFUuq5lbxianTxp
   JQsoil4/Kik/jCfpFNuFH0wF6rtS6RONSZxDTFcXUSCJtalI74C+6t7R0
   w==;
X-CSE-ConnectionGUID: W4neiYShTua3K36Fgm+JBg==
X-CSE-MsgGUID: Cr4m9X8qTV6lA98mJamEHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101415601"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="101415601"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 13:29:00 -0700
X-CSE-ConnectionGUID: Htb2uIH5SwuqwPwjhXQx/Q==
X-CSE-MsgGUID: 3YQ1B4DZReCjNLXhKyLQiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="312788615"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Sep 2026 13:28:58 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAvUV-000000000gD-0tP4;
	Sun, 27 Sep 2026 20:28:55 +0000
Date: Sun, 27 Sep 2026 22:28:27 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-timens-conditional 12/12]
 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:483:10: error:
 call to undeclared function 'clock_getres_fallback'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202609272248.elcdGKal-lkp@intel.com>
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
config: sparc64-randconfig-2000-20260927 (https://download.01.org/0day-ci/a=
rchive/20260927/202609272248.elcdGKal-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 761=
5da10b75c57286a4032eac8bb43c1b8d2ba46)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260927/202609272248.elcdGKal-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609272248.elcdGKal-lkp@i=
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

502a590a170b3b Thomas Gleixner   2019-07-28  473 =20
08cd5e1de81584 Thomas Wei=C3=9Fschuh  2026-02-27  474  static
ac1a42f4e4e296 Thomas Wei=C3=9Fschuh  2025-02-04  475  int __cvdso_clock_ge=
tres_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy  2020-02-07  476  			      struct __kernel_=
timespec *res)
502a590a170b3b Thomas Gleixner   2019-07-28  477  {
34f888e3405ace Thomas Wei=C3=9Fschuh  2025-07-01  478  	bool ok;
00b26474c2f161 Vincenzo Frascino 2019-06-21  479 =20
34f888e3405ace Thomas Wei=C3=9Fschuh  2025-07-01  480  	ok =3D  __cvdso_clo=
ck_getres_common(vd, clock, res);
34f888e3405ace Thomas Wei=C3=9Fschuh  2025-07-01  481 =20
34f888e3405ace Thomas Wei=C3=9Fschuh  2025-07-01  482  	if (unlikely(!ok))
00b26474c2f161 Vincenzo Frascino 2019-06-21 @483  		return clock_getres_fal=
lback(clock, res);
502a590a170b3b Thomas Gleixner   2019-07-28  484  	return 0;
00b26474c2f161 Vincenzo Frascino 2019-06-21  485  }
00b26474c2f161 Vincenzo Frascino 2019-06-21  486 =20

:::::: The code at line 483 was first introduced by commit
:::::: 00b26474c2f1613d7ab894c525f775c67c8a9e8f lib/vdso: Provide generic V=
DSO implementation

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
