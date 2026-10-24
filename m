Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792836651;
	b=CfW2M3e8/ynaP0lg+7Lv0yXUouhxze/0hY7C/p6nA0whN3t+ji4UVIRiM+1zBA1tJTjb
	 RtKQRu0BOYYKTsp4IpgO7irQ1lPq43qqiRBX/aL66pdk2KqXvuYaLYBkPN7JJm/u+DNEp
	 3+74jEBIQ2b5DM5MZcww08pDk97iv8nJwGjFo5kGIKHoA+D1Bhbczfveyi57JXyQbKSld
	 OlAks/ulYcolbSM1Z027oU8iPJ/PWmZ5X0ruugYIAAy5+YIG3vSX6v/fi5gSsSVG/7wNf
	 v7csp7s9CQIFOLyuIhAHHye/CMDopMcxnXZJdspjHSwHyaz2GosqzLH3hwmCGnv/fRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792836651;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0T0gBwDrRkcI+dA6mdfq19+Fcfk8wJqlClF6vlzvPLc=;
	b=SnA2+womASL8Tv60Jgq055ZRibUh8/IgULijYZgBzWuKSRGxFjfNzA81TFpDFLevbWtD
	 Hmk/PQlfCikuxBo96Cm6n5+z9Eu44TIkJljSDBw6U5FuRONsYzfuHUOaAPawcqrm2okvi
	 GgMjvQNWOb6LugyHRpZlpem3naBZUB/0NK9knQGQMNDTLdvpeBCNUMh4sgjOo+8Dix1Yk
	 HLipXIxL2JaZTz/Q/1mhoj2EOpLhAybVt0dRFzp2GMunMelwm2jZMEAlHcrwk66dRcrTF
	 r32f8VO4cKTemPCsV1v66Dn6dDhZ05hi9LbXF/uwy1XeXY/ZGZ7WAtWeTBdkg0JL1fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TXEkRAPL;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7CD606A31A;
	Sat, 24 Oct 2026 10:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D7CD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TXEkRAPL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792836649; x=1824372649;
  h=date:from:to:cc:subject:message-id;
  bh=PECSjrGkBK6QO6ipeagkYLQcSBa/+43UvXJR9cvRBwQ=;
  b=TXEkRAPLFSkKGci2VuF5eH3D2nrh5Y4iWx8q/iQ1nwrAbhajwOEI3s7L
   f4Zgohc2lRxXCqhr9gO4wiQ3s2HYmgngE4T2AJg/4Eupy1FYvpd+wk9YB
   Hi1fbYSmNHasheX8+XFJe8Oj8m/HRySmNZ2/PJ3eAX8YxzoZWpGkOgoIR
   k2pKbjvhaqa+e22yHbfhn9EWSUTW3JWVF7X1wrv7ejXzxTur5brFTcwh1
   hKMjQc9a1M51xtiZ1T2bgApNGEe2F2b1lMngOQb3AD6CpgmBduB80PPZ5
   tdztGf1tVUvhrHfn6Z/oF8433SWgNtb40LlWr6RIp12eSP1HnVZxawZf6
   w==;
X-CSE-ConnectionGUID: Ye0NJsXPQ3G5eHXYYeseDw==
X-CSE-MsgGUID: xlD8L+8iQ2+csjRj1XIKfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1452084"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1452084"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 03:10:48 -0700
X-CSE-ConnectionGUID: KiWaTrnvStGeIzJwirTjOg==
X-CSE-MsgGUID: 2qf7hRBOS/GUdtQr2WK4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4210821"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 24 Oct 2026 03:10:46 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKYi4-000000003M7-1gGY;
	Sat, 24 Oct 2026 10:10:44 +0000
Date: Sat, 24 Oct 2026 12:10:01 +0200
From: kernel test robot <lkp@intel.com>
To: Jonathan Flynn <jonathan.flynn@hammerspace.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:kernel-7.3/canary 285/387]
 fs/nfs/flexfilelayout/flexfilelayout.c:760:9: error: instruction requires the
 following: RV64I Base Instruction Set
