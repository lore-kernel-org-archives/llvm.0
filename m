Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13345A31;
	Wed, 16 Aug 2023 04:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692161631; x=1723697631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0fck4FpTAXmmjMfqECWo2DNzL/CycdLv2yke48G2VIY=;
  b=XQ4p3WL28IWyth7Erl5LCNQ05oRjMGP4Mkll19qMLznsIjjeJs5FRH9K
   0EyMGKxL6wyw/7CYeR5KWktcl7rlMkPOYmqdthGp1IwCdDeC+Ozc2Tfy7
   VOK1JqS584734Hxhtu2A2p+OOatyLrdBDwk7wYujkWa2BwWbxBY2VhqgZ
   8A3QT33fYczIEyKLFwews9Ao4Mq69DHWsdoVeueFkpIrPfLGCw+gahwcR
   nxRnyaqjYUA0xeIHtzHn/Vw8XY0yNa73YY0cphatdNhejfiff4x0YRcQq
   daO3CDMKh6omy3TX5DIGYaG3zjDY2rEhWBNOr6oe3oHXp8Htn1l/I8+Jf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372438742"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="372438742"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 21:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857676205"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="857676205"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Aug 2023 21:53:49 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW8XU-0001WB-1C;
	Wed, 16 Aug 2023 04:53:48 +0000
Date: Wed, 16 Aug 2023 12:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/hyperv_no_range_flush 15/15]
 include/linux/kvm_host.h:1483:19: error: redefinition of
 'kvm_arch_flush_remote_tlbs'
Message-ID: <202308161241.Mi3s7LqF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/hyperv_no_range_flush
head:   f9d65d9f4720ff9339b177fcc9af5a5d9bd43551
commit: f9d65d9f4720ff9339b177fcc9af5a5d9bd43551 [15/15] KVM: x86/mmu: Declare flush_remote_tlbs{_range}() hooks iff HYPERV!=n
config: i386-randconfig-i011-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161241.Mi3s7LqF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161241.Mi3s7LqF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161241.Mi3s7LqF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/events/intel/core.c:17:
>> include/linux/kvm_host.h:1483:19: error: redefinition of 'kvm_arch_flush_remote_tlbs'
   static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
                     ^
   arch/x86/include/asm/kvm_host.h:1801:19: note: previous definition is here
   static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
                     ^
   1 error generated.


vim +/kvm_arch_flush_remote_tlbs +1483 include/linux/kvm_host.h

d89f5eff70a312 Jan Kiszka             2010-11-09  1481  
51787fd509e7a7 David Matlack          2023-08-11  1482  #ifndef __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
51787fd509e7a7 David Matlack          2023-08-11 @1483  static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
b08660e59dbdb6 Tianyu Lan             2018-07-19  1484  {
b08660e59dbdb6 Tianyu Lan             2018-07-19  1485  	return -ENOTSUPP;
b08660e59dbdb6 Tianyu Lan             2018-07-19  1486  }
ccf9fdedfffe97 Raghavendra Rao Ananta 2023-08-11  1487  #else
ccf9fdedfffe97 Raghavendra Rao Ananta 2023-08-11  1488  int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
b08660e59dbdb6 Tianyu Lan             2018-07-19  1489  #endif
b08660e59dbdb6 Tianyu Lan             2018-07-19  1490  

:::::: The code at line 1483 was first introduced by commit
:::::: 51787fd509e7a7cee6f0336c173ed757225dcd9f KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()

:::::: TO: David Matlack <dmatlack@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
