Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E51188722;
	Thu,  6 Feb 2025 19:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738868467; cv=none; b=XIuXFKSb307u6iVqr1JnS3ZuVgMCgRHNO1DUj0RMxqz8s0sNZxSxPrAitkddb2/zXya9DyzdrDBE26jPTIAFmNOWhKyKkey/Jee0Ze+Krpp0kgrpSfdA5ATyffzNKSPlZUft8qL5K/m8a7wnVpy9BN5c/A5Id1eKjeIgAYNphnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738868467; c=relaxed/simple;
	bh=8shSl97rqIuDxD7lg0YvT4fpCU6YWUujc7x227R5+1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kXwiYdqbP5+1y0Qifw3rPJZen0cQKYKRUrPmbttnm6AkLUH0Jn/eu1fmOqQhQaAOt43f3+ZslMmja4GfqKEyTnSccRgn84TpB+NC+zdhNKZKUor+lh4Z4VZk08ZqJkQNhpjUDn6YbVdfg21gWaQiHPyCROt9fQQsGzT9fB3So9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfgVMsmU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfgVMsmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738868465; x=1770404465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8shSl97rqIuDxD7lg0YvT4fpCU6YWUujc7x227R5+1w=;
  b=GfgVMsmUp+KDSpjVM9BP1mrNa8cgvUVeo7mGmrBtviyscWLWzF+Lcde8
   OBzmEOVlZuwDKul7oTcDtd0T8HOkPdw9VUN3cVo2jiqloYCiGhM9Kn8P0
   fddryWLLQFq06iz7lqpMTknHBz43yvzna1wanyjZ0h1yQUY1ZdfZWg1XR
   A6P5u4XIyFHs3QF7ytdAF8YQ9KNBuAK3YLJ3hsXHER6h/1/J0CGEs596m
   oSn4uA5HqlqWO7dDnTK5ulqchiO34GmBWF52WU+hnGytFrE9bzFcHMds3
   2T1SszqiVswjhqv+N1SlNqG2elZrZJe64fBgflCN9qmXyA7f3IacLCi7V
   A==;
X-CSE-ConnectionGUID: 7ipiHd04TJ6ro9NXt6Ahxw==
X-CSE-MsgGUID: h8C2J1oNTBGi6/3q/4G52g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49738490"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="49738490"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 11:01:02 -0800
X-CSE-ConnectionGUID: VRndO/XfSdS9RG7p4mytQA==
X-CSE-MsgGUID: KUhe4i9ETIKY06QfaVzTUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111137734"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Feb 2025 11:01:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg77S-000xEO-2i;
	Thu, 06 Feb 2025 19:00:58 +0000
Date: Fri, 7 Feb 2025 03:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 9/9] arch/x86/kernel/early_printk.c:102:1:
 error: expected string literal in 'asm'
Message-ID: <202502070258.zDk7RoH7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   57750f0464beab3927ad570e0c1b5e78c91dd1b6
commit: 57750f0464beab3927ad570e0c1b5e78c91dd1b6 [9/9] x86/early_printk: Harden early_serial
config: i386-buildonly-randconfig-005-20250207 (https://download.01.org/0day-ci/archive/20250207/202502070258.zDk7RoH7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070258.zDk7RoH7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070258.zDk7RoH7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/early_printk.c:102:1: error: expected string literal in 'asm'
     102 | ANNOTATE_NOENDBR_SYM(io_serial_in);
         | ^
   include/linux/objtool.h:150:76: note: expanded from macro 'ANNOTATE_NOENDBR_SYM'
     150 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOENDBR))
         |                                                                                  ^
   arch/x86/kernel/early_printk.c:108:1: error: expected string literal in 'asm'
     108 | ANNOTATE_NOENDBR_SYM(io_serial_out);
         | ^
   include/linux/objtool.h:150:76: note: expanded from macro 'ANNOTATE_NOENDBR_SYM'
     150 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOENDBR))
         |                                                                                  ^
   arch/x86/kernel/early_printk.c:200:1: error: expected string literal in 'asm'
     200 | ANNOTATE_NOENDBR_SYM(mem32_serial_out);
         | ^
   include/linux/objtool.h:150:76: note: expanded from macro 'ANNOTATE_NOENDBR_SYM'
     150 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOENDBR))
         |                                                                                  ^
   arch/x86/kernel/early_printk.c:208:1: error: expected string literal in 'asm'
     208 | ANNOTATE_NOENDBR_SYM(mem32_serial_in);
         | ^
   include/linux/objtool.h:150:76: note: expanded from macro 'ANNOTATE_NOENDBR_SYM'
     150 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOENDBR))
         |                                                                                  ^
   4 errors generated.


vim +/asm +102 arch/x86/kernel/early_printk.c

    97	
    98	static __noendbr unsigned int io_serial_in(unsigned long addr, int offset)
    99	{
   100		return inb(addr + offset);
   101	}
 > 102	ANNOTATE_NOENDBR_SYM(io_serial_in);
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
