Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4249F7E
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 10:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646823525; x=1678359525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SqqKqJwel56I/p78Nxema8iyKpDbYSQbjl0FOHA7r2I=;
  b=aXD/FtWnUDdeKYqm8YpoMnxitWyZEttuU7EMKeGzO5d4sojgwasKsNue
   3FyebkpiR5xorhX0LHXMnBM/zJXdnPpNOAy6WHY0A8H6/JY29H6Ix4jRH
   iWbT2gewtmcoQSsrlv5WEupxWbQXcYoszySBxxQBPef0EWeoxk++Pv3Xs
   QdK2bbNDBiT6v3EWJ6Uo0XiZ9UTZIHJ74jtjBtXGV7pY7Gpz4QuPmmu0W
   wowSWU6O7GzjqYyt/rdUwCXNrXX7XhuC7Sl0xJX6DcAIIYc4JnnKH8bt6
   /9Cy3OAgI2DGTnQrLGpMcbJyQS3U4gA811lf1GoED+spRVvxYFgzq+BVB
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="242391942"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="242391942"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 02:58:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="513486040"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Mar 2022 02:58:04 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRu16-00037j-3K; Wed, 09 Mar 2022 10:58:04 +0000
Date: Wed, 9 Mar 2022 18:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Chenyi Qiang <chenyi.qiang@intel.com>
Subject: [intel-tdx:kvm 24/193] arch/x86/kernel/cpu/tsx.c:186:5: warning: no
 previous prototype for function 'tsx_ctrl_clear'
Message-ID: <202203091813.vrTfwPUD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Isaku,

FYI, the error/warning still remains.

tree:   https://github.com/intel/tdx.git kvm
head:   7a7d51d52f45bbd82e264c7f940d74491305f5ce
commit: 2c9aac7eef8430d99ae51f243da09dd7892dc9cd [24/193] x86/cpu/tsx: Add helper functions to save/restore IA32_TSX_CTRL MSR
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220309/202203091813.vrTfwPUD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/2c9aac7eef8430d99ae51f243da09dd7892dc9cd
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm
        git checkout 2c9aac7eef8430d99ae51f243da09dd7892dc9cd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/cpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/tsx.c:186:5: warning: no previous prototype for function 'tsx_ctrl_clear' [-Wmissing-prototypes]
   u64 tsx_ctrl_clear(void)
       ^
   arch/x86/kernel/cpu/tsx.c:186:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 tsx_ctrl_clear(void)
   ^
   static 
>> arch/x86/kernel/cpu/tsx.c:199:6: warning: no previous prototype for function 'tsx_ctrl_restore' [-Wmissing-prototypes]
   void tsx_ctrl_restore(u64 tsx_ctrl)
        ^
   arch/x86/kernel/cpu/tsx.c:199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tsx_ctrl_restore(u64 tsx_ctrl)
   ^
   static 
   2 warnings generated.


vim +/tsx_ctrl_clear +186 arch/x86/kernel/cpu/tsx.c

   184	
   185	/* Clear the MSR_TSX_CTRL and return the old value if supported */
 > 186	u64 tsx_ctrl_clear(void)
   187	{
   188		u64 tsx_ctrl = 0;
   189	
   190		if (ia32_tsx_ctrl_supported) {
   191			rdmsrl(MSR_IA32_TSX_CTRL, tsx_ctrl);
   192			if (tsx_ctrl & MSR_TSX_CTRL_MASK)
   193				wrmsrl(MSR_IA32_TSX_CTRL, tsx_ctrl & ~MSR_TSX_CTRL_MASK);
   194		}
   195		return tsx_ctrl;
   196	}
   197	EXPORT_SYMBOL_GPL(tsx_ctrl_clear);
   198	
 > 199	void tsx_ctrl_restore(u64 tsx_ctrl)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
