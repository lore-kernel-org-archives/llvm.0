Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA2C211A;
	Tue,  5 Dec 2023 05:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpXHbQ6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701752467; x=1733288467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=725zDhT1e51hGAdEEjMz/nEMZUS9ntbobbQ6NcQXEmY=;
  b=YpXHbQ6OwEEhIRV/DFPcrdvab8E8pp3wlq7Iphh3WcH07rjPOOH8IL1Q
   6ui0zW2Mmk3f3eFkbVTbXbBHSRfhqoH5oW+q6O0hipwJyqvitqo8307ku
   wXVzzLzCtufhtPozPCmkQ8qzIeQDw8R2Aiq9XnHWj+8m7PfRM554vx2kn
   5QRP8yp9Ed4a2Jcz05DRxP1cOo7bc38Wu2JoXTj/Wz4xg+oInmOnfVHEf
   xuhiLGPyMF9MbwYox5kzZgJxQiwgZvE/lnrP6hEauiLQxqSBFiM8AnKrk
   K1euwhnHlzJzBuWen3qDOzgfxjipgvqOA0TQPkDS282e8O1NW9Q5+S5iy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7132602"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="7132602"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 21:01:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="861628416"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="861628416"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 21:01:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rANYN-0008MK-12;
	Tue, 05 Dec 2023 05:01:03 +0000
Date: Tue, 5 Dec 2023 13:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:dynamic-hz 1/1] include/asm-generic/param.h:7:34:
 error: expected ';' after top level declarator
Message-ID: <202312051216.mZqOslKz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux dynamic-hz
head:   ccfcc35f75018f05039a35c98e4685ea5ce32ab5
commit: ccfcc35f75018f05039a35c98e4685ea5ce32ab5 [1/1] HZ: Allow modifying HZ at boot time
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231205/202312051216.mZqOslKz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051216.mZqOslKz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051216.mZqOslKz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:295:
   In file included from include/linux/fortify-string.h:5:
   In file included from include/linux/bug.h:5:
   In file included from arch/x86/include/asm/bug.h:87:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:6:
   In file included from include/uapi/linux/param.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/param.h:1:
>> include/asm-generic/param.h:7:34: error: expected ';' after top level declarator
   extern unsigned int __read_mostly __kernel_hz;
                                    ^
                                    ;
   1 error generated.
   make[3]: *** [scripts/Makefile.build:116: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1190: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +7 include/asm-generic/param.h

     6	
   > 7	extern unsigned int __read_mostly __kernel_hz;
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
