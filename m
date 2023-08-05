Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1431FDD;
	Sat,  5 Aug 2023 07:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691221586; x=1722757586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uw6+D0OtRktOBAWSzz0JbXEMvtwVQbFplzqnJu150QA=;
  b=fUgci8oEP40VT/r/BB3Menob9WrCjFtNC21ZWNRflsyQGsAJM+wZTC7T
   RyEbyJ7AO0HBFi/aItqk51RWIKMuR+/5Kxk+Tk/NUWoivGKHMD0vYCPyx
   R2ryPHFZLNl12pE3AuTcyKCmfXx0PvIOCb+C6Sxwpdjy9wYQBc4wrZB0m
   0x1xoyul+rg9cOKiNfHJCW6FRC7iSpoDbps3CJ00WcE1QQ+aEfm+E641A
   G8CsTLETSwUE8r6TQFxBCsETdhclQl81kK8wzLzNxY8h3her9+ifwpq4E
   GIJ1R4VFxPTA+UUn9nuWTPe6F3tVcFzYZNT8d7G2rydXDhqFzi481kwcd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="373954831"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="373954831"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 00:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="976854029"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="976854029"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Aug 2023 00:46:22 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSBzR-0003Oh-39;
	Sat, 05 Aug 2023 07:46:21 +0000
Date: Sat, 5 Aug 2023 15:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [hyperv:hyperv-next 7/8] arch/x86/include/asm/mshyperv.h:251:61:
 error: non-void function does not return a value
Message-ID: <202308051539.HHD8Ctsx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   3a5274c555c28bd6906103b0d9bbfd6e9e9df1ff
commit: 78812dcc77c23c72b019e517b296f15943922bd7 [7/8] x86/hyperv: Add smp support for SEV-SNP guest
config: i386-randconfig-i012-20230731 (https://download.01.org/0day-ci/archive/20230805/202308051539.HHD8Ctsx-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308051539.HHD8Ctsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308051539.HHD8Ctsx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hv/channel.c:22:
>> arch/x86/include/asm/mshyperv.h:251:61: error: non-void function does not return a value [-Werror,-Wreturn-type]
   static int hv_snp_boot_ap(int cpu, unsigned long start_ip) {}
                                                               ^
   1 error generated.


vim +251 arch/x86/include/asm/mshyperv.h

   237	
   238	#ifdef CONFIG_AMD_MEM_ENCRYPT
   239	void hv_ghcb_msr_write(u64 msr, u64 value);
   240	void hv_ghcb_msr_read(u64 msr, u64 *value);
   241	bool hv_ghcb_negotiate_protocol(void);
   242	void __noreturn hv_ghcb_terminate(unsigned int set, unsigned int reason);
   243	void hv_vtom_init(void);
   244	int hv_snp_boot_ap(int cpu, unsigned long start_ip);
   245	#else
   246	static inline void hv_ghcb_msr_write(u64 msr, u64 value) {}
   247	static inline void hv_ghcb_msr_read(u64 msr, u64 *value) {}
   248	static inline bool hv_ghcb_negotiate_protocol(void) { return false; }
   249	static inline void hv_ghcb_terminate(unsigned int set, unsigned int reason) {}
   250	static inline void hv_vtom_init(void) {}
 > 251	static int hv_snp_boot_ap(int cpu, unsigned long start_ip) {}
   252	#endif
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
