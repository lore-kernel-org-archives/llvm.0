Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490472C9C
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639660445; x=1671196445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DNvzDMeT+XZgO89dspmJUKtjopxAoJTg/j008G+c06o=;
  b=QtjPNnqSuptTgdQKt+coxQEKO1z6XwrxHg1fejB2849qZeAxOeFyMYJ+
   BEkSlKXnqPG+NZOtZqE8HefzS1SmkfHVHfJNVHH08wtZK6FCpmzjPBoqZ
   VgaeuLFou1BbVrK9KNrKEYfN9of32W7U0aZ7aoTrgT5zCZqh6FrH2XteY
   TBi2PhQtTV3kNGfT3DBy9J0SyhUnseoQb4sKK/EQ7kB/m3ZS9G+2Iv4Gd
   7Ntu6QDkx/xD6SFRhnkrpS5nsElfU5M0jPARtsXRJPrWhjSpyg4CDfIfp
   TC9SCYaSHV5lictBQijaeRdvEpTvohtFbERYwKoji6FkUvAIpBIeg+qyp
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="263645974"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="263645974"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 05:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="506274340"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 05:14:02 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxqa9-0003Bb-Si; Thu, 16 Dec 2021 13:14:01 +0000
Date: Thu, 16 Dec 2021 21:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream 72/152] arch/x86/kvm/vmx/tdx_stubs.c:4:13:
 warning: no previous prototype for function 'tdx_pre_kvm_init'
Message-ID: <202112162144.0WgRhoCw-lkp@intel.com>
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
commit: bf8636a6b18c9a4a17d11dd306dcc7809db9cc9c [72/152] KVM: TDX: Stub in tdx.h with structs, accessors, and VMCS helpers
config: x86_64-randconfig-a013-20211216 (https://download.01.org/0day-ci/archive/20211216/202112162144.0WgRhoCw-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/bf8636a6b18c9a4a17d11dd306dcc7809db9cc9c
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream
        git checkout bf8636a6b18c9a4a17d11dd306dcc7809db9cc9c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/tdx_stubs.c:4:13: warning: no previous prototype for function 'tdx_pre_kvm_init' [-Wmissing-prototypes]
   void __init tdx_pre_kvm_init(unsigned int *vcpu_size,
               ^
   arch/x86/kvm/vmx/tdx_stubs.c:4:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init tdx_pre_kvm_init(unsigned int *vcpu_size,
   ^
   static 
   1 warning generated.


vim +/tdx_pre_kvm_init +4 arch/x86/kvm/vmx/tdx_stubs.c

     3	
   > 4	void __init tdx_pre_kvm_init(unsigned int *vcpu_size,

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
