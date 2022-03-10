Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDA17A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646911137; x=1678447137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dsW0j/sIpHjN8S+oDTjReBWOqeVvM7grh7Y/5Yy1ouk=;
  b=Ozqs6Pvsi8CDikKJCOKXw5CNQaKrpqbkh6aRHYm1ARP4Za+eigPPtgvq
   I6+YI8dlyUL42C8pacTvp/nPU31yhxoWGZ08kP5/E1bMB0vaxjX9Fs4HD
   c6WC2c68bix20ZxPphn/wZ2YZ2FtRnstdguI4wwy5K6y9mQPsf07A7YUX
   Ce/PuCJwJQpoXo7uZe4VrCdb/cZT92m/n0iWtMkwXZxNE4miVes2lQeYq
   T46d/f5wZn3I8MK2MCLHAReFGZQux0HiVBA1zrJEa8L+/LSR/wl2TAQgI
   GzpbMVDNZ/auzQvAONPXSm4sBf+x//Q61Pfmdh/M9blvbcn2fL/oSBacz
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="235831549"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; 
   d="scan'208";a="235831549"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 03:18:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; 
   d="scan'208";a="632955802"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Mar 2022 03:18:54 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSGoo-0004q3-63; Thu, 10 Mar 2022 11:18:54 +0000
Date: Thu, 10 Mar 2022 19:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: Quentin Perret <qperret@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: arch/arm64/kvm/hyp/nvhe/setup.c:133:17: warning: no previous
 prototype for function '__pkvm_init_finalise'
Message-ID: <202203101914.nXeIxgaM-lkp@intel.com>
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
head:   3bf7edc84a9eb4007dd9a0cb8878a7e1d5ec6a3b
commit: f320bc742bc23c1d43567712fe2814bf04b19ebc KVM: arm64: Prepare the creation of s1 mappings at EL2
date:   12 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220310/202203101914.nXeIxgaM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f320bc742bc23c1d43567712fe2814bf04b19ebc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f320bc742bc23c1d43567712fe2814bf04b19ebc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/ arch/arm64/kvm/ drivers/gpu/drm/tegra/ drivers/usb/host/ kernel/debug/kdb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/setup.c:133:17: warning: no previous prototype for function '__pkvm_init_finalise' [-Wmissing-prototypes]
   void __noreturn __pkvm_init_finalise(void)
                   ^
   arch/arm64/kvm/hyp/nvhe/setup.c:133:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __noreturn __pkvm_init_finalise(void)
   ^
   static 
   1 warning generated.


vim +/__pkvm_init_finalise +133 arch/arm64/kvm/hyp/nvhe/setup.c

   132	
 > 133	void __noreturn __pkvm_init_finalise(void)
   134	{
   135		struct kvm_host_data *host_data = this_cpu_ptr(&kvm_host_data);
   136		struct kvm_cpu_context *host_ctxt = &host_data->host_ctxt;
   137		unsigned long nr_pages, reserved_pages, pfn;
   138		int ret;
   139	
   140		/* Now that the vmemmap is backed, install the full-fledged allocator */
   141		pfn = hyp_virt_to_pfn(hyp_pgt_base);
   142		nr_pages = hyp_s1_pgtable_pages();
   143		reserved_pages = hyp_early_alloc_nr_used_pages();
   144		ret = hyp_pool_init(&hpool, pfn, nr_pages, reserved_pages);
   145		if (ret)
   146			goto out;
   147	
   148		pkvm_pgtable_mm_ops = (struct kvm_pgtable_mm_ops) {
   149			.zalloc_page = hyp_zalloc_hyp_page,
   150			.phys_to_virt = hyp_phys_to_virt,
   151			.virt_to_phys = hyp_virt_to_phys,
   152			.get_page = hyp_get_page,
   153			.put_page = hyp_put_page,
   154		};
   155		pkvm_pgtable.mm_ops = &pkvm_pgtable_mm_ops;
   156	
   157	out:
   158		/*
   159		 * We tail-called to here from handle___pkvm_init() and will not return,
   160		 * so make sure to propagate the return value to the host.
   161		 */
   162		cpu_reg(host_ctxt, 1) = ret;
   163	
   164		__host_enter(host_ctxt);
   165	}
   166	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
