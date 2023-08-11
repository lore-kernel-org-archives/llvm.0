Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D987E10F1;
	Fri, 11 Aug 2023 05:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691730754; x=1723266754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=le3dy2YIW/UZ8qPnF0S96wj9K2nU9aZ6bTQc22LYiB4=;
  b=m5qu3f/I15JgTlY9+9VEMizBTLlGG4y1gU6pSBq+JcaJ50esoDPy9jee
   /bdG9wjb8O5/iXb362SVS0RAXPMwg5c5eXbtm6irS5uIUTctJ7YOHnP23
   jFmqVuuQoaip5HAzaI8SaVWhRXohtvILy4mcrre96SMR/4GEfvMMhKn1c
   Fg9TzzzK+wIrRqNduEhhgl/fXwkm5n8MjCrdSb9A2nq9JV0EUEIT44uH7
   WG+TQKZCix85kR6ElHSvkSYO1FpvqlR25B/zckDlAP2cwWrsOL6FQ2h+6
   Kpfxr5hp7FuG0S6J3hvwk2rPLdI4YbIMMCo6jRdbWX8TReg8KLof2E4tR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="371605604"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="371605604"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 22:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="797876951"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="797876951"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Aug 2023 22:12:31 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUKRq-0007Wm-1S;
	Fri, 11 Aug 2023 05:12:30 +0000
Date: Fri, 11 Aug 2023 13:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Michael Kelley <mikelley@microsoft.com>,
	Tianyu Lan <tiala@microsoft.com>
Subject: [dcui-tdx:decui/upstream-hyperv/hyperv-next/TDX/0810 2/25]
 arch/x86/hyperv/hv_init.c:392:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202308111314.Ze67fL6a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/upstream-hyperv/hyperv-next/TDX/0810
head:   104f836a5da361eec57916007c24e43c4d247951
commit: 4663943bdbd128de739f3d4d4ca9b7a55f7cdac3 [2/25] [PATCH V5 2/8] x86/hyperv: Set Virtual Trust Level in VMBus init message
config: x86_64-buildonly-randconfig-r003-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111314.Ze67fL6a-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111314.Ze67fL6a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111314.Ze67fL6a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/hyperv/hv_init.c:392:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!input) {
               ^~~~~~
   arch/x86/hyperv/hv_init.c:413:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   arch/x86/hyperv/hv_init.c:392:2: note: remove the 'if' if its condition is always false
           if (!input) {
           ^~~~~~~~~~~~~
   arch/x86/hyperv/hv_init.c:387:9: note: initialize the variable 'ret' to silence this warning
           u64 ret;
                  ^
                   = 0
   1 warning generated.


vim +392 arch/x86/hyperv/hv_init.c

   380	
   381	static u8 __init get_vtl(void)
   382	{
   383		u64 control = HV_HYPERCALL_REP_COMP_1 | HVCALL_GET_VP_REGISTERS;
   384		struct hv_get_vp_registers_input *input;
   385		struct hv_get_vp_registers_output *output;
   386		unsigned long flags;
   387		u64 ret;
   388	
   389		local_irq_save(flags);
   390		input = *this_cpu_ptr(hyperv_pcpu_input_arg);
   391		output = (struct hv_get_vp_registers_output *)input;
 > 392		if (!input) {
   393			local_irq_restore(flags);
   394			goto done;
   395		}
   396	
   397		memset(input, 0, struct_size(input, element, 1));
   398		input->header.partitionid = HV_PARTITION_ID_SELF;
   399		input->header.vpindex = HV_VP_INDEX_SELF;
   400		input->header.inputvtl = 0;
   401		input->element[0].name0 = HV_X64_REGISTER_VSM_VP_STATUS;
   402	
   403		ret = hv_do_hypercall(control, input, output);
   404		if (hv_result_success(ret)) {
   405			ret = output->as64.low & HV_X64_VTL_MASK;
   406		} else {
   407			pr_err("Failed to get VTL and set VTL to zero by default.\n");
   408			ret = 0;
   409		}
   410	
   411		local_irq_restore(flags);
   412	done:
   413		return ret;
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
