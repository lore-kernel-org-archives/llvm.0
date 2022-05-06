Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731B87E8
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 07:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651822647; x=1683358647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=toIf4riM0fUf3p8/OWQt28q5FFGojcylLaM+ORZAoXw=;
  b=cOP49FkJgoCmo3Bus8Hbyf0+rZo5DRRjZCyTMpPmErj+bwdE1ZvnKEY5
   +QhGDY2ZD884WkGIO1m0ZJhuH8u6PPROWxKz/lnaKw0NTXknTeYp8JVue
   tDBOk19q0uOVQkx1pGUuDa4//hX5rRNwpOfGidbfUgGArQEcnanjGSwCp
   HtSI2aI7FkkR4gldK5wDZ8htvcJ09yR7Rd12MLShn8ypCqYw4PRDaKHzi
   FWFu3H2aWg5yef5o6fnoCmURlvAl4BGY/MTZmoIiyTs8o4GhEhhMY4qt7
   /Q9x+Ajyr/G5KpjDujP6LnfDFxrua1YVKs19yvatiZPih/+O3V/TDhQsx
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="267222958"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="267222958"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 00:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="695045803"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 May 2022 00:37:25 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmsWi-000DFw-L5;
	Fri, 06 May 2022 07:37:24 +0000
Date: Fri, 6 May 2022 15:36:55 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [intel-tdx:kvm-upstream-workaround 292/361]
 arch/x86/virt/vmx/tdx/tdx_debug.c:38:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202205061552.nQdkBaVb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   3b5b338cdf10dca7a2435d1f86b2dd9f1a3ad833
commit: 35b7a73dd22642a50aa614a812f76289a59d1509 [292/361] [REVERTME] debugfs to operation on TDX debug op
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220506/202205061552.nQdkBaVb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/35b7a73dd22642a50aa614a812f76289a59d1509
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 35b7a73dd22642a50aa614a812f76289a59d1509
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/virt/vmx/tdx/tdx_debug.c:38:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (debugconfig_supported) {
               ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/virt/vmx/tdx/tdx_debug.c:46:10: note: uninitialized use occurs here
           return  ret;
                   ^~~
   arch/x86/virt/vmx/tdx/tdx_debug.c:38:2: note: remove the 'if' if its condition is always true
           if (debugconfig_supported) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/virt/vmx/tdx/tdx_debug.c:36:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +38 arch/x86/virt/vmx/tdx/tdx_debug.c

    32	
    33	static inline u64 tddebugconfig(u64 subleaf, u64 param1, u64 param2)
    34	{
    35		static bool debugconfig_supported = true;
    36		int ret;
    37	
  > 38		if (debugconfig_supported) {
    39			ret = __seamcall(SEAMCALL_TDDEBUGCONFIG, subleaf, param1, param2, 0, NULL);
    40			if (ret) {
    41				pr_info("DEBUGCONFIG SEAMCALL isn't supported.\n");
    42				debugconfig_supported = false;
    43			}
    44		}
    45	
    46		return  ret;
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
