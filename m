Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A13D18D
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646923343; x=1678459343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OJKaj+dkol1FacgiHUcMifV8v9tMiNuuIHX0fa00Bf0=;
  b=laeHErhLCsVi8eKkCT3dq/0jbaKcqXqABmMUwE0Yn2H8Lf1kK8mAuXGJ
   CwTbHdfR4gA4aVhZePDoWo0FDzT9MbFADEEJ/5qCcaaHLCZXq/fPst3xN
   cSWafNYLrbzPIu9x4wgE8P2UcXZbA2NVrGvQkItXrY/Mkzs8UwON0mwsn
   XMhkJFHUjfpVUe3quuSFdPuVMuMCDH6GvawANdAoE1YZpbjELpRAgKKGq
   rXKBhF6q7ra5OD0FqhroAr8pi3poaRgaG/da8hG2ZK12ZKrixvQOJoUh8
   9QerQI4UcF+I54PxtBupLTWeTDzLs6JZRRi3xitjlx21laV2/DQFwJ4VL
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318486734"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; 
   d="scan'208";a="318486734"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 06:42:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; 
   d="scan'208";a="633006274"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Mar 2022 06:42:21 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSJzg-00051c-7O; Thu, 10 Mar 2022 14:42:20 +0000
Date: Thu, 10 Mar 2022 22:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Quentin Perret <qperret@google.com>
Subject: arch/arm64/kvm/va_layout.c:292:6: warning: no previous prototype for
 function 'kvm_compute_final_ctr_el0'
Message-ID: <202203102230.x3TDH4ku-lkp@intel.com>
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
commit: 755db23420a1ce4b740186543432983e9bbe713e KVM: arm64: Generate final CTR_EL0 value when running in Protected mode
date:   12 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220310/202203102230.x3TDH4ku-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=755db23420a1ce4b740186543432983e9bbe713e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 755db23420a1ce4b740186543432983e9bbe713e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/ arch/arm64/kvm/ drivers/gpu/drm/tegra/ drivers/usb/host/ kernel/debug/kdb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/va_layout.c:188:6: warning: no previous prototype for function 'kvm_patch_vector_branch' [-Wmissing-prototypes]
   void kvm_patch_vector_branch(struct alt_instr *alt,
        ^
   arch/arm64/kvm/va_layout.c:188:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kvm_patch_vector_branch(struct alt_instr *alt,
   ^
   static 
   arch/arm64/kvm/va_layout.c:286:6: warning: no previous prototype for function 'kvm_get_kimage_voffset' [-Wmissing-prototypes]
   void kvm_get_kimage_voffset(struct alt_instr *alt,
        ^
   arch/arm64/kvm/va_layout.c:286:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kvm_get_kimage_voffset(struct alt_instr *alt,
   ^
   static 
>> arch/arm64/kvm/va_layout.c:292:6: warning: no previous prototype for function 'kvm_compute_final_ctr_el0' [-Wmissing-prototypes]
   void kvm_compute_final_ctr_el0(struct alt_instr *alt,
        ^
   arch/arm64/kvm/va_layout.c:292:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kvm_compute_final_ctr_el0(struct alt_instr *alt,
   ^
   static 
   3 warnings generated.


vim +/kvm_compute_final_ctr_el0 +292 arch/arm64/kvm/va_layout.c

   291	
 > 292	void kvm_compute_final_ctr_el0(struct alt_instr *alt,

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
