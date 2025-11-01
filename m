Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECD82C3262;
	Sat,  1 Nov 2025 12:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761999090; cv=none; b=Tnt9wHyXwLzrALGSIBdDWWZxdGfeRY4CAGnOxl02/ai65H8ZCU/liKfJP9fHetUDmyQlPanL4XuBx+ut1xim0jdPFG4yaphHvPRpAQre8oMssgTVTYaBUZUpO2vMiN+TDH53t6wHAzl53moWBX4ZSecv3BdooQdOrdHfBuB5xNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761999090; c=relaxed/simple;
	bh=kjGyd4VscDV2Dv3gKgD0rLng6eflEnYN0ogOTbcfBlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hxndye02IC1TCoSJQuX7w3D+STflVvCqRvgZ0Mm9vqpsge6CE2VEV1Z5ECZAOMZFr6IoEn9xrIyv1LhmOVfilBCIKIADFiQNSSwQvxyReH7XV2wpop6EILMjqAFTyc0W/TN2vSC5uz6TgwmroEV7h9JUh8pAW/ztnHdNHDf18Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QG2Lcmxa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QG2Lcmxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761999088; x=1793535088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kjGyd4VscDV2Dv3gKgD0rLng6eflEnYN0ogOTbcfBlk=;
  b=QG2Lcmxag4VqFnFDiwWC+FKdOMlpuKBU/xEHCMQkKgYPN/GX/KIWQceu
   rSj4ii7yP8B7dE6G0lHuv81BPUTC625HhFPb0BXaY98o1qjcffoa8feWf
   5+NBWlaRJmfGOiTpfayAzm6EQ/qfTwUrfJNy6LmdW0DJcoj/Z8ajCKxZv
   Awazk0K1T1Xoe2U0Blm9JdNqEGOeM7VsqIv/tqO21N4SHEfg8LD4CukKr
   ElEWw1ww0RSqMlHk+xKCnb6X3FuoYFni5+LCU0ipY+AZ3V65SUU4BkPkL
   NbYGrJmdM5pQdwgHbgNYFtx8QrCKpMebGDyURiBRDVwUS7j16Y1wDGXNU
   w==;
X-CSE-ConnectionGUID: 16TTsFG1QDmyoog5wIXVxw==
X-CSE-MsgGUID: yTbi53ZsRk67WEW3AlatMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="81556220"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="81556220"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 05:11:27 -0700
X-CSE-ConnectionGUID: JhoM2WJxQ22qxMqNTG3sAw==
X-CSE-MsgGUID: /2z8HkJlQ1GdVMAFRBD7aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186118907"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Nov 2025 05:11:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFAS3-000OEe-2g;
	Sat, 01 Nov 2025 12:11:23 +0000
Date: Sat, 1 Nov 2025 20:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>
Subject: [linux-next:master 3741/5383]
 arch/um/include/shared/as-layout.h:9:10: fatal error:
 'generated/asm-offsets.h' file not found
Message-ID: <202511011903.dAA0SEHo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
commit: a7f7dbae94a5ae5cfbf2375e0d952c54b069fd7f [3741/5383] um: Remove file-based iomem emulation support
config: um-randconfig-001-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011903.dAA0SEHo-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011903.dAA0SEHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011903.dAA0SEHo-lkp@intel.com/

Note: the linux-next/master HEAD 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/um/kernel/asm-offsets.c:8:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:31:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/um/include/asm/pgtable.h:48:
>> arch/um/include/shared/as-layout.h:9:10: fatal error: 'generated/asm-offsets.h' file not found
   #include <generated/asm-offsets.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/um/kernel/asm-offsets.s] Error 1 shuffle=2651225257
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=2651225257
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2651225257
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2651225257
   make: Target 'prepare' not remade because of errors.


vim +9 arch/um/include/shared/as-layout.h

4ff83ce1114827 arch/um/include/as-layout.h        Jeff Dike 2007-05-06   8  
9e636452d0714b arch/um/include/shared/as-layout.h Al Viro   2011-08-18  @9  #include <generated/asm-offsets.h>
54ae36f24b103e arch/um/include/as-layout.h        Jeff Dike 2007-10-16  10  

:::::: The code at line 9 was first introduced by commit
:::::: 9e636452d0714b08e4f8f4c58b76c4b7d15ffffa um: get rid of kern_constants.h

:::::: TO: Al Viro <viro@ftp.linux.org.uk>
:::::: CC: Richard Weinberger <richard@nod.at>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
