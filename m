Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D66366
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 04:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654058627; x=1685594627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v83w+pcu1rKKOY5FjT6tu+qdUXMlHJHuYL50RQr/FiM=;
  b=gAsfLoZmtdEJ8tZWNGSZogy4I4sPzN+5up2Pr4NLGYiDxk8mE0OqO8my
   8TYIfBzOCj6vKcFcq0eI2fdnOvvfNJNWEalUTxhDEApa9S73y5Nk0kmLO
   ydH5bEWKmFE/oHA8swvNqZvkqghk1/FY4oWcKuNFJsQnQIvCZRb1wnvu2
   UV2yaCSqhBSttktdJKXe0PQgq8ad9OCB97Aw98g4gUXQmF8M3zbYzSLL1
   /MrlFSjTbn1VoB5VnbFx1R+81bhJWEZaGBeUdpIBYnAS1cS98TgDbaY2p
   JZiOHHui2+VRqtu/3UceINfZodZeL79580gYm12AC/r0PCUugSuIrEOlp
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275192893"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="275192893"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 21:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="667244876"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 May 2022 21:43:45 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwGCu-0003Y2-AR;
	Wed, 01 Jun 2022 04:43:44 +0000
Date: Wed, 1 Jun 2022 12:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 422/422]
 arch/x86/kvm/mmu/mmu.c:4546:6: error: call to undeclared function
 'get_user_page_fast'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202206011249.nbPtIS94-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   4e487b52e144ed36e4ae202e7103e63679710095
commit: 4e487b52e144ed36e4ae202e7103e63679710095 [422/422] KVM: x86/mmu: Use get_user_page_fast instead of get_user_page_fast_only
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220601/202206011249.nbPtIS94-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/4e487b52e144ed36e4ae202e7103e63679710095
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 4e487b52e144ed36e4ae202e7103e63679710095
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/mmu/mmu.c:18:
   In file included from arch/x86/kvm/irq.h:15:
   In file included from include/linux/kvm_host.h:47:
   include/linux/memfile_notifier.h:87:57: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   static int memfile_register_notifier(struct file *file, flags,
                                                           ^
                                                           int
>> arch/x86/kvm/mmu/mmu.c:4546:6: error: call to undeclared function 'get_user_page_fast'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (get_user_page_fast(hva, FOLL_WRITE, page))
               ^
   arch/x86/kvm/mmu/mmu.c:4546:6: note: did you mean 'get_user_pages_fast'?
   include/linux/mm.h:1931:5: note: 'get_user_pages_fast' declared here
   int get_user_pages_fast(unsigned long start, int nr_pages,
       ^
   2 errors generated.


vim +/get_user_page_fast +4546 arch/x86/kvm/mmu/mmu.c

  4527	
  4528	/*
  4529	 * Private page can't be release on mmu_notifier without losing page contents.
  4530	 * The help, callback, from backing store is needed to allow page migration.
  4531	 * For now, pin the page.
  4532	 */
  4533	static int kvm_faultin_pfn_private_mapped(struct kvm_vcpu *vcpu,
  4534					    struct kvm_page_fault *fault)
  4535	{
  4536		hva_t hva = gfn_to_hva_memslot(fault->slot, fault->gfn);
  4537		struct page *page[1];
  4538	
  4539		fault->map_writable = false;
  4540		fault->pfn = KVM_PFN_ERR_FAULT;
  4541		if (hva == KVM_HVA_ERR_RO_BAD || hva == KVM_HVA_ERR_BAD)
  4542			return RET_PF_INVALID;
  4543	
  4544		/* TDX allows only RWX.  Read-only isn't supported. */
  4545		WARN_ON_ONCE(!fault->write);
> 4546		if (get_user_page_fast(hva, FOLL_WRITE, page))
  4547			return RET_PF_INVALID;
  4548	
  4549		fault->map_writable = true;
  4550		fault->pfn = page_to_pfn(page[0]);
  4551		return RET_PF_CONTINUE;
  4552	}
  4553	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
