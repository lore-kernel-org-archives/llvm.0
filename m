Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF8A24A047;
	Mon, 14 Jul 2025 14:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502820; cv=none; b=GsYP5xhVexoI/QHbx3Ukr0z2Jt2cYKFzM3f7OZ4x3Wy20g9I2ccZoy59j25je3TYKWmx/8GNeK/39jybUw1xVtzQZqfxUsw8LNgFGOr9UZQWJ3QW1wPDUMakb5iyXBV4kZKiMqYA3Ues1o605xzjc+KLc/bBAKDoGBMGKNi4QQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502820; c=relaxed/simple;
	bh=AE1OIQ409CAx+zIQEdBMxWN6IpNKGgr+mxRM1H46uI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1ynNsi79GObGIxEUuf0dLtBJI6e2iLeXmXDcpwk/jlQVwWxBYfnNuHvA9kO4H/L+SkdYq8piWGGuUjYkKwyhmCHHV8JVhzUd1lC7KKBLR0q1pP0FVGdvKMA9FJjqI6PRzak2h7NBFel4jEPpQRdXvgfksVNP9psztvEf+6RYrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=km68Ja7K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="km68Ja7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752502819; x=1784038819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AE1OIQ409CAx+zIQEdBMxWN6IpNKGgr+mxRM1H46uI0=;
  b=km68Ja7KMgzindeR2QUmxPoKPZrKke8feNgJzMg1E6+gDxe90935kzr2
   JZ4ensV9gEVurtpldktsyt2MpjWScIy9+Lc2052SSjRu/JfFOoTxfaZf/
   a5De/coYdqKT5ry0iRLVE9PBmpD4xzLxxJaMksf4QAhD3vT+sUQudG8gd
   pjJqu2YJv7Cs4J2KhPXXx+VYmT87fsg2LZQVgZf41TUsmWRXT/MDip/3J
   GyMmHGQzzCvr1rhFWEF8XLfZ/z7pJ2ReXxHjnuJ+hjFD5w9M9QoNU+MHo
   AFZry2r8KPgFPfSyu/wDrcCOvYL16+Y4USyRI0ojW8EOZGb3FYx7ONHXT
   A==;
X-CSE-ConnectionGUID: HH5Sem/YThqepw/kpKLAog==
X-CSE-MsgGUID: QLolQrKDT/K2ygf/pxqaEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58464591"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="58464591"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 07:20:19 -0700
X-CSE-ConnectionGUID: qtke/G0KSJ+okN245tysrQ==
X-CSE-MsgGUID: vgm56rzYRXG8ryMb/XzimQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="156358250"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jul 2025 07:20:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubK2Q-000907-2c;
	Mon, 14 Jul 2025 14:20:14 +0000
Date: Mon, 14 Jul 2025 22:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-has-macros 7/7]
 include/vdso/gettime.h:11:33: warning: '_Static_assert' with no message is a
 C23 extension
Message-ID: <202507142249.Hm3kmAqi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-has-macros
head:   51063ab687181b4aec3cfdb1def38e50381918b8
commit: 51063ab687181b4aec3cfdb1def38e50381918b8 [7/7] deleteme
config: i386-buildonly-randconfig-002-20250714 (https://download.01.org/0day-ci/archive/20250714/202507142249.Hm3kmAqi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507142249.Hm3kmAqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507142249.Hm3kmAqi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/entry/vdso/vdso32/vclock_gettime.c:4:
   In file included from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:14:
>> include/vdso/gettime.h:11:33: warning: '_Static_assert' with no message is a C23 extension [-Wc23-extensions]
      11 | _Static_assert(sizeof(long) == 4);
         |                                 ^
         |                                 , ""
   In file included from arch/x86/entry/vdso/vdso32/vclock_gettime.c:4:
   In file included from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:16:
   In file included from arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:197:
   In file included from arch/x86/include/asm/vdso/gettimeofday.h:20:
   In file included from include/clocksource/hyperv_timer.h:16:
   In file included from include/linux/clocksource.h:19:
   In file included from include/linux/of.h:18:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
   include/linux/page-flags-layout.h:36:44: warning: '_Static_assert' with no message is a C23 extension [-Wc23-extensions]
      36 | _Static_assert(!IS_ENABLED(BUILD_VDSO32_64));
         |                                            ^
         |                                            , ""
   In file included from arch/x86/entry/vdso/vdso32/vclock_gettime.c:4:
   In file included from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:16:
   In file included from arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:197:
   In file included from arch/x86/include/asm/vdso/gettimeofday.h:20:
   In file included from include/clocksource/hyperv_timer.h:16:
   In file included from include/linux/clocksource.h:19:
   In file included from include/linux/of.h:18:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:12:
   include/linux/maple_tree.h:27:44: warning: '_Static_assert' with no message is a C23 extension [-Wc23-extensions]
      27 | _Static_assert(!IS_ENABLED(BUILD_VDSO32_64));
         |                                            ^
         |                                            , ""
   In file included from arch/x86/entry/vdso/vdso32/vclock_gettime.c:4:
   In file included from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:16:
   In file included from arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:197:
   In file included from arch/x86/include/asm/vdso/gettimeofday.h:20:
   In file included from include/clocksource/hyperv_timer.h:16:
   In file included from include/linux/clocksource.h:19:
   In file included from include/linux/of.h:18:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   include/linux/mmzone.h:1122:44: warning: '_Static_assert' with no message is a C23 extension [-Wc23-extensions]
    1122 | _Static_assert(!IS_ENABLED(BUILD_VDSO32_64));
         |                                            ^
         |                                            , ""
   4 warnings generated.


vim +/_Static_assert +11 include/vdso/gettime.h

     9	
    10	#if !defined(CONFIG_64BIT) || defined(BUILD_VDSO32_64)
  > 11	_Static_assert(sizeof(long) == 4);
    12	struct old_timespec32;
    13	int __vdso_clock_getres(clockid_t clock, struct old_timespec32 *res);
    14	int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts);
    15	#else
    16	_Static_assert(sizeof(long) == 8);
    17	int __vdso_clock_getres(clockid_t clock, struct __kernel_timespec *res);
    18	int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
    19	#endif
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
