Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793583;
	b=VTWEgBmm7ZHSuKT3QqQftURXJvDUgQgnA8TtKnmV6x/u89KAErGtLUHqk3FK5OpRezTA
	 my4BV4qy1uwRnLYin0dWIOAAexEkH+4ElllAPZlP4ZCFp++yJfzY+wHdfr45YRAQVFCj7
	 1tJHW3QXNM/9KK9yQsNmSWej6GhmgH6NM+yfq3C8FuWwbvhz71JW+p5WnbfKKzswC3kv8
	 KrJH3vB0667ownRwOC2lgyo954/xd8wOo3HbRzZPQlFzrvGfQyl4FMWz/uoPfuBirq60A
	 ifr9PJo5ayGvd1bpVaAP+hh8LALDIbhQOiV93UnM9GGfQdFh+Jd+wuAKM1UvjhCUQzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793583;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=NfaIjLw6yNAIUpob9+mX4Bd78hev6ohhuc7UQvEPA04=;
	b=jDPJmTwXZpL5aU+noVwCNQ+hhh/OVqPsq08LnkuJsqh68+AoIln4fQSMxVSHaLTXBOi+
	 LjnUmYmFHgoNwqmDTnMr56BnVOAlk7RxVjE2hVcKkO0rqAYa0MLIMfM5NYLnBOR+2EjYI
	 T8HFOq8BMdjMx2Y5LBlA1AVrCbu7+cLe/wkxCMzZzTyS296iA4KaMWi2GpG8cZVLVccB4
	 lTvFgYY29Cb5JYAp9V3dzPwAv6m9MXFjag+CBspTynGXvtI7IAKmWG6Xuoh/TwlmXe1Jk
	 clWjlhBg8omhd6j29mXUNDlQ147COwRfoKns5zq8YXDpthVrAcVktrIEkD+RvA1GlWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=exgcp3wz;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15967606A31C;
	Mon, 16 Nov 2026 01:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15967606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=exgcp3wz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794793583; x=1826329583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wPbG4nL4qP/9LWoL9zkGt3kPtCc2EvazhL8+MOPpK3Y=;
  b=exgcp3wzc5AMkqxweTjUEXQiQ6ylu9sEspAtBSsDhB8L8MKH41ACd+ur
   Ty2WLRbhNlwd/au566svYF6W0LBv32GKUgD7Z6K57n+2kLCsKRcxymhCz
   k7ujNtCbLM563ZEeWV00C49rQWlqeqNwe8oT/BEBvxzsIZk6Jg8dtstsN
   wAMid5pnmYt7f2f1IEzV+je+FBc7UI6jSoY+p4WXMlKoIgm1VP93ZiEbc
   1Gi0/32O9lEGK1vU6K2nCQm07jtSfwtlfvgnP0MxRvwk1riwNiJiTgkeF
   NpOGlg5dRxa30XjnTDb8tnEtTDxzEiEEfhYGKIVMI0K3vfkZFFDcLzQfx
   Q==;
X-CSE-ConnectionGUID: Ov0IIGmxRJuVIJD1D9cv4w==
X-CSE-MsgGUID: gX1JY126SPSHX8XXushQ9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3389349"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3389349"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 17:46:22 -0800
X-CSE-ConnectionGUID: 0ghLbjdrQayYV+RsN1eI/Q==
X-CSE-MsgGUID: kZiFaiLRSwiINTi7Niu4gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9842638"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Nov 2026 17:46:21 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSlnW-000000017bw-0o8n;
	Mon, 16 Nov 2026 01:46:18 +0000
Date: Mon, 16 Nov 2026 09:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Nicolas Schier <nsc@kernel.org>
Subject: [linux-next:master 3784/7428]
 include/linux/page-flags-layout.h:6:10: fatal error: 'generated/bounds.h'
 file not found
Message-ID: <202611160947.NOrZmI1p-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: cdfdbc11552b99dbc5c45c55f62a76527ffcc73d [3784/7428] Move struct cpu_feature to <linux/cpufeature.h>
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261116/202611160947.NOrZmI1p-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ca14e3d05c4e63d6e8103945c86b958ed2f55d5f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160947.NOrZmI1p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160947.NOrZmI1p-lkp@intel.com/

Note: the linux-next/master HEAD 84abb955b1015477aa11a96e2f3ac1b938b77f48 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/cpufeature.h:30:
   In file included from arch/loongarch/include/asm/cpufeature.h:13:
   In file included from arch/loongarch/include/asm/elf.h:9:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:7:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
>> include/linux/page-flags-layout.h:6:10: fatal error: 'generated/bounds.h' file not found
       6 | #include <generated/bounds.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:185: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1416: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +6 include/linux/page-flags-layout.h

bbeae5b05ef6e40 Peter Zijlstra 2013-02-22  4  
bbeae5b05ef6e40 Peter Zijlstra 2013-02-22  5  #include <linux/numa.h>
bbeae5b05ef6e40 Peter Zijlstra 2013-02-22 @6  #include <generated/bounds.h>
bbeae5b05ef6e40 Peter Zijlstra 2013-02-22  7  

:::::: The code at line 6 was first introduced by commit
:::::: bbeae5b05ef6e40bf54db05ceb8635824153b9e2 mm: move page flags layout to separate header

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
