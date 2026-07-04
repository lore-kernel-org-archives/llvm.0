Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B443921E9;
	Sat,  4 Jul 2026 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150634; cv=none; b=N3NZpRZTLX0TA12+k17OQFtyomih0pbmcf/8EENS0vqH3F8TE5CWcxYuQAW19QItjvt/x2RRCCDImE3SQfYeRj98gyfo4CfFVDdHcbLawOHr8hd4JP4aNKZLBxjwJJCi0zM+Vc7knukUzEmUnEVxlVop44ZV62arNE7qtNLfwJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150634; c=relaxed/simple;
	bh=mjrfFco1YljV0Ryh/w16upl/ip4/132pGTwKRFBYH0o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qK+9wfUADODRK0HB231BrS/u/SGhvEThqJ0H+aTEH6AGSzKn08O/5D6+2QsyH72iG716LRokxtrc4clO/A0MOIsOPvL11pzUDWPvdDo8z5l7dLCF7vUTk1PCfkmc6B+MuSrfvO60f3/aBGeawRwVaWbqgnpEU5fAozHWL4aXEfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/CLsoIA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/CLsoIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783150625; x=1814686625;
  h=date:from:to:cc:subject:message-id;
  bh=mjrfFco1YljV0Ryh/w16upl/ip4/132pGTwKRFBYH0o=;
  b=X/CLsoIA1vXLHo2cPzQVJK6docJr+hamFVzQG/HUFSARnfpLRPN6WTo/
   4BO/bXxo+8ErxA5AfQ1RVIELakUkFs90c6TrcF9Em4nXALKy7vyR7+K7D
   S8E6GKUQFFCmlGSajhnh4VEBb4vuXE/tlSy8RBK1sd4gDKD1MTiPaIvwX
   ewmYOoCb4f0qIJykiuUmCKPWNNo17/MftC5xmBim9Ej+FGbLzq8FI+wy6
   K4lKgeQq9PGMbTjegVQgnam14uOgvJJbpK++eE6COqbGbTJpCZqHfkkCg
   eHH0vfrLDZ6+v1jQfLSE27aRG3iFbT/OWyljHmE1YW9qFIF0TC0jLzxV8
   Q==;
X-CSE-ConnectionGUID: peMoxQMwSMKJdFyWZyffFQ==
X-CSE-MsgGUID: 50nWWhH8QSSvnoQxv8CRVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87699819"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="87699819"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 00:37:02 -0700
X-CSE-ConnectionGUID: xASlZaIQRd2KSMaqCs8CzA==
X-CSE-MsgGUID: hgtekTLmTrur3psJZD6Lfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="257148126"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2026 00:37:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfuvp-00000000Cux-1pgP;
	Sat, 04 Jul 2026 07:36:57 +0000
Date: Sat, 04 Jul 2026 15:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: 
 [bod:qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4 120/121]
 drivers/media/platform/qcom/camss/camss-icp.c:578:15: error: initializing
 'const char **const' with an expression of type 'const char *const[20]'
 discards qualifiers
Message-ID: <202607041557.GCi7iiUR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Bryan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4
head:   ebd1e440443121d18f730ab2aeea5586a754f36f
commit: 782e70f1ad20204721b37ade4a33837e76ac3b86 [120/121] media: qcom: camss: Switch on ICP and BPS as make options
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260704/202607041557.GCi7iiUR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041557.GCi7iiUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041557.GCi7iiUR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/qcom/camss/camss-icp.c:26:
   In file included from drivers/media/platform/qcom/camss/camss-icp.h:14:
>> drivers/media/platform/qcom/camss/camss-icp-hfi.h:479:36: warning: declaration of 'struct icp_device' will not be visible outside of this function [-Wvisibility]
     479 | int icp_hfi_set_ubwc_config(struct icp_device *icp, u32 dev_type,
         |                                    ^
>> drivers/media/platform/qcom/camss/camss-icp-hfi.h:480:15: warning: declaration of 'struct icp_ubwc_cfg' will not be visible outside of this function [-Wvisibility]
     480 |                             struct icp_ubwc_cfg *cfg);
         |                                    ^
>> drivers/media/platform/qcom/camss/camss-icp.c:224:6: warning: no previous prototype for function 'icp_dump_gp_regs' [-Wmissing-prototypes]
     224 | void icp_dump_gp_regs(struct camss_icp *icp, const char *label)
         |      ^
   drivers/media/platform/qcom/camss/camss-icp.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     224 | void icp_dump_gp_regs(struct camss_icp *icp, const char *label)
         | ^
         | static 
   drivers/media/platform/qcom/camss/camss-icp.c:243:17: warning: unused variable 'dev' [-Wunused-variable]
     243 |         struct device *dev = hfi->dev;
         |                        ^~~