Message-ID: <202610241225.b9yb7x6H-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/canary
head:   2bbaed9eb0e6249faa555ea839da7a7a88820f6d
commit: 31c1686e8f4441749d31204c83efc843f02d6af6 [285/387] NFSv4/flexfiles: move layoutstats accounting to a per-stripe lock
config: riscv-randconfig-2000-20261024 (https://download.01.org/0day-ci/archive/20261024/202610241225.b9yb7x6H-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a808f8ea7fdc61ead417bfe55e8ef5f728776aeb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241225.b9yb7x6H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241225.b9yb7x6H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/flexfilelayout/flexfilelayout.c:760:9: error: instruction requires the following: RV64I Base Instruction Set
     760 |         return try_cmpxchg64(&ffl->last_report_time, &last_report, now);
         |                ^
   include/linux/atomic/atomic-instrumented.h:4918:2: note: expanded from macro 'try_cmpxchg64'
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:259:9: note: expanded from macro 'raw_try_cmpxchg64'
     259 |         ___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:98:23: note: expanded from macro 'raw_cmpxchg64'
      98 | #define raw_cmpxchg64 arch_cmpxchg64
         |                       ^
   arch/riscv/include/asm/cmpxchg.h:303:2: note: expanded from macro 'arch_cmpxchg64'
     303 |         arch_cmpxchg((ptr), (o), (n));                                  \
         |         ^
   arch/riscv/include/asm/cmpxchg.h:294:20: note: expanded from macro 'arch_cmpxchg'
     294 |                       SC_PREPEND(""), SC_APPEND(RISCV_FULL_BARRIER),    \
         |                                  ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         0:      lr.d s0, 0(a0)
         |                 ^
>> fs/nfs/flexfilelayout/flexfilelayout.c:760:9: error: instruction requires the following: RV64I Base Instruction Set
     760 |         return try_cmpxchg64(&ffl->last_report_time, &last_report, now);
         |                ^
   include/linux/atomic/atomic-instrumented.h:4918:2: note: expanded from macro 'try_cmpxchg64'
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:259:9: note: expanded from macro 'raw_try_cmpxchg64'
     259 |         ___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:98:23: note: expanded from macro 'raw_cmpxchg64'
      98 | #define raw_cmpxchg64 arch_cmpxchg64
         |                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/cmpxchg.h:292:2: note: expanded from macro 'arch_cmpxchg'
     292 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   arch/riscv/include/asm/cmpxchg.h:251:3: note: expanded from macro '_arch_cmpxchg'
     251 |                 __arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,         \
         |                 ^
   arch/riscv/include/asm/cmpxchg.h:212:5: note: expanded from macro '__arch_cmpxchg'
     212 |                         "       sc" sc_sfx " %1, %z4, %2\n"             \
         |                          ^
   <inline asm>:3:2: note: instantiated into assembly here
       3 |         sc.d.rl a1, s3, 0(a0)
         |         ^
>> fs/nfs/flexfilelayout/flexfilelayout.c:760:9: error: register must be even
     760 |         return try_cmpxchg64(&ffl->last_report_time, &last_report, now);
         |                ^
   include/linux/atomic/atomic-instrumented.h:4918:2: note: expanded from macro 'try_cmpxchg64'
    4918 |         raw_try_cmpxchg64(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:259:9: note: expanded from macro 'raw_try_cmpxchg64'
     259 |         ___r = raw_cmpxchg64((_ptr), ___o, (_new)); \
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:98:23: note: expanded from macro 'raw_cmpxchg64'
      98 | #define raw_cmpxchg64 arch_cmpxchg64
         |                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/cmpxchg.h:292:2: note: expanded from macro 'arch_cmpxchg'
     292 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   arch/riscv/include/asm/cmpxchg.h:251:3: note: expanded from macro '_arch_cmpxchg'
     251 |                 __arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,         \
         |                 ^
   arch/riscv/include/asm/cmpxchg.h:199:5: note: expanded from macro '__arch_cmpxchg'
     199 |                         "       amocas" cas_sfx " %0, %z2, %1\n"        \
         |                          ^
   <inline asm>:3:20: note: instantiated into assembly here
       3 |         amocas.d.aqrl s0, s3, 0(a0)
         |                           ^
   3 errors generated.


vim +760 fs/nfs/flexfilelayout/flexfilelayout.c

   732	
   733	static bool
   734	nfs4_ff_layoutstat_start_io(struct nfs4_ff_layout_mirror *mirror,
   735				    u32 dss_id,
   736				    struct nfs4_ff_layoutstat *layoutstat,
   737				    ktime_t now)
   738	{
   739		s64 report_interval = FF_LAYOUTSTATS_REPORT_INTERVAL;
   740		struct nfs4_flexfile_layout *ffl = FF_LAYOUT_FROM_HDR(mirror->layout);
   741		ktime_t last_report;
   742	
   743		nfs4_ff_start_busy_timer(&layoutstat->busy_timer, now);
   744		if (!mirror->dss[dss_id].start_time)
   745			mirror->dss[dss_id].start_time = now;
   746		if (mirror->report_interval != 0)
   747			report_interval = (s64)mirror->report_interval * 1000LL;
   748		else if (layoutstats_timer != 0)
   749			report_interval = (s64)layoutstats_timer * 1000LL;
   750	
   751		/*
   752		 * last_report_time is shared by every mirror and stripe of this
   753		 * layout, so it was never serialised by the mirror lock either.
   754		 * Make that explicit: whoever wins the cmpxchg() reports.
   755		 */
   756		last_report = READ_ONCE(ffl->last_report_time);
   757		if (ktime_to_ms(ktime_sub(now, last_report)) < report_interval)
   758			return false;
   759	
 > 760		return try_cmpxchg64(&ffl->last_report_time, &last_report, now);
   761	}
   762	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
