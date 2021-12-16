Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A862CA2
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 10:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639652400; x=1671188400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1EaKsg0UphZk1CJ9sBCdPafZwbWsnwSmlS4CvbEgy2M=;
  b=SSLeHxDRFpLDvbgSHCoUHZQOc7FKQgpmib3Di62g5lY2Y9qu8/7CSZMN
   o7Xh/5nHLWd+ZjXnkmgnkmQ1+xKP60x5x0KD3FCOij4Ou7mRk4q3xPKsz
   +4GB9W8znIjh6OrlnuMD9VA8gQGp6A2EpXl/+GI1/tShDM4T9NCInIpmB
   cBv3D07mcrDvwGPOpXpZEdFtwUARGPMoGOt4y+vpx9INbZG+1kp0O+AQu
   QcKZyDa3LqEViMtamaNpfrH7bR2x2oHQZ02xv7s9PL9t6QEpfyv+8y6cU
   51KxONvIzHRwfXIhIHrJbi/CxWdhbTRhVXvhacl9oSpsco5DKVMETRQoZ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="325742739"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="325742739"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 02:59:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="545937145"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2021 02:59:57 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxoUO-00032O-QP; Thu, 16 Dec 2021 10:59:56 +0000
Date: Thu, 16 Dec 2021 18:59:53 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Chenyi Qiang <chenyi.qiang@intel.com>
Subject: [intel-tdx:kvm-upstream 24/152] arch/x86/kernel/cpu/tsx.c:186:5:
 warning: no previous prototype for function 'tsx_ctrl_clear'
Message-ID: <202112161842.loPyrD9m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   bdfe06c17daab60c196ff80c1d98467a1d3734fa
commit: 66d36f53706ca091e0362a29d87a91813265e589 [24/152] x86/cpu/tsx: Add helper functions to save/restore IA32_TSX_CTRL MSR
config: i386-randconfig-r012-20211216 (https://download.01.org/0day-ci/archive/20211216/202112161842.loPyrD9m-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/66d36f53706ca091e0362a29d87a91813265e589
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream
        git checkout 66d36f53706ca091e0362a29d87a91813265e589
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
