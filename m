Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0741F927;
	Tue, 25 Jul 2023 16:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690303981; x=1721839981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EuFLEiCOIZ3Yr1LInVn+nPZ15NclLRvnEMqKpPC52E8=;
  b=hRl8Hv96ZRw19GIDbVBfgwH1f262oV1uxALsN1wBrELgwDmu8wDS6Vv3
   50Jwfa+kSRVQaagZY4m5b5rEp4AQ/N+KCPTjRrp00NquOylbPqPi1eyTa
   c/TaNV0dFZsgWbfHfXH8BdQN4AwcvkhlO6DdiM9ccwdyQwFXuOk5q6HNx
   Q8/2xwZfgLPImNvBIyHoAu5g2NWgchmi3BzVeFswqAC1PhFlSDUWqURAs
   DaibiQb4QvLsForoKesenaeWLz5pePlzhqPt5jZabM/scsAt2vYTtaDdX
   KYIWvDKrS3isHYyCeFopF4MPF5na7INWtCUubNd71QNzO3vMBQ7S8jE9a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431592955"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="431592955"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 09:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="850099045"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="850099045"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Jul 2023 09:52:48 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOLGt-00009l-1B;
	Tue, 25 Jul 2023 16:52:34 +0000
Date: Wed, 26 Jul 2023 00:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 7/9] KVM: x86/mmu: Use BUILD_BUG_ON_INVALID() for
 KVM_MMU_WARN_ON() stub
Message-ID: <202307260015.1ZsP65rd-lkp@intel.com>
References: <20230721230006.2337941-8-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721230006.2337941-8-seanjc@google.com>

Hi Sean,

kernel test robot noticed the following build errors:

[auto build test ERROR on 294ebdda1560d3eb515da88b805ba7f88eb28d21]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Christopherson/KVM-x86-mmu-Delete-rmap_printk-and-all-its-usage/20230722-070218
base:   294ebdda1560d3eb515da88b805ba7f88eb28d21
patch link:    https://lore.kernel.org/r/20230721230006.2337941-8-seanjc%40google.com
patch subject: [PATCH v2 7/9] KVM: x86/mmu: Use BUILD_BUG_ON_INVALID() for KVM_MMU_WARN_ON() stub
config: i386-buildonly-randconfig-r006-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260015.1ZsP65rd-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260015.1ZsP65rd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260015.1ZsP65rd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.c:1738:19: error: call to undeclared function 'is_empty_shadow_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           KVM_MMU_WARN_ON(!is_empty_shadow_page(sp->spt));
                            ^
   1 error generated.


vim +/is_empty_shadow_page +1738 arch/x86/kvm/mmu/mmu.c

43a063cab325ee arch/x86/kvm/mmu/mmu.c Yosry Ahmed         2022-08-23  1735  
876546436db977 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  1736  static void kvm_mmu_free_shadow_page(struct kvm_mmu_page *sp)
260746c03dcb2e drivers/kvm/mmu.c      Avi Kivity          2007-01-05  1737  {
14960b3718bba4 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2023-07-21 @1738  	KVM_MMU_WARN_ON(!is_empty_shadow_page(sp->spt));
7775834a233478 arch/x86/kvm/mmu.c     Xiao Guangrong      2010-06-04  1739  	hlist_del(&sp->hash_link);
bd4c86eaa6ff10 arch/x86/kvm/mmu.c     Xiao Guangrong      2011-07-12  1740  	list_del(&sp->link);
bd4c86eaa6ff10 arch/x86/kvm/mmu.c     Xiao Guangrong      2011-07-12  1741  	free_page((unsigned long)sp->spt);
834be0d83f9451 arch/x86/kvm/mmu.c     Gleb Natapov        2013-01-30  1742  	if (!sp->role.direct)
6a97575d5cffb7 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  1743  		free_page((unsigned long)sp->shadowed_translation);
e8ad9a707496c1 arch/x86/kvm/mmu.c     Xiao Guangrong      2010-05-13  1744  	kmem_cache_free(mmu_page_header_cache, sp);
260746c03dcb2e drivers/kvm/mmu.c      Avi Kivity          2007-01-05  1745  }
260746c03dcb2e drivers/kvm/mmu.c      Avi Kivity          2007-01-05  1746  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
