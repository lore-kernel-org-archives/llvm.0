Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9254F5A1F
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 18:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646938084; x=1678474084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Knf1kpXMiMPbd73maY9gmm+fE9o7P4kWFSCJH+mkcZE=;
  b=KMbPYeOnFY/SlOpCxmVwpPAEutZdTpfp9wVYkKfBGEp0kOdxZaRD6a4a
   WfJUAtvFbHQZQeJrmJ00x6nPcp5M9pwz3ZnDHz4vd1NOqNJLAPUyCFmes
   7J4uahTOqQPxN74ZBJHkOL+s3h6vutix307HQvJ6LU8tMkPkMBVSTEMj/
   uqmuXuikkgyxgJ6YODWefiQeG3ykvOQlaIcsk8KTQAOnuHrZkTncUwL6S
   kQXDExkFFLRCPLS/sb1McFfzrhXQTAjLe1NWHxDNIBb6ZVXbbdV/AzyAr
   frnt3UhXslLd60tpCaeAWhdq69RperkHKGnTch3qx9ojvYQpmyIKtUNQP
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="280078068"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="280078068"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 10:47:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="644562318"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Mar 2022 10:47:48 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSNpD-0005Gd-JI; Thu, 10 Mar 2022 18:47:47 +0000
Date: Fri, 11 Mar 2022 02:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Scull <ascull@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: arch/arm64/kvm/hyp/vhe/switch.c:217:17: warning: no previous
 prototype for function 'hyp_panic'
Message-ID: <202203110233.wRMZYmRL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1db333d9a51f3459fba1bcaa564d95befe79f0b3
commit: f79e616f27ab6cd74deb0995a8eead3d1c9d65af KVM: arm64: Use BUG and BUG_ON in nVHE hyp
date:   11 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220311/202203110233.wRMZYmRL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f79e616f27ab6cd74deb0995a8eead3d1c9d65af
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f79e616f27ab6cd74deb0995a8eead3d1c9d65af
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/ arch/arm64/kvm/ drivers/gpu/drm/tegra/ drivers/usb/host/ kernel/debug/kdb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/vhe/switch.c:217:17: warning: no previous prototype for function 'hyp_panic' [-Wmissing-prototypes]
   void __noreturn hyp_panic(void)
                   ^
   arch/arm64/kvm/hyp/vhe/switch.c:217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __noreturn hyp_panic(void)
   ^
   static 
   arch/arm64/kvm/hyp/vhe/switch.c:227:17: warning: no previous prototype for function 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
   asmlinkage void kvm_unexpected_el2_exception(void)
                   ^
   arch/arm64/kvm/hyp/vhe/switch.c:227:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void kvm_unexpected_el2_exception(void)
              ^
              static 
   2 warnings generated.
--
>> arch/arm64/kvm/hyp/nvhe/switch.c:264:17: warning: no previous prototype for function 'hyp_panic' [-Wmissing-prototypes]
   void __noreturn hyp_panic(void)
                   ^
   arch/arm64/kvm/hyp/nvhe/switch.c:264:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __noreturn hyp_panic(void)
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/switch.c:286:17: warning: no previous prototype for function 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
   asmlinkage void kvm_unexpected_el2_exception(void)
                   ^
   arch/arm64/kvm/hyp/nvhe/switch.c:286:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void kvm_unexpected_el2_exception(void)
              ^
              static 
   2 warnings generated.


vim +/hyp_panic +217 arch/arm64/kvm/hyp/vhe/switch.c

09cf57eba30424 David Brazdil 2020-06-25  216  
6a0259ed29bba8 Andrew Scull  2020-09-15 @217  void __noreturn hyp_panic(void)
09cf57eba30424 David Brazdil 2020-06-25  218  {
09cf57eba30424 David Brazdil 2020-06-25  219  	u64 spsr = read_sysreg_el2(SYS_SPSR);
09cf57eba30424 David Brazdil 2020-06-25  220  	u64 elr = read_sysreg_el2(SYS_ELR);
96d389ca10110d Rob Herring   2020-10-28  221  	u64 par = read_sysreg_par();
09cf57eba30424 David Brazdil 2020-06-25  222  
6a0259ed29bba8 Andrew Scull  2020-09-15  223  	__hyp_call_panic(spsr, elr, par);
09cf57eba30424 David Brazdil 2020-06-25  224  	unreachable();
09cf57eba30424 David Brazdil 2020-06-25  225  }
e9ee186bb735bf James Morse   2020-08-21  226  

:::::: The code at line 217 was first introduced by commit
:::::: 6a0259ed29bba83653a36fabcdf6b06aecd78596 KVM: arm64: Remove hyp_panic arguments

:::::: TO: Andrew Scull <ascull@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
