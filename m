Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E5015BB;
	Fri, 22 Mar 2024 04:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711082535; cv=none; b=Jtkbx9smj0mpG32RNRdV6c+EglUq6rPwYqMiWTkyojfMPuQj4sxgHkOcKF9USLZKvTbRctVSuJIi7gW7k21ZlgeqhxRO4npFrmkMd95q/CsYQApIghccsuG+gJ7vAsHRTomAf7Mlwk9mcHKLm7gylA34fTqUoftnAye8G7XGdtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711082535; c=relaxed/simple;
	bh=nJKMQMz089RFkjTj6aFfHEqaQAIthw1uF1M2pGy8gh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b4Uj1izMAuTdtSGQDKfh6dfHDOzJ/1pLQmKsCLWqa8GceBLKdb/xlCx6Ia6z7974lNtD1wD/y8Kjkx1aeRkdILJa2J/lL7DWyLjx7tWRdfzGQeghLYMzIepgLy7YtDUpdQhsOeFV8G79cpOh4dm3Det9gowEtRtdf0tNQAjsvbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9pXki2D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9pXki2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711082533; x=1742618533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nJKMQMz089RFkjTj6aFfHEqaQAIthw1uF1M2pGy8gh8=;
  b=T9pXki2Dc8/wx3LIadcIxN7OsDhPZGhnJsUjenZW0NQ0vZu1jKmhCjRk
   972j6IeZ7mBZhJ+pxSLx7348xhD7Dxv3qPg7USFo+OjLQTPOovc8sIHfO
   YGVd/2chu6LBqYJRbgCZ+xj9hqnrC5DiPfYTrX9bg00AlunmxwCVLta9X
   kjm3RFMeRouB0hT0I7689tE0MTbsxbnknxzdoIbFmXLiIrfknp54ctjmP
   yXPU/zkHpA1EbWLHLL7ZKA/uqvZSm97Qpohcg2rW8FZyxQOjXT/dLX7sP
   zhtFYBtm2usYTaqdRMuqrfaU+oCvvjGcgATXHSOD3W5yk83uUmAh51NAi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16751935"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="16751935"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 21:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="19465957"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Mar 2024 21:42:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnWjJ-000K2H-2e;
	Fri, 22 Mar 2024 04:42:09 +0000
Date: Fri, 22 Mar 2024 12:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-remove-absolute-percpu 3/5]
 arch/x86/kernel/cpu/common.c:762:22: error: call to undeclared function
 'per_cpu_offset'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202403221215.FeIdb2PC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-remove-absolute-percpu
head:   811d6eeae9abffb646afa9c418d4658e6d91cdd6
commit: 82b7a620962b18edb7cb6eaca34fd0bd06073611 [3/5] x86/percpu: Get rid of absolute per-CPU variable placement
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240322/202403221215.FeIdb2PC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403221215.FeIdb2PC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403221215.FeIdb2PC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/common.c:762:22: error: call to undeclared function 'per_cpu_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     762 |         wrmsrl(MSR_GS_BASE, per_cpu_offset(cpu));
         |                             ^
   1 error generated.


vim +/per_cpu_offset +762 arch/x86/kernel/cpu/common.c

   733	
   734	/**
   735	 * switch_gdt_and_percpu_base - Switch to direct GDT and runtime per CPU base
   736	 * @cpu:	The CPU number for which this is invoked
   737	 *
   738	 * Invoked during early boot to switch from early GDT and early per CPU to
   739	 * the direct GDT and the runtime per CPU area. On 32-bit the percpu base
   740	 * switch is implicit by loading the direct GDT. On 64bit this requires
   741	 * to update GSBASE.
   742	 */
   743	void __init switch_gdt_and_percpu_base(int cpu)
   744	{
   745		load_direct_gdt(cpu);
   746	
   747	#ifdef CONFIG_X86_64
   748		/*
   749		 * No need to load %gs. It is already correct.
   750		 *
   751		 * Writing %gs on 64bit would zero GSBASE which would make any per
   752		 * CPU operation up to the point of the wrmsrl() fault.
   753		 *
   754		 * Set GSBASE to the new offset. Until the wrmsrl() happens the
   755		 * early mapping is still valid. That means the GSBASE update will
   756		 * lose any prior per CPU data which was not copied over in
   757		 * setup_per_cpu_areas().
   758		 *
   759		 * This works even with stackprotector enabled because the
   760		 * per CPU stack canary is 0 in both per CPU areas.
   761		 */
 > 762		wrmsrl(MSR_GS_BASE, per_cpu_offset(cpu));
   763	#else
   764		/*
   765		 * %fs is already set to __KERNEL_PERCPU, but after switching GDT
   766		 * it is required to load FS again so that the 'hidden' part is
   767		 * updated from the new GDT. Up to this point the early per CPU
   768		 * translation is active. Any content of the early per CPU data
   769		 * which was not copied over in setup_per_cpu_areas() is lost.
   770		 */
   771		loadsegment(fs, __KERNEL_PERCPU);
   772	#endif
   773	}
   774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
