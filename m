Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B73F1B041B;
	Tue, 21 Jan 2025 22:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737497497; cv=none; b=kB2juzmhA+tPI1U2CPitTg6Oi3ItrSB/hZuaCNvKaGKpHuGJN41aZOq7+v9F1+Xte7GrRNxB2QTYWeh5pNgEkX2XT5kfTW6O9CnRhYjEeNC2A7G/2tftfV9K8Q3/1EouGRqrOdzaym+RSQVC6Gu2lqfKETlHTQylx5noH1gz7L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737497497; c=relaxed/simple;
	bh=rm3D/yJ//rcZyPQNwKEXPKd/3t4PxULOVLpKt/RAuIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pAfugUGHvL5zZ7gPSkGFG1M/Kz8qBKU4s/ibNj48LE5jLcBESG52179XDSNKNOOzR6b7JViYTB4LmNNtm+QiEhNd8lAW1M5ZRVYNlYJ8jXR1ksGzrkBzeVzQNdBfOHhMgJ4ViLElLgolnxX71g1Ycpss2LQ632me4C+JfSN70Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OW66tgIt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OW66tgIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737497495; x=1769033495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rm3D/yJ//rcZyPQNwKEXPKd/3t4PxULOVLpKt/RAuIc=;
  b=OW66tgItamC7MApT851xxpilO3dc/wsBNVSS4y5/F4/xCiPayViI8ljh
   E1dy6fugU1h2y5o6EaIlUXJtO8H2JNWxSKmIt0dbOZ00rOYjR/Am8RX9Y
   fH9dU0uscxaTTbdw1LNkx1zr2Vnt6vdlQCBFvPNrojY4jU41JzYoeRCK9
   FKKYUpMticEXtPoF5Bh39v3Xjg40rqZXy3gjiYjUX/ZJ6uug9vp7ZoDex
   ArPhu9acgHFLZvzNuLbUIKHu8PIhAYZMiLgeL0kk4AH2e77ck/jMrf9LG
   yFQsJdrulyGETRmIWwlPQwjaYqt/72CUYPpthumCugCmMefzGC7gcuHHe
   Q==;
X-CSE-ConnectionGUID: XkoipjANSbuGNbUpDXyatw==
X-CSE-MsgGUID: 5wzw6PnEQNKAparRjKrcmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41861470"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="41861470"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 14:11:34 -0800
X-CSE-ConnectionGUID: TglcsWj6QcuXvR7LdYURBQ==
X-CSE-MsgGUID: orlzGtlAQiuwbtX7P+OUCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112025038"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2025 14:11:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taMT4-000Z2t-0v;
	Tue, 21 Jan 2025 22:11:30 +0000
Date: Wed, 22 Jan 2025 06:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/mv_ctltables 10/10]
 arch/x86/kernel/setup.c:207:2: error: invalid application of 'sizeof' to an
 incomplete type 'const struct ctl_table[]'
Message-ID: <202501220544.HWIDvZIL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/mv_ctltables
head:   18654655ca1b5e5bc57b89c5e88645cd3284764c
commit: 18654655ca1b5e5bc57b89c5e88645cd3284764c [10/10] x86: Move sysctls into arch/x86
config: i386-randconfig-011-20250122 (https://download.01.org/0day-ci/archive/20250122/202501220544.HWIDvZIL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220544.HWIDvZIL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220544.HWIDvZIL-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/setup.c:153:13: error: use of undeclared identifier 'panic_on_unrecovered_nmi'
     153 |                 .data           = &panic_on_unrecovered_nmi,
         |                                    ^
   arch/x86/kernel/setup.c:160:13: error: use of undeclared identifier 'panic_on_io_nmi'
     160 |                 .data           = &panic_on_io_nmi,
         |                                    ^
>> arch/x86/kernel/setup.c:207:2: error: invalid application of 'sizeof' to an incomplete type 'const struct ctl_table[]'
     207 |         register_sysctl_init("kernel", x86_sysctl_table);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:233:46: note: expanded from macro 'register_sysctl_init'
     233 |         __register_sysctl_init(path, table, #table, ARRAY_SIZE(table))
         |                                                     ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   3 errors generated.


vim +207 arch/x86/kernel/setup.c

   205	
   206	static int __init init_x86_sysctl(void) {
 > 207		register_sysctl_init("kernel", x86_sysctl_table);
   208		return 0;
   209	}
   210	arch_initcall(init_x86_sysctl);
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
