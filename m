Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248C026B77D;
	Fri, 10 Oct 2025 20:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760127984; cv=none; b=MOdolu/lnM3FS9GpRLIPr6TdTnF0e5B7sQQ6DBB8EiP38BtWTZP5C9Bk5mwSbtfQVlQVYMPOSrHyPQuiEkMlUSH85F/dVVZ2c2zf3uOp7fyfDTJ2/nR6sWqIT1IK7tVrHjXHr1eOyyR7Z0vAM2FAAWVb8alPriJamIRx/OXS1W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760127984; c=relaxed/simple;
	bh=9Nkt3qD9mO43UJxeJX7roK0mxjtAID4KVzCqRRVtgGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kVMcda2XMtsXREKDKCxU6oJE8FqGwh3tRBQfG6scglsDHgb/7xLpGxfeiP5t2ZFOJ/ysayuedTNA9Sis8M3zbMKESHvvDpPqG7eH8ItQgsnmHOUIJjxvk0IJnc+pbNCvZx5jmx2S3b0AJaVuJbNxQ09wf/7+pf2l6SGBdPyMBY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R37D6q/b; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R37D6q/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760127983; x=1791663983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Nkt3qD9mO43UJxeJX7roK0mxjtAID4KVzCqRRVtgGw=;
  b=R37D6q/b3/jr5M3MlM2PKd/amYuWaHHwx1NFcd4UMNgCvn1FL5ad4H4g
   W9ydtVFoyQvZC93lwwCLSCiqAmxusFHgkhWTDXyv21Au/7X4Xpv6Wfg4M
   puqKhetoAH6RpOPCNmfd2etVX9OACKRI5PJlK+26FfPGTU1nqXE2OHOJC
   BAm2XQcSQbtIwBJ3IryIWXzrJHZsOxJPP13A1WKj8c+XfylhWs7WtWRsN
   2iC4KPwS+yvCm6mRODIZJ5Z05JnZSe26Qg3eYE06DeOW/j5WeztvSwwDf
   w4cvHCqP55ubyQEdC/1XxuLa84RJOTbeChpdG/BPf21QaDHZaE3pL93A2
   Q==;
X-CSE-ConnectionGUID: FIfyuRnkQqu8IXzEY/hpSg==
X-CSE-MsgGUID: bXLCqeikStesQmQo/pq+wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="64974404"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="64974404"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 13:26:22 -0700
X-CSE-ConnectionGUID: mT4QdCroSLeq9I3WxNRdww==
X-CSE-MsgGUID: zCoF4rMKRmS1ReJe5Bmdzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="181010993"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2025 13:26:21 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Jgx-000395-15;
	Fri, 10 Oct 2025 20:26:19 +0000
Date: Sat, 11 Oct 2025 04:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/midr-cleanup 8/9]
 drivers/char/hw_random/cavium-rng-vf.c:41:47: error: use of undeclared
 identifier 'MIDR_THUNDERX_83XX'
Message-ID: <202510110450.sB27sg1e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/midr-cleanup
head:   618c85796192e749547d92f873bce0fed4d4d146
commit: 56d09155630e4aa4fcbffac9fefaac63ed0ab349 [8/9] WIP: arm64: cputype: Delete unused MIDR definitions
config: arm64-randconfig-003-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110450.sB27sg1e-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110450.sB27sg1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110450.sB27sg1e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/hw_random/cavium-rng-vf.c:41:47: error: use of undeclared identifier 'MIDR_THUNDERX_83XX'
      41 |         if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
         |                                                      ^
>> drivers/char/hw_random/cavium-rng-vf.c:44:47: error: use of undeclared identifier 'MIDR_THUNDERX_81XX'
      44 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_81XX,
         |                                                      ^
>> drivers/char/hw_random/cavium-rng-vf.c:47:47: error: use of undeclared identifier 'MIDR_THUNDERX'
      47 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX,
         |                                                      ^
>> drivers/char/hw_random/cavium-rng-vf.c:41:47: error: use of undeclared identifier 'MIDR_THUNDERX_83XX'
      41 |         if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
         |                                                      ^
>> drivers/char/hw_random/cavium-rng-vf.c:44:47: error: use of undeclared identifier 'MIDR_THUNDERX_81XX'
      44 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_81XX,
         |                                                      ^
>> drivers/char/hw_random/cavium-rng-vf.c:47:47: error: use of undeclared identifier 'MIDR_THUNDERX'
      47 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX,
         |                                                      ^
>> drivers/char/hw_random/cavium-rng-vf.c:41:47: error: use of undeclared identifier 'MIDR_THUNDERX_83XX'
      41 |         if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
         |                                                      ^
>> drivers/char/hw_random/cavium-rng-vf.c:44:47: error: use of undeclared identifier 'MIDR_THUNDERX_81XX'
      44 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_81XX,
         |                                                      ^
>> drivers/char/hw_random/cavium-rng-vf.c:47:47: error: use of undeclared identifier 'MIDR_THUNDERX'
      47 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX,
         |                                                      ^
   9 errors generated.


vim +/MIDR_THUNDERX_83XX +41 drivers/char/hw_random/cavium-rng-vf.c

cc2f1908c6b8f6 Omer Khaliq   2016-08-23  38  
680efb33546be8 Sunil Goutham 2021-10-29  39  static inline bool is_octeontx(struct pci_dev *pdev)
680efb33546be8 Sunil Goutham 2021-10-29  40  {
680efb33546be8 Sunil Goutham 2021-10-29 @41  	if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
680efb33546be8 Sunil Goutham 2021-10-29  42  				    MIDR_CPU_VAR_REV(0, 0),
680efb33546be8 Sunil Goutham 2021-10-29  43  				    MIDR_CPU_VAR_REV(3, 0)) ||
680efb33546be8 Sunil Goutham 2021-10-29 @44  	    midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_81XX,
680efb33546be8 Sunil Goutham 2021-10-29  45  				    MIDR_CPU_VAR_REV(0, 0),
680efb33546be8 Sunil Goutham 2021-10-29  46  				    MIDR_CPU_VAR_REV(3, 0)) ||
680efb33546be8 Sunil Goutham 2021-10-29 @47  	    midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX,
680efb33546be8 Sunil Goutham 2021-10-29  48  				    MIDR_CPU_VAR_REV(0, 0),
680efb33546be8 Sunil Goutham 2021-10-29  49  				    MIDR_CPU_VAR_REV(3, 0)))
680efb33546be8 Sunil Goutham 2021-10-29  50  		return true;
680efb33546be8 Sunil Goutham 2021-10-29  51  
680efb33546be8 Sunil Goutham 2021-10-29  52  	return false;
680efb33546be8 Sunil Goutham 2021-10-29  53  }
680efb33546be8 Sunil Goutham 2021-10-29  54  

:::::: The code at line 41 was first introduced by commit
:::::: 680efb33546be8960ccbb2f4e0e43034d9c93b30 hwrng: cavium - Check health status while reading random data

:::::: TO: Sunil Goutham <sgoutham@marvell.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
