Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA084122C;
	Sat,  4 May 2024 19:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714849669; cv=none; b=lZpUSmZcr3l7Hq0pSbOIsftdlvmsN6Po4xQYZJ53KSSm0Ku0+kA4TIZ3MPSWkff+JRticNRoTKEJBalOLPnrCkGTy9owhZRT59JwGOCcp31kpAd3UVNYYtlRLgpOlMSXggdnxcm21LWcJ0tYPKCaBYrVCs73FnCp/IYgOlOJeng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714849669; c=relaxed/simple;
	bh=Bn5OCPgnnnAJgLYB8urvyWd76V5wsD6EF/aRqDYSAZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eBDegq4i2ZGQWVF/Kxn7FmPSQuMGxwMxaMimyhOpgnDuH2fFetKlE2HyK/91FAJk45ehGshLzeWDU6OODZjgjNLMcW7TdNw7oUr4tRRebW4Sv0GFaUSFkiXDlV2FFJM+NdkNFYGtJ/vfcWHFpSUJX1GUSQ2uXPV+lOOCPBFz9IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJDWis8T; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJDWis8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714849667; x=1746385667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bn5OCPgnnnAJgLYB8urvyWd76V5wsD6EF/aRqDYSAZA=;
  b=hJDWis8TYBsFAeHaFdGFU+8lN48YF6Eg0iEKxIwKT/whoV2VxSTKm3zN
   p9pK2a5GE5+6l7Ryu/nmzqLqhIwjU/m1d8n7kDSwlSr/TP/CG4S4C1cjS
   Lc7bAe39xJnaZkNkLx3mH5f/Ff8ye66G+bkCNLjq6/wpOcbyBQggnOW1w
   +l2wT3y39d4gFk5Aq6inoGGoyxCr7bNFLLPybIQNVJPNlSJ9vQCMhC3UR
   zAK2b1pLAn0gHOiTTSM62SPjZkvffeZJr0gvAWRD+4PYOzS7BUoHMan76
   2MfdG+EIHMP49VWU6iMdqtlNXIoqt8LO9t7hdf6NZJsNgCVGT1xq4p67Q
   A==;
X-CSE-ConnectionGUID: x9ihpLabTiiXlRXwweuEAA==
X-CSE-MsgGUID: bIngPW3dTZ+SutnIXhTYzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21792285"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="21792285"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 12:07:46 -0700
X-CSE-ConnectionGUID: tQOCUuirSgmGGGshzxHU3w==
X-CSE-MsgGUID: fYVl3ue4RYivKjj3/SPGbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="32229092"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 May 2024 12:07:45 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3KjW-000D6E-3A;
	Sat, 04 May 2024 19:07:42 +0000
Date: Sun, 5 May 2024 03:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kvm-ppc@vger.kernel.org
Subject: [agraf-2.6:kvm-kho-gmem-test 26/27] kernel/time/sched_clock.c:76:49:
 error: call to undeclared function 'read_sysreg'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202405050255.uiq0NPjq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/agraf/linux-2.6.git kvm-kho-gmem-test
head:   9a58862a298a63bad21d05191e28b857063bb9dc
commit: 12b2509463b155fec805d7fb2ecbef3aafbd2414 [26/27] XXX arm: make early time stamps contiguous
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240505/202405050255.uiq0NPjq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050255.uiq0NPjq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050255.uiq0NPjq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/sched_clock.c:76:49: error: call to undeclared function 'read_sysreg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      76 |                 clocks_calc_mult_shift(&rd->mult, &rd->shift, read_sysreg(cntfrq_el0), NSEC_PER_SEC, 600);
         |                                                               ^
>> kernel/time/sched_clock.c:76:61: error: use of undeclared identifier 'cntfrq_el0'
      76 |                 clocks_calc_mult_shift(&rd->mult, &rd->shift, read_sysreg(cntfrq_el0), NSEC_PER_SEC, 600);
         |                                                                           ^
   kernel/time/sched_clock.c:183:27: warning: variable 'new_epoch' set but not used [-Wunused-but-set-variable]
     183 |         u64 res, wrap, new_mask, new_epoch, cyc, ns;
         |                                  ^
   kernel/time/sched_clock.c:183:43: warning: variable 'ns' set but not used [-Wunused-but-set-variable]
     183 |         u64 res, wrap, new_mask, new_epoch, cyc, ns;
         |                                                  ^
   2 warnings and 2 errors generated.


vim +/read_sysreg +76 kernel/time/sched_clock.c

    69	
    70	static void cd_early_init(void)
    71	{
    72		static bool is_initialized;
    73		struct clock_read_data *rd = &cd.read_data[0];
    74	
    75		if (!is_initialized) {
  > 76			clocks_calc_mult_shift(&rd->mult, &rd->shift, read_sysreg(cntfrq_el0), NSEC_PER_SEC, 600);
    77			is_initialized = true;
    78		}
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
