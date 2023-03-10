Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03DA8481;
	Fri, 10 Mar 2023 14:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678456832; x=1709992832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hZfmGDq9bhkBaKXX3SftuyJQhvp6qhbd6ftZNrD+R08=;
  b=h0bgKXbRUR0aw4SrpxOIvBnv8j33kzeXio3MHUoD2KW4X7EHf4PYE89w
   /a4tbNDzaKpMtsW84ZF8/cXXUPp+SxJrGK3REBGzHCrxhlcoSE3HGlW0D
   pPlqBGJdE0L30ABTRiNkiq/ppcP72pippkLkEBKL50qUXBEvGKiZyWeNd
   JNbW6P+2jPrPJf0J6Z7aZgYkNzvAg06gtKxJ6VAi+jMiVfAtem/JrxBXM
   9saL+qjnnacgQdBSmqP1el958oF3JgrRqjuV0W2Rhv0gJeSL2+QuSJwWR
   c6QAQs1yBeG0yXNS6PS91xP2RnORiHP3fqXtPseNodg8oRwIT2mjM69fi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="401590490"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="401590490"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 06:00:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="821055831"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="821055831"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2023 06:00:20 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1padIB-0003tl-31;
	Fri, 10 Mar 2023 14:00:19 +0000
Date: Fri, 10 Mar 2023 21:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chenyi Qiang <chenyi.qiang@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 306/432]
 arch/x86/include/asm/cpu.h:74:20: error: conflicting types for
 'tsx_ctrl_clear'
Message-ID: <202303102105.GQe7NH8s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   b4a08c4cd3ed29e3977509b24adc2c59e39825c1
commit: ab8aab774d78dd59a15a665bbd8d549b367e280d [306/432] [REVERTME] x86/cpu/tsx: Add helper functions to save/restore IA32_TSX_CTRL MSR
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230310/202303102105.GQe7NH8s-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/ab8aab774d78dd59a15a665bbd8d549b367e280d
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout ab8aab774d78dd59a15a665bbd8d549b367e280d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303102105.GQe7NH8s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/lib/cpu.c:4:
>> arch/x86/include/asm/cpu.h:74:20: error: conflicting types for 'tsx_ctrl_clear'
   static inline void tsx_ctrl_clear(u64 tsx_ctrl) {}
                      ^
   arch/x86/include/asm/cpu.h:73:19: note: previous definition is here
   static inline u64 tsx_ctrl_clear(void) { return 0; }
                     ^
   1 error generated.


vim +/tsx_ctrl_clear +74 arch/x86/include/asm/cpu.h

    72	
    73	static inline u64 tsx_ctrl_clear(void) { return 0; }
  > 74	static inline void tsx_ctrl_clear(u64 tsx_ctrl) {}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
