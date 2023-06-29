Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B3114298;
	Thu, 29 Jun 2023 19:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688066981; x=1719602981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JeQCZ/qBvTUpg29R7lpL3Y5r6MiEliTWnefc7dGvqBI=;
  b=laxRkE7NpG+YEXJ3NYbJI8zd+0zSAvoEJQsaA9iN4FmlKH/eFuLxmDfz
   WBlqLKCaMNb4bBwFVMpCdVWPkE9r0liYEkFb5gU8H8SdrvwWlx4XtkuAA
   +KQjJYLwxGYdKF6yyfCqB4jviM2+wjkOPrioHvqcTzcr2EO+QCkzJlGEw
   ag7iv0jIHMEqk20I08dNrcLxOMb04HxVfMipVjPdf1zYcnorgwlVUPEPR
   VyiyNQu+CNgQCzlGPBmiFNNWHr32A6U1/0Bi6Ir21+y2WrsV9G93AdHYT
   HRKCwMUz/F8TBPY90p3H8pqrPOPn7Ac7eKrs28KVXtd1vuwl7rp+b8T4J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="359690239"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="359690239"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 12:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1047931244"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="1047931244"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2023 12:29:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qExKj-000EM5-2L;
	Thu, 29 Jun 2023 19:29:37 +0000
Date: Fri, 30 Jun 2023 03:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [stable:linux-5.15.y 55/9999] arch/x86/kvm/hyperv.c:2185:5: warning:
 stack frame size (1036) exceeds limit (1024) in 'kvm_hv_hypercall'
Message-ID: <202306300342.ctG3yOfI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vitaly,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   4af60700a60cc45ee4fb6d579cccf1b7bca20c34
commit: cb188e07105f2216f5efbefac95df4b6ce266906 [55/9999] KVM: x86: hyper-v: HVCALL_SEND_IPI_EX is an XMM fast hypercall
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20230630/202306300342.ctG3yOfI-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300342.ctG3yOfI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300342.ctG3yOfI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/hyperv.c:2185:5: warning: stack frame size (1036) exceeds limit (1024) in 'kvm_hv_hypercall' [-Wframe-larger-than]
   int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
       ^
   1 warning generated.


vim +/kvm_hv_hypercall +2185 arch/x86/kvm/hyperv.c

4ad81a91119df7 Vitaly Kuznetsov         2021-05-21  2184  
e83d58874ba1de Andrey Smetanin          2015-07-03 @2185  int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
e83d58874ba1de Andrey Smetanin          2015-07-03  2186  {
4e62aa96d6e55c Vitaly Kuznetsov         2021-07-30  2187  	struct kvm_vcpu_hv *hv_vcpu = to_hv_vcpu(vcpu);
bd38b32053eb1c Siddharth Chandrasekaran 2021-05-26  2188  	struct kvm_hv_hcall hc;
bd38b32053eb1c Siddharth Chandrasekaran 2021-05-26  2189  	u64 ret = HV_STATUS_SUCCESS;
e83d58874ba1de Andrey Smetanin          2015-07-03  2190  
e83d58874ba1de Andrey Smetanin          2015-07-03  2191  	/*
e83d58874ba1de Andrey Smetanin          2015-07-03  2192  	 * hypercall generates UD from non zero cpl and real mode
e83d58874ba1de Andrey Smetanin          2015-07-03  2193  	 * per HYPER-V spec
e83d58874ba1de Andrey Smetanin          2015-07-03  2194  	 */
b3646477d458fb Jason Baron              2021-01-14  2195  	if (static_call(kvm_x86_get_cpl)(vcpu) != 0 || !is_protmode(vcpu)) {
e83d58874ba1de Andrey Smetanin          2015-07-03  2196  		kvm_queue_exception(vcpu, UD_VECTOR);
0d9c055eaaf41b Andrey Smetanin          2016-02-11  2197  		return 1;
e83d58874ba1de Andrey Smetanin          2015-07-03  2198  	}
e83d58874ba1de Andrey Smetanin          2015-07-03  2199  

:::::: The code at line 2185 was first introduced by commit
:::::: e83d58874ba1de74c13d3c6b05f95a023c860d25 kvm/x86: move Hyper-V MSR's/hypercall code into hyperv.c file

:::::: TO: Andrey Smetanin <asmetanin@virtuozzo.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
