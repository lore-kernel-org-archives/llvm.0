Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EAC15357A;
	Fri, 21 Jun 2024 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973307; cv=none; b=qUzEgLZ8tY7snmS7B0BLwcsNX3g6E1QxSKNLuGg/GHHTIjbIlPUZ7Uf1Hs02yxqg/m5D91z3WYhJYwiwAS+jIzb2iENMSpcpMi4wHH3l633T7urNHdeJQrn2MCqADF+WxzPrtL7IWaFEevejsWTDgxSKFzXMG9+cXXaku0awY4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973307; c=relaxed/simple;
	bh=5dyC7pl06Y8jGkvBgKP/SjRawZ5j5QlnyFubkgYZbMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eOCMwhdFi45rZskN/8/ZXbLSrHi3oDI9S2uq4WMCSX1+TTfB47qlpB97LAQ0f0SkFJ3ZhjPkpa+H40mt7ImbgrdpDHz8moAp2iAttdr18E4Q1C+nomyi0Ntwq1AwpZonxrUyY5bCHSHpEW/h9RC8gbfnMuJlNdRkMMzH5QsnXx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNu3ngNf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNu3ngNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718973306; x=1750509306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5dyC7pl06Y8jGkvBgKP/SjRawZ5j5QlnyFubkgYZbMQ=;
  b=YNu3ngNfjVO/+KoZOAjbJZmAyPlpVKxXv+Eum66fnZgMplHDu/a4wuQe
   Xntq2UQ6onHNHYf7GaZ5dsiRNCOTqMSTHet6iKGDaH95gucpdnuoCszNJ
   kfhiAO1lC+bXYAQT3NdxqrcmP/eNNdsIn84sLlrpo6ehMmV1HHb6QDVsE
   VYjtgzXv2qpihxq32ek6ZxYPWuZV5pyAslyqo8lw0c4wkf6lnKwwjiDyM
   /B2yxMUHfiXhKTjTyR9+GD0End4jP/Lx79JNHDpcjsmgPN/KXcPr0QE6i
   Zk8hn3hfI1Cl6DRA5w+Q2S+NwywFWIjQY0Zd8K6MjJOOHEhnEYyggtUup
   Q==;
X-CSE-ConnectionGUID: 5wluxeJ5Q7WbEBhxGglx/w==
X-CSE-MsgGUID: RUlZ+lkXR1uqqL5yk3tMJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="18911890"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="18911890"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 05:35:05 -0700
X-CSE-ConnectionGUID: psU5DWzGS1GFBCgEndPDGQ==
X-CSE-MsgGUID: MVLvnlveRbSnpSTWt/WtAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="42686514"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jun 2024 05:35:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKdTp-0008aE-1Y;
	Fri, 21 Jun 2024 12:35:01 +0000
Date: Fri, 21 Jun 2024 20:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 16/108] lib/closure.c:22:32: warning: format
 specifies type 'unsigned long' but the argument has type 'unsigned int'
Message-ID: <202406212026.4RHSfZqx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   1fc1956483665158853d3d1d5f5f54e9c0416758
commit: e5dbf4c912b9e0bae5b19460eba000bbeafc4b3f [16/108] closures: Change BUG_ON() to WARN_ON()
config: arm64-randconfig-002-20240621 (https://download.01.org/0day-ci/archive/20240621/202406212026.4RHSfZqx-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406212026.4RHSfZqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406212026.4RHSfZqx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/closure.c:22:32: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
      21 |                  "closure has guard bits set: %x (%lu)",
         |                                                   ~~~
         |                                                   %u
      22 |                  flags & CLOSURE_GUARD_MASK, __fls(r)))
         |                                              ^~~~~~~~
   include/asm-generic/bug.h:134:29: note: expanded from macro 'WARN'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:106:17: note: expanded from macro '__WARN_printf'
     106 |                 __warn_printk(arg);                                     \
         |                               ^~~
   lib/closure.c:30:37: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
      29 |                      "closure ref hit 0 with incorrect flags set: %x (%lu)",
         |                                                                       ~~~
         |                                                                       %u
      30 |                      flags & ~CLOSURE_DESTRUCTOR, __fls(flags));
         |                                                   ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:29: note: expanded from macro 'WARN'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:106:17: note: expanded from macro '__WARN_printf'
     106 |                 __warn_printk(arg);                                     \
         |                               ^~~
   2 warnings generated.


vim +22 lib/closure.c

    15	
    16	static inline void closure_put_after_sub(struct closure *cl, int flags)
    17	{
    18		int r = flags & CLOSURE_REMAINING_MASK;
    19	
    20		if (WARN(flags & CLOSURE_GUARD_MASK,
    21			 "closure has guard bits set: %x (%lu)",
  > 22			 flags & CLOSURE_GUARD_MASK, __fls(r)))
    23			r &= ~CLOSURE_GUARD_MASK;
    24	
    25		if (!r) {
    26			smp_acquire__after_ctrl_dep();
    27	
    28			WARN(flags & ~CLOSURE_DESTRUCTOR,
    29			     "closure ref hit 0 with incorrect flags set: %x (%lu)",
    30			     flags & ~CLOSURE_DESTRUCTOR, __fls(flags));
    31	
    32			cl->closure_get_happened = false;
    33	
    34			if (cl->fn && !(flags & CLOSURE_DESTRUCTOR)) {
    35				atomic_set(&cl->remaining,
    36					   CLOSURE_REMAINING_INITIALIZER);
    37				closure_queue(cl);
    38			} else {
    39				struct closure *parent = cl->parent;
    40				closure_fn *destructor = cl->fn;
    41	
    42				closure_debug_destroy(cl);
    43	
    44				if (destructor)
    45					destructor(&cl->work);
    46	
    47				if (parent)
    48					closure_put(parent);
    49			}
    50		}
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
