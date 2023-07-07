Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09FB5381;
	Fri,  7 Jul 2023 19:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688756953; x=1720292953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x+mGZt5BT1p4zud23609GMRE+6pGDXAQRxq32moPm80=;
  b=PZkglMmm6urc4lKoUcwf9lNdlV12hyut0JAsoVhpnymWIgOOs7VqrSKm
   46flHAwo/lwD0JdTQgJMC7RgnwkBBxmQcw3mUes+hkelGygB5J46jAP83
   GW8dUFFcpLuzEC7p2ZRdoArB/OrUjt30h2sXwOECL0Zefw9iAT1bcy23m
   fnq4jMmK83B45dWgRQSrB6ZWSbOut4VQQaVuruQYAbOX08pZGd+bek1Ck
   eJF268I66FIik9xmq2fqVEdc4uwgcQkdVZLWsskQMFY4bN4TE4Ijy1yen
   tuFs9xNrdBH+R9O8nBk4D/mjqDdrKoStQvKjA65qCzTaUoHiztWv0yf/Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="366548553"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="366548553"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="864658381"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="864658381"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2023 12:09:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHqpH-0002DK-0z;
	Fri, 07 Jul 2023 19:09:07 +0000
Date: Sat, 8 Jul 2023 03:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [stable:linux-5.15.y 55/9999] arch/x86/kvm/hyperv.c:2185:5: error:
 stack frame size (1036) exceeds limit (1024) in 'kvm_hv_hypercall'
Message-ID: <202307080326.zDp7E3o0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vitaly,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d54cfc420586425d418a53871290cc4a59d33501
commit: cb188e07105f2216f5efbefac95df4b6ce266906 [55/9999] KVM: x86: hyper-v: HVCALL_SEND_IPI_EX is an XMM fast hypercall
config: i386-buildonly-randconfig-r006-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080326.zDp7E3o0-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080326.zDp7E3o0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080326.zDp7E3o0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/hyperv.c:2185:5: error: stack frame size (1036) exceeds limit (1024) in 'kvm_hv_hypercall' [-Werror,-Wframe-larger-than]
   int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
       ^
   1 error generated.


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
