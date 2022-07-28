Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB2B7A
	for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 18:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659033520; x=1690569520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vgrok3srpFw/hYBSRTOFIcO/v/8calaWWqHrcYn3tjE=;
  b=TrUEAs0ZVy3pzWtS2zdi0cWMX6D2Bb0SIy04X42m4PiCAOrJ1oHEEhJn
   q3zPWcDRlBgNoQ0E+26eAS0yJ1ZYVn9/jbVubpSuI01nVz00QToguY3Xm
   R6hosalSlFKG+/lEOD2AMziJwdO19ML1y/Ghx/kKXlNBY9JImnG1aiD4a
   w4k/G9HZ5biVTn6E7sqAXvFskVDUuR42L/KflsheQ4o5Ifpx6CweaCIX1
   DOzDuYqNmvBSl/0oEmcZuWBQ0hdvST2VJWTl5tRtvzAWcEZq37eC/sRpW
   QKd+fGAMaifDc9yuDbDEuysuBjg8tvsccK/P5l4NvzdnGFZXHDfbW6FW6
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="268352516"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="268352516"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 11:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="576593761"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2022 11:38:37 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oH8P7-000AUw-06;
	Thu, 28 Jul 2022 18:38:37 +0000
Date: Fri, 29 Jul 2022 02:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Subject: [avpatel:riscv_timer_dt_imp_v2 8/16] arch/arm64/kvm/mmu.c:789:55:
 error: incompatible pointer to integer conversion initializing 'gfp_t' (aka
 'unsigned int') with an expression of type 'void *'
Message-ID: <202207290233.HRtZcPRo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_timer_dt_imp_v2
head:   ea3e044608ebdd55aea86cb6fe7fe6e5cbf61e36
commit: 62961693e39c0cb1df571320918fcda4344bcc9b [8/16] KVM: Add gfp_custom flag in struct kvm_mmu_memory_cache
config: arm64-buildonly-randconfig-r003-20220728 (https://download.01.org/0day-ci/archive/20220729/202207290233.HRtZcPRo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/avpatel/linux/commit/62961693e39c0cb1df571320918fcda4344bcc9b
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_timer_dt_imp_v2
        git checkout 62961693e39c0cb1df571320918fcda4344bcc9b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:789:55: error: incompatible pointer to integer conversion initializing 'gfp_t' (aka 'unsigned int') with an expression of type 'void *' [-Wint-conversion]
           struct kvm_mmu_memory_cache cache = { 0, __GFP_ZERO, NULL, };
                                                                ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   1 error generated.


vim +789 arch/arm64/kvm/mmu.c

d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  774  
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  775  /**
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  776   * kvm_phys_addr_ioremap - map a device range to guest IPA
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  777   *
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  778   * @kvm:	The KVM pointer
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  779   * @guest_ipa:	The IPA at which to insert the mapping
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  780   * @pa:		The physical address of the device
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  781   * @size:	The size of the mapping
c9c0279cc02b4e1 arch/arm64/kvm/mmu.c Xiaofei Tan         2020-09-17  782   * @writable:   Whether or not to create a writable mapping
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  783   */
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  784  int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
c40f2f8ff833edd arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  785  			  phys_addr_t pa, unsigned long size, bool writable)
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  786  {
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  787  	phys_addr_t addr;
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  788  	int ret = 0;
c1a33aebe91d49c arch/arm64/kvm/mmu.c Sean Christopherson 2020-07-02 @789  	struct kvm_mmu_memory_cache cache = { 0, __GFP_ZERO, NULL, };
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  790  	struct kvm_pgtable *pgt = kvm->arch.mmu.pgt;
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  791  	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_DEVICE |
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  792  				     KVM_PGTABLE_PROT_R |
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  793  				     (writable ? KVM_PGTABLE_PROT_W : 0);
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  794  
bff01cb6b1bf680 arch/arm64/kvm/mmu.c Quentin Perret      2021-12-08  795  	if (is_protected_kvm_enabled())
bff01cb6b1bf680 arch/arm64/kvm/mmu.c Quentin Perret      2021-12-08  796  		return -EPERM;
bff01cb6b1bf680 arch/arm64/kvm/mmu.c Quentin Perret      2021-12-08  797  
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  798  	size += offset_in_page(guest_ipa);
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  799  	guest_ipa &= PAGE_MASK;
c40f2f8ff833edd arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  800  
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  801  	for (addr = guest_ipa; addr < guest_ipa + size; addr += PAGE_SIZE) {
c1a33aebe91d49c arch/arm64/kvm/mmu.c Sean Christopherson 2020-07-02  802  		ret = kvm_mmu_topup_memory_cache(&cache,
61ffb3a50c4402e arch/arm64/kvm/mmu.c Sean Christopherson 2020-07-02  803  						 kvm_mmu_cache_min_pages(kvm));
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  804  		if (ret)
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  805  			break;
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  806  
fcc5bf89635a05e arch/arm64/kvm/mmu.c Jing Zhang          2022-01-18  807  		write_lock(&kvm->mmu_lock);
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  808  		ret = kvm_pgtable_stage2_map(pgt, addr, PAGE_SIZE, pa, prot,
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  809  					     &cache);
fcc5bf89635a05e arch/arm64/kvm/mmu.c Jing Zhang          2022-01-18  810  		write_unlock(&kvm->mmu_lock);
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  811  		if (ret)
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  812  			break;
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  813  
02bbd374ce4a8aa arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  814  		pa += PAGE_SIZE;
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  815  	}
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  816  
c1a33aebe91d49c arch/arm64/kvm/mmu.c Sean Christopherson 2020-07-02  817  	kvm_mmu_free_memory_cache(&cache);
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  818  	return ret;
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  819  }
d5d8184d35c990b arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  820  

:::::: The code at line 789 was first introduced by commit
:::::: c1a33aebe91d49c958df1648b2a84db96c403075 KVM: arm64: Use common KVM implementation of MMU memory caches

:::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
