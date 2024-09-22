Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6F113174B;
	Sun, 22 Sep 2024 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727006877; cv=none; b=DUUkZuwotm6OWKZbyQze+6Fn6gnb4LkTDcAQC13gm0siV2G7nfVqIakInB0GYXtdMp3o+xxk0hFLyWDzpr+hoJdnfkHm5mQxNCgt7i8xUVFhgDNgxF1jxKM/6OSGyxySAF1BnaHiMsonTNH8lhIkbZAfQaDdkVwXCVdjS5pwDJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727006877; c=relaxed/simple;
	bh=6Yn20Cb26XflRJmGempQTmukZeHYKOIL6db8imNJFxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=olAQNDfZth/DT3ANf4TNcLBuFuNJynEN5msjFhxzbY+CTa8FYL6h6bv/VtpJQ+N4WtiLkEJbnInhwyTzALYPLj13d+eSBRHcHF0ZnMfxp2AbgwS8bT+0BisAm+GlF6MegrGuDkBKkxmrmkB5nzoEw/ZYHUFr0nhnWw+VkzyfdqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Scxol5WI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Scxol5WI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727006875; x=1758542875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Yn20Cb26XflRJmGempQTmukZeHYKOIL6db8imNJFxE=;
  b=Scxol5WIhgwCdc44NfjoecmjUps+/sJm2MidaIFj1U8FF4WEq5MGlFw7
   JD7tW8tqzRaLNwIidFqc1h4YCMS6Hto1JCJRXPg8ARRtzI5+M19UFU4og
   EqONEQSeQLmYb02nxHPpSuOoHFR7ZJbCbQpsJh+ateoZUGTVeQ0DwVSbi
   j9nhppDa5/T0DjvENLzkqcIHrLFxKpocR3m/1c5OrO1HLUzWqxPaMRqG5
   bEwzODssxGmZAHtDZzjNVtAHGYkQQ55uaREliESfyX0WosYa7SNgul33+
   XNRpNSE1FW6haqr7XwE+Y4b2HiDTU9RPbuQZyZCFZzZHrRmOXz6owCIi1
   Q==;
X-CSE-ConnectionGUID: A290L9zLS5eW8ciAD43cGA==
X-CSE-MsgGUID: Naup2/fxQciSSpKXOLflkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36624804"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="36624804"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 05:07:54 -0700
X-CSE-ConnectionGUID: tSwRNaicS8GK2BpnVBXfqg==
X-CSE-MsgGUID: INf2E4iQToS+dpIWvgkoPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="70671955"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Sep 2024 05:07:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssLNW-000GJ6-2Z;
	Sun, 22 Sep 2024 12:07:50 +0000
Date: Sun, 22 Sep 2024 20:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 5/13] arch/x86/kernel/cpu/common.c:763:22: error:
 call to undeclared function 'per_cpu_offset'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202409222044.9qXlncXt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   14ae2a343392bbe36953a6a4088b44a50c4f9611
commit: 4f9082c38c9d2268ddccecf03551c99ca49933bc [5/13] x86/percpu: Get rid of absolute per-CPU variable placement
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240922/202409222044.9qXlncXt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409222044.9qXlncXt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409222044.9qXlncXt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/common.c:763:22: error: call to undeclared function 'per_cpu_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     763 |         wrmsrl(MSR_GS_BASE, per_cpu_offset(cpu));
         |                             ^
   1 error generated.


vim +/per_cpu_offset +763 arch/x86/kernel/cpu/common.c

   734	
   735	/**
   736	 * switch_gdt_and_percpu_base - Switch to direct GDT and runtime per CPU base
   737	 * @cpu:	The CPU number for which this is invoked
   738	 *
   739	 * Invoked during early boot to switch from early GDT and early per CPU to
   740	 * the direct GDT and the runtime per CPU area. On 32-bit the percpu base
   741	 * switch is implicit by loading the direct GDT. On 64bit this requires
   742	 * to update GSBASE.
   743	 */
   744	void __init switch_gdt_and_percpu_base(int cpu)
   745	{
   746		load_direct_gdt(cpu);
   747	
   748	#ifdef CONFIG_X86_64
   749		/*
   750		 * No need to load %gs. It is already correct.
   751		 *
   752		 * Writing %gs on 64bit would zero GSBASE which would make any per
   753		 * CPU operation up to the point of the wrmsrl() fault.
   754		 *
   755		 * Set GSBASE to the new offset. Until the wrmsrl() happens the
   756		 * early mapping is still valid. That means the GSBASE update will
   757		 * lose any prior per CPU data which was not copied over in
   758		 * setup_per_cpu_areas().
   759		 *
   760		 * This works even with stackprotector enabled because the
   761		 * per CPU stack canary is 0 in both per CPU areas.
   762		 */
 > 763		wrmsrl(MSR_GS_BASE, per_cpu_offset(cpu));
   764	#else
   765		/*
   766		 * %fs is already set to __KERNEL_PERCPU, but after switching GDT
   767		 * it is required to load FS again so that the 'hidden' part is
   768		 * updated from the new GDT. Up to this point the early per CPU
   769		 * translation is active. Any content of the early per CPU data
   770		 * which was not copied over in setup_per_cpu_areas() is lost.
   771		 */
   772		loadsegment(fs, __KERNEL_PERCPU);
   773	#endif
   774	}
   775	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
