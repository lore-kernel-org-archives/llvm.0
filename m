Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507991AC898;
	Thu, 15 Aug 2024 23:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723765654; cv=none; b=UFmmV7lntFhfcpzR6jbCS4IfWGOBR0fPDcAPQl+YJrrK5RHTfRSi5UgpKHWCM0pHd8MHY7kLR77HmkBomX/EThUJ2VAh8ASUqdBqkyRAocPeLcrV1sX0pcD69vzu7nJ+akexkn15oLyIrVXlQcl3UQpa7fzJM864+SCFdaIDItY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723765654; c=relaxed/simple;
	bh=c/8XjNzrw7oCvSfUlGjLgVGFwXclWBizugfVvOZTpGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j29F969ZLcV4O6RgsK/D5QFEAf/QMIzF9lT9WMAWkkxKXIHC0IwkeOnrf0Gy5ZeLAEaTT/1qqxx6APlFYllmeheBl4TqOq9Nt1RarG5h7q0cdgBkvCg28Sf9qISElXhhDvKKn4/a9riXpkDRALSbH/arysGWv99o9kRm1ORMFe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjiNGA9q; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjiNGA9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723765653; x=1755301653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/8XjNzrw7oCvSfUlGjLgVGFwXclWBizugfVvOZTpGc=;
  b=kjiNGA9qOfCC/hmTizOFTDEqcIEcWSlcAOwUzBPM1ellXfAgGP/Nme0d
   0FCaZTPa8D5SHEcPMM99CaQScDqkmqIRLE7M1n1VJmlPLProdchiDXQUw
   O0urgIjzlQ8ZBRp8WT9TEWkgufdi9gm8rlhySL3JGJ3kF2TKYymtAKaVs
   G9lgFfnrhrYEL4nFEx0PAuTbFGWdUNlnEkxnXXvbblrw4zqfjkplPn8Od
   PeGInKbwi7RuZ5Anj8ovowIbo8fv/FVSh0SLY4IZt0jS/50C0UQiE7ztG
   8hyXb0ATvcdNVbebcEgupyKRB71P15yDZrscWVQ2EtX0+rQRx3xdna2Mm
   w==;
X-CSE-ConnectionGUID: tctxEuIITpiB2ktcpmguVQ==
X-CSE-MsgGUID: CpqjmqwQRyCYcJA+tHf+qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="25850841"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="25850841"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 16:47:32 -0700
X-CSE-ConnectionGUID: +QTwgxwERTua2e1KvWQBpA==
X-CSE-MsgGUID: gjgeuhSpTdykPItbuI4aTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="64447606"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Aug 2024 16:47:29 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sekBi-0005ig-32;
	Thu, 15 Aug 2024 23:47:26 +0000
Date: Fri, 16 Aug 2024 07:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [linux-next:master 3959/4951]
 drivers/firmware/arm_scmi/transports/smc.c:235:3: error: write to reserved
 register 'R7'
