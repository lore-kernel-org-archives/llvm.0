Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD003F6C55;
	Tue, 30 Jun 2026 10:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816822; cv=none; b=YAHHg7Cu3c15JmzmKv+LUKcP26kQCGg+WQQj8oDkwgu0bxSuQfvtnCdUoRqIEUUG/myVn8paIVwSfkJAkDfKGm28U7JCrQlrXvhPBp4xkDwW4DesAk1qAgFKObU4U7rElAnFoX5fcXn56tmSRNNYsFSTjD+POGSwYoWpUySHDFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816822; c=relaxed/simple;
	bh=vm1W7qF7iTVTdfXIhEklLzJsANohLVBo4bfau7rOowg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CDzPel0xkf8l1OVkmGrJ4Dr2rQIhinaNuM/Fht+9nYcjJt2NQVpLL88a8h0UdnnGbh4b4bIkeGq+bcHI07fbDf6OTylGtYDwWWYxBK0JY4LvDENjS83jSI2hbkMlqSKQZOKN4h9ZaxA/GautgTnEvh08saM250VolJ6geMNmeBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3JSHFIL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3JSHFIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782816817; x=1814352817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vm1W7qF7iTVTdfXIhEklLzJsANohLVBo4bfau7rOowg=;
  b=d3JSHFILC+DvaT/7QMr6kpj5+O5//uoaeQtay18JztYUPRxFxopUxobM
   qN552pkDhatcrYZxjsesJMPNO4jgqprjpI4daAj2ytm/NG+24sN3pPO/R
   pVtXo1rNqmZSHhEIeMOQmbbbbwzFXYxVBoQFKjKhwGfEY2GtwqymBCuCP
   +n08SrwbKqPWoDK1FFTFXtljvlorv0wzeS8vUt/aH4/cL6aLO8nf6RA/n
   8hAnRE9t5hcU0fctUs1Ay58rAVQhy24P7nT/63hGt6VaqSSUvYkNRJQ/8
   arBWanUIkKuljN+mCtb2rNa74SBbbXDXnjSJv5+Hx48ukodDoy1MnXBQB
   A==;
X-CSE-ConnectionGUID: Q5MTaCu0RUmUgqhIm4pQjA==
X-CSE-MsgGUID: s6ycVK4CTUWqBKdvOVR34w==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94677372"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="94677372"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 03:53:36 -0700
X-CSE-ConnectionGUID: 5hnJsCFLT9m93ZIDiWblCg==
X-CSE-MsgGUID: 5pN/WFjmTjemefnJLmUeIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="275469650"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Jun 2026 03:53:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weW5r-000000008HP-2arN;
	Tue, 30 Jun 2026 10:53:31 +0000
Date: Tue, 30 Jun 2026 18:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [thomas-weissschuh:b4/riscv-vdso32-alternative 5/9]
 arch/riscv/kernel/vdso.c:78:53: error: use of undeclared identifier
 '__vdso_futex_list64_try_unlock_cs_lrsc_start_offset'
Message-ID: <202606301855.WvkSC4kD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/riscv-vdso32-alternative
head:   a8d7e9eb82942f57e8a56aa6f2189a32ddf87667
commit: 10cd4cf20d3d92532485e3f0384e61abc90d6c54 [5/9] riscv: vdso: Implement __vdso_futex_robust_try_unlock()
config: riscv-randconfig-001-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301855.WvkSC4kD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301855.WvkSC4kD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301855.WvkSC4kD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/vdso.c:78:53: error: use of undeclared identifier '__vdso_futex_list64_try_unlock_cs_lrsc_start_offset'
      78 |         FUTEX_SET_VDSO_CS_RANGE(vdso, fd, 0, __riscv_xlen, __VDSO_SYMBOL);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/riscv/kernel/vdso.c:56:16: note: expanded from macro 'FUTEX_SET_VDSO_CS_RANGE'
      56 |         void *start = symbol(vdso, CONCAT3(futex_list, xlen, _try_unlock_cs_lrsc_start));       \
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso.c:68:36: note: expanded from macro '__VDSO_SYMBOL'
      68 | #define __VDSO_SYMBOL(vdso, name)               VDSO_SYMBOL(vdso, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/vdso.h:35:45: note: expanded from macro 'VDSO_SYMBOL'
      35 |           ((void __user *)((unsigned long)(base) + __vdso_##name##_offset))
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:128:1: note: expanded from here
     128 | __vdso_futex_list64_try_unlock_cs_lrsc_start_offset
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/vdso.c:78:53: error: use of undeclared identifier '__vdso_futex_list64_try_unlock_cs_lrsc_end_offset'
      78 |         FUTEX_SET_VDSO_CS_RANGE(vdso, fd, 0, __riscv_xlen, __VDSO_SYMBOL);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/riscv/kernel/vdso.c:57:16: note: expanded from macro 'FUTEX_SET_VDSO_CS_RANGE'
      57 |         void *end   = symbol(vdso, CONCAT3(futex_list, xlen, _try_unlock_cs_lrsc_end));         \
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso.c:68:36: note: expanded from macro '__VDSO_SYMBOL'
      68 | #define __VDSO_SYMBOL(vdso, name)               VDSO_SYMBOL(vdso, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/vdso.h:35:45: note: expanded from macro 'VDSO_SYMBOL'
      35 |           ((void __user *)((unsigned long)(base) + __vdso_##name##_offset))
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:132:1: note: expanded from here
     132 | __vdso_futex_list64_try_unlock_cs_lrsc_end_offset
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/__vdso_futex_list64_try_unlock_cs_lrsc_start_offset +78 arch/riscv/kernel/vdso.c

    70	
    71	static void vdso_futex_robust_unlock_update_ips(void)
    72	{
    73		unsigned long vdso = (unsigned long) current->mm->context.vdso;
    74		struct futex_mm_data *fd = &current->mm->futex;
    75	
    76		futex_reset_cs_ranges(fd);
    77	
  > 78		FUTEX_SET_VDSO_CS_RANGE(vdso, fd, 0, __riscv_xlen, __VDSO_SYMBOL);
    79	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