>> drivers/media/platform/qcom/camss/camss-icp.c:240:6: warning: no previous prototype for function 'icp_hfi_latch_regs' [-Wmissing-prototypes]
     240 | void icp_hfi_latch_regs(struct camss_icp *icp)
         |      ^
   drivers/media/platform/qcom/camss/camss-icp.c:240:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     240 | void icp_hfi_latch_regs(struct camss_icp *icp)
         | ^
         | static 
>> drivers/media/platform/qcom/camss/camss-icp.c:578:15: error: initializing 'const char **const' with an expression of type 'const char *const[20]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     578 |         .clk_names = x1e80100_clk_names,
         |                      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-icp.c:580:15: error: initializing 'const char **const' with an expression of type 'const char *const[4]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     580 |         .noc_names = x1e80100_noc_names,
         |                      ^~~~~~~~~~~~~~~~~~
   5 warnings and 2 errors generated.
--
>> drivers/media/platform/qcom/camss/camss-bps.c:26:10: fatal error: 'camss-bps-cmd.h' file not found
      26 | #include "camss-bps-cmd.h"
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +578 drivers/media/platform/qcom/camss/camss-icp.c

63514548c205d2 Bryan O'Donoghue 2026-07-03  575  
63514548c205d2 Bryan O'Donoghue 2026-07-03  576  struct camss_icp_resources x1e80100_icp_res = {
63514548c205d2 Bryan O'Donoghue 2026-07-03  577  	.pas_id = 33,
63514548c205d2 Bryan O'Donoghue 2026-07-03 @578  	.clk_names = x1e80100_clk_names,
63514548c205d2 Bryan O'Donoghue 2026-07-03  579  	.clk_num = ARRAY_SIZE(x1e80100_clk_names),
63514548c205d2 Bryan O'Donoghue 2026-07-03  580  	.noc_names = x1e80100_noc_names,
63514548c205d2 Bryan O'Donoghue 2026-07-03  581  	.noc_num = ARRAY_SIZE(x1e80100_noc_names),
63514548c205d2 Bryan O'Donoghue 2026-07-03  582  	.hfi_res = {
63514548c205d2 Bryan O'Donoghue 2026-07-03  583  		.shmem_size = SZ_1M,	 // change to 0x0FC00000 per downstream ?
63514548c205d2 Bryan O'Donoghue 2026-07-03  584  		.qdss_size = SZ_1M,
63514548c205d2 Bryan O'Donoghue 2026-07-03  585  		.fwuncached_size = 7 * SZ_1M,
63514548c205d2 Bryan O'Donoghue 2026-07-03  586  		/*
63514548c205d2 Bryan O'Donoghue 2026-07-03  587  		 * Carve sub-regions from FwUncached:
63514548c205d2 Bryan O'Donoghue 2026-07-03  588  		 * Over-allocate as CamX does for now.
63514548c205d2 Bryan O'Donoghue 2026-07-03  589  		 *   +0x000000: SecHeap (1MB)
63514548c205d2 Bryan O'Donoghue 2026-07-03  590  		 *   +0x100000: QTBL (1MB)
63514548c205d2 Bryan O'Donoghue 2026-07-03  591  		 *   +0x200000: CMD_Q (1MB)
63514548c205d2 Bryan O'Donoghue 2026-07-03  592  		 *   +0x300000: MSG_Q (1MB)
63514548c205d2 Bryan O'Donoghue 2026-07-03  593  		 *   +0x400000: DBG_Q (1MB)
63514548c205d2 Bryan O'Donoghue 2026-07-03  594  		 *   +0x500000: SFR (1MB alloc 4KB used)
63514548c205d2 Bryan O'Donoghue 2026-07-03  595  		 */
63514548c205d2 Bryan O'Donoghue 2026-07-03  596  		.secheap_size = SZ_1M,
63514548c205d2 Bryan O'Donoghue 2026-07-03  597  		.q_tbl_size = SZ_1M,
63514548c205d2 Bryan O'Donoghue 2026-07-03  598  		.qdata_size[HFI_Q_CMD_TYPE] = SZ_1M,
63514548c205d2 Bryan O'Donoghue 2026-07-03  599  		.qdata_size[HFI_Q_MSG_TYPE] = SZ_1M,
63514548c205d2 Bryan O'Donoghue 2026-07-03  600  		.qdata_size[HFI_Q_DBG_TYPE] = SZ_1M,
63514548c205d2 Bryan O'Donoghue 2026-07-03  601  		.sfr_size = SZ_1M,
63514548c205d2 Bryan O'Donoghue 2026-07-03  602  	},
63514548c205d2 Bryan O'Donoghue 2026-07-03  603  };
63514548c205d2 Bryan O'Donoghue 2026-07-03  604  

:::::: The code at line 578 was first introduced by commit
:::::: 63514548c205d2605589a9789c27343506074acd media: qcom: camss: qcom-icp: Add minimal ICP driver with HFI infrastrucutre

:::::: TO: Bryan O'Donoghue <bod@kernel.org>
:::::: CC: Bryan O'Donoghue <bod@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
