Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424CE192D7C;
	Fri,  7 Mar 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741349209; cv=none; b=oCJAvP9SCGXZm2acmg96YQozeiQ5/yFKPocG9TkFT5afIG2cTNCejL0oO9dG1fTvtk93r7iVpnDmLNwcPy2e98LpPBMuRpdNpkTeA7bvIYDsNOOhLANcW8aAX/BLLvqIPbaz2Fk3gDYR8m51r6IM2xruW2CaLiSOM+SH9ADP7Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741349209; c=relaxed/simple;
	bh=R+Iwzp9qpg8PA6mDWBxkIegdVy0O7yqrJ2qo9DFLk14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2aYPCrAHytpjoc/eNzsJLmUBFL9uJqf64WHVGbz8PWABGydKjra8wEt0Spvofwcu5T3u+Qu7F7yxGg3SGOtTjbkEO5wFb2c5E+nYv3rne2hgczJjjSbKmbSoUZMV1G5aS0RTw+24jqU2aKAr1fUcTCCOI+Wp+v8j8qLSIg4iYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCjSDCKJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCjSDCKJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741349206; x=1772885206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R+Iwzp9qpg8PA6mDWBxkIegdVy0O7yqrJ2qo9DFLk14=;
  b=PCjSDCKJ3cpuZe25FPx0HmDZIJQIqTkSfoe/rCStagmcgHy74QR6NxxL
   kOjXO04Jv8He5MH6qh5aVdH2/FL5Op1Xvns+yABJgzMC4Gc+eVh3OxAvR
   CmHm1LEvwdr+qrrfhmPnLvYAAMisWzKmJCQKkH5SCbCu4VMpbi9lOJJfu
   pyhZkrgjdq9NnWCerKih2B9QRIvEq9dZzMiDlPp7pXvfgnOvZELhgoUIq
   NultlKBOAGIo0cG9okUdVtneVWTKfBj6E2niY26wLHSO3xd9/m9TIOBcY
   5kuK02hiJyyJZnXqjUtAErwsMQL1yJMTFlDMAHz6fpDfr2K87GiBCWY/9
   A==;
X-CSE-ConnectionGUID: yeGi9iccRg+AOCqleNi0FA==
X-CSE-MsgGUID: dQ5qrGcZSTWMQxs8u5jDHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42250758"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42250758"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 04:06:46 -0800
X-CSE-ConnectionGUID: COAx3TavSom7TNW/ldO0Bw==
X-CSE-MsgGUID: 9E1YBsozQ0u5XqqOLZoizw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119476457"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Mar 2025 04:06:46 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqWTS-0000Qw-0n;
	Fri, 07 Mar 2025 12:06:42 +0000
Date: Fri, 7 Mar 2025 20:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/arm-generic-entry-v6.14-rc1-cleanup-patch 33/33]
 arch/arm/kernel/entry-common.S:200:2: error: invalid instruction, any one of
 the following would fix this:
Message-ID: <202503072001.bAYqc08h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm-generic-entry-v6.14-rc1-cleanup-patch
head:   231c6ca98693dab095d461ce8d7bfdbf73b0f7e0
commit: 231c6ca98693dab095d461ce8d7bfdbf73b0f7e0 [33/33] ARM: entry: Straighten syscall returns
config: arm-randconfig-003-20250307 (https://download.01.org/0day-ci/archive/20250307/202503072001.bAYqc08h-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072001.bAYqc08h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072001.bAYqc08h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/kernel/entry-common.S:200:2: error: invalid instruction, any one of the following would fix this:
    b 9002
    ^
   arch/arm/kernel/entry-common.S:200:4: note: invalid operand for instruction
    b 9002
      ^
   arch/arm/kernel/entry-common.S:200:2: note: instruction requires: thumb
    b 9002
    ^


vim +200 arch/arm/kernel/entry-common.S

   166	
   167		/* saved_psr and saved_pc are now dead */
   168	
   169		uaccess_disable tbl
   170		get_thread_info tsk
   171		/* Save a per-task copy of SP for sigreturn */
   172		str	sp, [tsk, #TI_SP_SYSCALL]
   173	
   174		adr	tbl, sys_call_table		@ load syscall table pointer
   175	
   176	#if defined(CONFIG_OABI_COMPAT)
   177		/*
   178		 * If the swi argument is zero, this is an EABI call and we do nothing.
   179		 *
   180		 * If this is an old ABI call, get the syscall number into scno and
   181		 * get the old ABI syscall table address.
   182		 */
   183		bics	r10, r10, #0xff000000
   184		strne	r10, [tsk, #TI_ABI_SYSCALL]
   185		streq	scno, [tsk, #TI_ABI_SYSCALL]
   186		eorne	scno, r10, #__NR_OABI_SYSCALL_BASE
   187		ldrne	tbl, =sys_oabi_call_table
   188	#elif !defined(CONFIG_AEABI)
   189		bic	scno, scno, #0xff000000		@ mask off SWI op-code
   190		str	scno, [tsk, #TI_ABI_SYSCALL]
   191		eor	scno, scno, #__NR_SYSCALL_BASE	@ check OS number
   192	#else
   193		str	scno, [tsk, #TI_ABI_SYSCALL]
   194	#endif
   195		mov	r1, sp				@ put regs into r1
   196		stmdb	sp!, {r4, r5}			@ push fifth and sixth args
   197		mov	r0, tbl
   198		mov	r2, scno			@ syscall number from r7
   199		bl	invoke_syscall
 > 200		b	9002
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
