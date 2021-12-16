Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55982C82
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639666635; x=1671202635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s42kfBRilTCxpdjntHYacwLfvf0+A7dAoeI1JfpZDok=;
  b=lJSCYOjbu5L63vXwEWscyLzpGwzsm32DTqS2HlPXqg8hvf6B6aXD5ICq
   KXJvwNhOFbiiXunyQrdjynuKNUr9a3VVOjoIdyEOgr5kpXhdwkD8ko1WR
   S8aCA140idNAflPg0rJT3LwitYRehZ9EV52BS0+GueNMKKL9RAJ9pE/AF
   pOZz9Tjo2I3akxnvkps/eIKz1l+2Px9SRKrZPkrW7Wad7HT8KEqLvnKTo
   y5LpMtqYM0AvIzE1Wvfdgzx65muhogxq2Bonz/RyMj9Uiqj68oUGecCij
   D+kZkeNMcuU0PJ3AyZIOAaIKPHVA6bsdFJ1pQySPBafumI3JHoBVPNjt8
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="263673754"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="263673754"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 06:57:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="615179031"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2021 06:57:08 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxsBv-0003MY-JO; Thu, 16 Dec 2021 14:57:07 +0000
Date: Thu, 16 Dec 2021 22:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [intel-tdx:kvm-upstream 73/152] arch/x86/kvm/vmx/tdx_stubs.c:6:12:
 warning: no previous prototype for function 'tdx_hardware_setup'
Message-ID: <202112162216.Lu7x1lPh-lkp@intel.com>
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
commit: 3545bcde2d72e4b5b5f16571788aac0ddb5f49a5 [73/152] KVM: TDX: Add KVM TDX system-wide initialization and teardown
config: x86_64-randconfig-a013-20211216 (https://download.01.org/0day-ci/archive/20211216/202112162216.Lu7x1lPh-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/3545bcde2d72e4b5b5f16571788aac0ddb5f49a5
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream
        git checkout 3545bcde2d72e4b5b5f16571788aac0ddb5f49a5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/kvm/vmx/tdx_stubs.c:4:13: warning: no previous prototype for function 'tdx_pre_kvm_init' [-Wmissing-prototypes]
   void __init tdx_pre_kvm_init(unsigned int *vcpu_size,
               ^
   arch/x86/kvm/vmx/tdx_stubs.c:4:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init tdx_pre_kvm_init(unsigned int *vcpu_size,
   ^
   static 
>> arch/x86/kvm/vmx/tdx_stubs.c:6:12: warning: no previous prototype for function 'tdx_hardware_setup' [-Wmissing-prototypes]
   int __init tdx_hardware_setup(struct kvm_x86_ops *x86_ops) { return -EOPNOTSUPP; }
              ^
   arch/x86/kvm/vmx/tdx_stubs.c:6:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init tdx_hardware_setup(struct kvm_x86_ops *x86_ops) { return -EOPNOTSUPP; }
   ^
   static 
>> arch/x86/kvm/vmx/tdx_stubs.c:7:6: warning: no previous prototype for function 'tdx_hardware_enable' [-Wmissing-prototypes]
   void tdx_hardware_enable(void) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:7:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_hardware_enable(void) {}
   ^
   static 
>> arch/x86/kvm/vmx/tdx_stubs.c:8:6: warning: no previous prototype for function 'tdx_hardware_disable' [-Wmissing-prototypes]
   void tdx_hardware_disable(void) {}
        ^
   arch/x86/kvm/vmx/tdx_stubs.c:8:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tdx_hardware_disable(void) {}
   ^
   static 
   4 warnings generated.


vim +/tdx_hardware_setup +6 arch/x86/kvm/vmx/tdx_stubs.c

     3	
     4	void __init tdx_pre_kvm_init(unsigned int *vcpu_size,
     5				unsigned int *vcpu_align, unsigned int *vm_size) {}
   > 6	int __init tdx_hardware_setup(struct kvm_x86_ops *x86_ops) { return -EOPNOTSUPP; }
   > 7	void tdx_hardware_enable(void) {}
   > 8	void tdx_hardware_disable(void) {}

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