Message-ID: <202408160737.MRlXwG46-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cristian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edd1ec2e3a9f5de7fb267a3af73e4f00e7e052b7
commit: d4ae39de300c808cf4ed38f56fc266ba3caf0507 [3959/4951] firmware: arm_scmi: Make SMC transport a standalone driver
config: arm-randconfig-002-20240816 (https://download.01.org/0day-ci/archive/20240816/202408160737.MRlXwG46-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160737.MRlXwG46-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160737.MRlXwG46-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/transports/smc.c:235:3: error: write to reserved register 'R7'
     235 |                 arm_smccc_1_1_invoke(scmi_info->func_id, scmi_info->cap_id, 0,
         |                 ^
   include/linux/arm-smccc.h:570:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     570 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:513:48: note: expanded from macro 'arm_smccc_1_1_smc'
     513 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^
   include/linux/arm-smccc.h:400:24: note: expanded from macro 'SMCCC_SMC_INST'
     400 | #define SMCCC_SMC_INST  __SMC(0)
         |                         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
     215 |         __inst_thumb32(thumb_opcode)
         |         ^
   arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
     205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
         |                           ^
   arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
     230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
         |         ^
>> drivers/firmware/arm_scmi/transports/smc.c:235:3: error: write to reserved register 'R7'
   include/linux/arm-smccc.h:567:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     567 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:529:48: note: expanded from macro 'arm_smccc_1_1_hvc'
     529 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^
   include/linux/arm-smccc.h:401:24: note: expanded from macro 'SMCCC_HVC_INST'
     401 | #define SMCCC_HVC_INST  __HVC(0)
         |                         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
     215 |         __inst_thumb32(thumb_opcode)
         |         ^
   arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
     205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
         |                           ^
   arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
     230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
         |         ^
>> drivers/firmware/arm_scmi/transports/smc.c:235:3: error: write to reserved register 'R7'
   include/linux/arm-smccc.h:573:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     573 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:540:8: note: expanded from macro '__fail_smccc_1_1'
     540 |                 asm ("" :                                               \
         |                      ^
   drivers/firmware/arm_scmi/transports/smc.c:238:3: error: write to reserved register 'R7'
     238 |                 arm_smccc_1_1_invoke(scmi_info->func_id, scmi_info->param_page,
         |                 ^
   include/linux/arm-smccc.h:570:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     570 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:513:48: note: expanded from macro 'arm_smccc_1_1_smc'
     513 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^
   include/linux/arm-smccc.h:400:24: note: expanded from macro 'SMCCC_SMC_INST'
     400 | #define SMCCC_SMC_INST  __SMC(0)
         |                         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
     215 |         __inst_thumb32(thumb_opcode)
         |         ^
   arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
     205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
         |                           ^
   arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
     230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
         |         ^
   drivers/firmware/arm_scmi/transports/smc.c:238:3: error: write to reserved register 'R7'
   include/linux/arm-smccc.h:567:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     567 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:529:48: note: expanded from macro 'arm_smccc_1_1_hvc'
     529 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^
   include/linux/arm-smccc.h:401:24: note: expanded from macro 'SMCCC_HVC_INST'
     401 | #define SMCCC_HVC_INST  __HVC(0)
         |                         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
     215 |         __inst_thumb32(thumb_opcode)
         |         ^
   arch/arm/include/asm/opcodes.h:205:27: note: expanded from macro '__inst_thumb32'
     205 | #define __inst_thumb32(x) ___inst_thumb32(                              \
         |                           ^
   arch/arm/include/asm/opcodes.h:230:2: note: expanded from macro '___inst_thumb32'
     230 |         ".short " __stringify(first) ", " __stringify(second) "\n\t"
         |         ^
   drivers/firmware/arm_scmi/transports/smc.c:238:3: error: write to reserved register 'R7'
   include/linux/arm-smccc.h:573:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     573 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:540:8: note: expanded from macro '__fail_smccc_1_1'
     540 |                 asm ("" :                                               \
         |                      ^
   6 errors generated.


vim +/R7 +235 drivers/firmware/arm_scmi/transports/smc.c

1dc6558062dadf drivers/firmware/arm_scmi/smc.c            Peng Fan         2020-03-08  219  
1dc6558062dadf drivers/firmware/arm_scmi/smc.c            Peng Fan         2020-03-08  220  static int smc_send_message(struct scmi_chan_info *cinfo,
1dc6558062dadf drivers/firmware/arm_scmi/smc.c            Peng Fan         2020-03-08  221  			    struct scmi_xfer *xfer)
1dc6558062dadf drivers/firmware/arm_scmi/smc.c            Peng Fan         2020-03-08  222  {
1dc6558062dadf drivers/firmware/arm_scmi/smc.c            Peng Fan         2020-03-08  223  	struct scmi_smc *scmi_info = cinfo->transport_info;
1dc6558062dadf drivers/firmware/arm_scmi/smc.c            Peng Fan         2020-03-08  224  	struct arm_smccc_res res;
1dc6558062dadf drivers/firmware/arm_scmi/smc.c            Peng Fan         2020-03-08  225  
f716cbd33f038a drivers/firmware/arm_scmi/smc.c            Cristian Marussi 2021-12-20  226  	/*
0bfdca8a8661aa drivers/firmware/arm_scmi/smc.c            Cristian Marussi 2021-12-20  227  	 * Channel will be released only once response has been
f716cbd33f038a drivers/firmware/arm_scmi/smc.c            Cristian Marussi 2021-12-20  228  	 * surely fully retrieved, so after .mark_txdone()
f716cbd33f038a drivers/firmware/arm_scmi/smc.c            Cristian Marussi 2021-12-20  229  	 */
0bfdca8a8661aa drivers/firmware/arm_scmi/smc.c            Cristian Marussi 2021-12-20  230  	smc_channel_lock_acquire(scmi_info, xfer);
1dc6558062dadf drivers/firmware/arm_scmi/smc.c            Peng Fan         2020-03-08  231  
d4ae39de300c80 drivers/firmware/arm_scmi/transports/smc.c Cristian Marussi 2024-08-12  232  	core->shmem->tx_prepare(scmi_info->shmem, xfer, cinfo);
1dc6558062dadf drivers/firmware/arm_scmi/smc.c            Peng Fan         2020-03-08  233  
da405477e76707 drivers/firmware/arm_scmi/smc.c            Nikunj Kela      2023-10-09  234  	if (scmi_info->cap_id != ULONG_MAX)
da405477e76707 drivers/firmware/arm_scmi/smc.c            Nikunj Kela      2023-10-09 @235  		arm_smccc_1_1_invoke(scmi_info->func_id, scmi_info->cap_id, 0,
da405477e76707 drivers/firmware/arm_scmi/smc.c            Nikunj Kela      2023-10-09  236  				     0, 0, 0, 0, 0, &res);
da405477e76707 drivers/firmware/arm_scmi/smc.c            Nikunj Kela      2023-10-09  237  	else
1f17395124a53a drivers/firmware/arm_scmi/smc.c            Sudeep Holla     2023-10-09  238  		arm_smccc_1_1_invoke(scmi_info->func_id, scmi_info->param_page,
da405477e76707 drivers/firmware/arm_scmi/smc.c            Nikunj Kela      2023-10-09  239  				     scmi_info->param_offset, 0, 0, 0, 0, 0,
da405477e76707 drivers/firmware/arm_scmi/smc.c            Nikunj Kela      2023-10-09  240  				     &res);
dd820ee21d5e07 drivers/firmware/arm_scmi/smc.c            Jim Quinlan      2020-12-22  241  
f7199cf489027a drivers/firmware/arm_scmi/smc.c            Sudeep Holla     2020-04-17  242  	/* Only SMCCC_RET_NOT_SUPPORTED is valid error code */
f716cbd33f038a drivers/firmware/arm_scmi/smc.c            Cristian Marussi 2021-12-20  243  	if (res.a0) {
0bfdca8a8661aa drivers/firmware/arm_scmi/smc.c            Cristian Marussi 2021-12-20  244  		smc_channel_lock_release(scmi_info);
f7199cf489027a drivers/firmware/arm_scmi/smc.c            Sudeep Holla     2020-04-17  245  		return -EOPNOTSUPP;
f716cbd33f038a drivers/firmware/arm_scmi/smc.c            Cristian Marussi 2021-12-20  246  	}
f716cbd33f038a drivers/firmware/arm_scmi/smc.c            Cristian Marussi 2021-12-20  247  
f7199cf489027a drivers/firmware/arm_scmi/smc.c            Sudeep Holla     2020-04-17  248  	return 0;
1dc6558062dadf drivers/firmware/arm_scmi/smc.c            Peng Fan         2020-03-08  249  }
1dc6558062dadf drivers/firmware/arm_scmi/smc.c            Peng Fan         2020-03-08  250  

:::::: The code at line 235 was first introduced by commit
:::::: da405477e7670782241234ea6b4309f3224ecb63 firmware: arm_scmi: Add qcom smc/hvc transport support

:::::: TO: Nikunj Kela <quic_nkela@quicinc.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
