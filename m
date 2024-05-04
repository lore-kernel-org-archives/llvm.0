Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361F571747;
	Sat,  4 May 2024 18:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714848287; cv=none; b=Fewf/5yTFEY3n38afOVjG1om/QTvu9hO50zvfdk78HD9U4NkQl2dGHxQJ7qRg+T0VzjQF2regJQuk87Qy8iZbi+CE2ecu083g4lSiZ8irOkcBCyv1sPIXpifGFY5ZbZKMQ04aZA5xeuN+unMFk85klyNXHNbkD7GZlvSfLGk6bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714848287; c=relaxed/simple;
	bh=YeP0bgsGBGJPSt2o1V1tiRCIlXkeWM2GwjMibri9IhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNMeba9dFKsI0W8UpU16O6CbIq/4wkKStCzbPQJfZexAt741g5IpsPBp0IMNNbLAbalDRvrCdiIBQBplegIt+TGJ4Xr4AGwQPvBxQonBkVqOMV8BWPjp5GigN6Ju1qsyGh+BRBCI6Rzz+hrpDw+1GkeIMJY4x9l3r1ZSfjeRR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOuClivj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOuClivj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714848286; x=1746384286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YeP0bgsGBGJPSt2o1V1tiRCIlXkeWM2GwjMibri9IhY=;
  b=LOuClivjBJwSVBJSkMDUdkKHJuwZyPM47vT7QYYuvgUoFfKEF+vUOurG
   +CBJAmNMWymCMeuwIByS7/xqNMYEq3LI6LT6klL3S47wZnnbgW1kB0nqT
   +PUAgDHs1WtPtADaxpNtL0PnYuK1LicWEzKxJ9tcc14YDNmDNY9N61E//
   Hcg5+3xR4knZVUb+n8vLsEZstyU5vGukJr34Tkf50TkOEOfDDi3l7ZZ+i
   RIof0oda5Dhvqn/1y9ExKD9KzluOORi/WHM0ob8hU5OrNIh7s1lCejOXZ
   CgDONJysMbkflL53dhJHt50F3gbIPT4QYq5QqokNgyUhYFxci5jPAwjaa
   Q==;
X-CSE-ConnectionGUID: RWkJXqpwTC6BKq9bFB8CZA==
X-CSE-MsgGUID: INfV+z4QTSuSSpHPu3Pysw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28113164"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="28113164"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 11:44:45 -0700
X-CSE-ConnectionGUID: vPJCxT6rRd6KoVrvF2c9dA==
X-CSE-MsgGUID: 74hSU5XbTp2Owzn2cEO/xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="32225668"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 May 2024 11:44:44 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3KNG-000D4m-0o;
	Sat, 04 May 2024 18:44:42 +0000
Date: Sun, 5 May 2024 02:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kvm-ppc@vger.kernel.org
Subject: [agraf-2.6:kvm-kho-gmem-test 26/27] kernel/time/sched_clock.c:76:49:
 error: call to undeclared function 'read_sysreg'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202405050219.81JETL6w-lkp@intel.com>
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
config: mips-vocore2_defconfig (https://download.01.org/0day-ci/archive/20240505/202405050219.81JETL6w-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050219.81JETL6w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050219.81JETL6w-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/sched_clock.c:76:49: error: call to undeclared function 'read_sysreg'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   clocks_calc_mult_shift(&rd->mult, &rd->shift, read_sysreg(cntfrq_el0), NSEC_PER_SEC, 600);
                                                                 ^
   kernel/time/sched_clock.c:76:61: error: use of undeclared identifier 'cntfrq_el0'
                   clocks_calc_mult_shift(&rd->mult, &rd->shift, read_sysreg(cntfrq_el0), NSEC_PER_SEC, 600);
                                                                             ^
   kernel/time/sched_clock.c:183:27: warning: variable 'new_epoch' set but not used [-Wunused-but-set-variable]
           u64 res, wrap, new_mask, new_epoch, cyc, ns;
                                    ^
   kernel/time/sched_clock.c:183:43: warning: variable 'ns' set but not used [-Wunused-but-set-variable]
           u64 res, wrap, new_mask, new_epoch, cyc, ns;
                                                    ^
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
