Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F62D15575F;
	Tue,  3 Sep 2024 06:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725343847; cv=none; b=Q0X26P/DGMBRabc08uXPHhMkoK1GimpW62uHoYAzkMBojb6OqlrC+40PVHQnMnIValpNVLeIpBHkbpyS7PYN29W1QkvluRZrplxvr1k/TJ6UN0myLr74YwGeIt6/VKxNPITgZW4naDlXOcws9GQCuwxAZKRy+DHRiv6yEnSici4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725343847; c=relaxed/simple;
	bh=E90vQYwptlYlH61UfygcesYRUv4a3vMaWUHajdqqi44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WqEEyIzXtFswmyjIn/yVvh1WiTzl2i4ygA9oGIvjwXDNNlRtHuUGlQbUWIluH0P+VPWj949YJMwYvLBSz3edFZUwT8molvCDJi89NdyakwelVoSmUyhgsN3Lt98duF+NhQLKYQPvywLuenaBBUMTG878QkZv0REx+g9rD4wWcB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xa+MEPbg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xa+MEPbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725343846; x=1756879846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E90vQYwptlYlH61UfygcesYRUv4a3vMaWUHajdqqi44=;
  b=Xa+MEPbgHeAR9Zu8UNKKhfr5gGC6ne3P0zQIXNpg9uMWZCPl3DwTNPrF
   KYzsM/Qty/fmFQIdNObhDzW4rgB7Nc18wVN9Un4ZVsCH1AnRahPqvGHox
   NDz4PIgjrer7M0Ux1b8TKl2an7ULBarrEfWDkjtCICrRNeGcGxBMam+z8
   MaCxsBlv2HfYRZfdq/s9h1GvQDO2MUgpjwEM6KEIWpwwhe01ThrUF0sgG
   PX/kMqo2gCj8epaB8LaeOtJ8Ym1pXL4MwczprUq+2wtAjuYbBDpIASj0Z
   hEQZ+yjIQSGn1Pcn4JepoF0jmBN8ekSST9bTMRQe8IY7h42WIdODLrKc7
   Q==;
X-CSE-ConnectionGUID: 7cCFAvJXRN22gMruDDicwQ==
X-CSE-MsgGUID: Tbhl6vldR/2qqmJuhpwxzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24077612"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="24077612"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 23:10:45 -0700
X-CSE-ConnectionGUID: jcUIspPGSlyHUYBbw/vP5Q==
X-CSE-MsgGUID: 2rDVAgUpRL2wSMLU6cXsfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="65522831"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Sep 2024 23:10:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slMkT-0006IC-0m;
	Tue, 03 Sep 2024 06:10:41 +0000
Date: Tue, 3 Sep 2024 14:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:mm-generic-shadow-stack-guard 2/4]
 arch/mips/mm/mmap.c:100:15: error: conflicting types for
 'arch_get_unmapped_area'
Message-ID: <202409031447.Lquudk3F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git mm-generic-shadow-stack-guard
head:   cb02398ba093f1730eca10afbb4baea7af28b1e5
commit: e20e42643b0c31b61ae8f48fa1ec3ecabcac1b4b [2/4] mm: Make arch_get_unmapped_area() take vm_flags by default
config: mips-db1xxx_defconfig (https://download.01.org/0day-ci/archive/20240903/202409031447.Lquudk3F-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project dc19b59ea2502193c0e7bc16bb7d711c8053edcf)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031447.Lquudk3F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031447.Lquudk3F-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/mm/mmap.c:12:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/mips/mm/mmap.c:100:15: error: conflicting types for 'arch_get_unmapped_area'
     100 | unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
         |               ^
   include/linux/sched/mm.h:184:1: note: previous declaration is here
     184 | arch_get_unmapped_area(struct file *filp, unsigned long addr,
         | ^
   1 warning and 1 error generated.


vim +/arch_get_unmapped_area +100 arch/mips/mm/mmap.c

d0be89f6c2570a6 Jian Peng      2011-05-17   99  
d0be89f6c2570a6 Jian Peng      2011-05-17 @100  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
d0be89f6c2570a6 Jian Peng      2011-05-17  101  	unsigned long len, unsigned long pgoff, unsigned long flags)
d0be89f6c2570a6 Jian Peng      2011-05-17  102  {
16650107579aed8 Kevin Cernekee 2011-06-18  103  	return arch_get_unmapped_area_common(filp,
d0be89f6c2570a6 Jian Peng      2011-05-17  104  			addr0, len, pgoff, flags, UP);
d0be89f6c2570a6 Jian Peng      2011-05-17  105  }
d0be89f6c2570a6 Jian Peng      2011-05-17  106  

:::::: The code at line 100 was first introduced by commit
:::::: d0be89f6c2570a63ac44ccdd12473a54243cd296 MIPS: topdown mmap support

:::::: TO: Jian Peng <jipeng2005@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
