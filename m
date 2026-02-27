Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7BD313537;
	Fri, 27 Feb 2026 07:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772176769; cv=none; b=cuxuzwF/DgcV+d0RPG8/lWItBfLSjnUkChcVt8hAwIK+/aUIXbl14m0pPf6whSm1ueUB1eXViGhcIlyq8XoqqDkJt1ufQVCG6nGky98KzghKPFNIJWJG6ET4Byz/JFas7hrPFIqUtaIREGvVbQ9//Ux+QzwDZBb3fL9DF+fFowc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772176769; c=relaxed/simple;
	bh=2U53TjftEbw5RN5cFTwe+ZbypmuYQqDKNrfhNmnoT+k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hBb9XuvAB/+1itdBgvahz8cUPBnPiXYMslS+6u2N+WpDFa1oyNtcDDPQGhrZFsGmHnEtJj2nDthCa/9aBPc2fRDx4GXjZ5NlGNY3OYUgpmHWIMTapY5UrGS9Bb0XIeLLMPKX5DkAOEKiyZLSzTvg/V9JfheazCyOCAP/zQk/sEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRdXbvc/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRdXbvc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772176768; x=1803712768;
  h=date:from:to:cc:subject:message-id;
  bh=2U53TjftEbw5RN5cFTwe+ZbypmuYQqDKNrfhNmnoT+k=;
  b=BRdXbvc/OenAgMG+xoOL3R3WzJLq2ERcAVQXQnyGnT7ctgwvNuesT6oR
   7WDPgBt4Z7KJm+gPKzITCCEpl3tOXUwkb1f/FXI3gYqVlDDHrcimJul9Q
   gBjWdtPfdd8jT5zhUcri9HKFv5mp9aWxFr4QNYFeRD/U86Nka/jXE/c/j
   DMf7ClULBol7gPuikeTlhC8bQCDVtJbCVS+/KMV9tqVAYj2k3qe3FE9oa
   cXeIZQAppmVOp6+7Hda3b6l6uQ92gqofiIpuSy4Q62/mEhQv0FOU8/Z5I
   2qxP8tT9SvBnPyjvD8o79kmb2lJahh9wE073TmBHN8PR54Jq146fu+aya
   Q==;
X-CSE-ConnectionGUID: ZdWQ6PLKRCiVs7/KVhly9A==
X-CSE-MsgGUID: ZzlsloDrTte5d+evkvJgjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90658089"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="90658089"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 23:19:26 -0800
X-CSE-ConnectionGUID: wC7EKBS+QDS5AhQSs9Frhw==
X-CSE-MsgGUID: eVYoHptxRQSva2c1hKq7dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="216720761"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2026 23:19:24 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvs89-00000000AJJ-1eZB;
	Fri, 27 Feb 2026 07:19:21 +0000
Date: Fri, 27 Feb 2026 15:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260226-0944 30/32]
 drivers/infiniband/hw/hfi2/sdma_defs.h:7:9: warning: '_HFI2_SDMA_DEFS_H' is
 used as a header guard here, followed by #define of a different macro
Message-ID: <202602271552.pLL2VD5M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260226-0944
head:   06fbcbb2c9e97584450614a6d14c0d0f978b8209
commit: 62158d11e11c670a30dd0becb21732fef40a1ab8 [30/32] RDMA/hfi2: Make it build
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260227/202602271552.pLL2VD5M-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271552.pLL2VD5M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271552.pLL2VD5M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/hfi2/affinity.c:11:
   In file included from drivers/infiniband/hw/hfi2/hfi2.h:40:
   In file included from drivers/infiniband/hw/hfi2/verbs.h:31:
   In file included from drivers/infiniband/hw/hfi2/iowait.h:14:
   In file included from drivers/infiniband/hw/hfi2/sdma_txreq.h:9:
>> drivers/infiniband/hw/hfi2/sdma_defs.h:7:9: warning: '_HFI2_SDMA_DEFS_H' is used as a header guard here, followed by #define of a different macro [-Wheader-guard]
       7 | #ifndef _HFI2_SDMA_DEFS_H
         |         ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/hfi2/sdma_defs.h:8:9: note: '_HFI2_SMDA_DEFS_H' is defined here; did you mean '_HFI2_SDMA_DEFS_H'?
       8 | #define _HFI2_SMDA_DEFS_H
         |         ^~~~~~~~~~~~~~~~~
         |         _HFI2_SDMA_DEFS_H
   1 warning generated.
--
>> Warning: drivers/infiniband/hw/hfi2/affinity.c:92 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Remove HT/SMT threads from cores in @cpus.
--
   In file included from drivers/infiniband/hw/hfi2/chip.c:16:
   In file included from drivers/infiniband/hw/hfi2/hfi2.h:40:
   In file included from drivers/infiniband/hw/hfi2/verbs.h:31:
   In file included from drivers/infiniband/hw/hfi2/iowait.h:14:
   In file included from drivers/infiniband/hw/hfi2/sdma_txreq.h:9:
>> drivers/infiniband/hw/hfi2/sdma_defs.h:7:9: warning: '_HFI2_SDMA_DEFS_H' is used as a header guard here, followed by #define of a different macro [-Wheader-guard]
       7 | #ifndef _HFI2_SDMA_DEFS_H
         |         ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/hfi2/sdma_defs.h:8:9: note: '_HFI2_SMDA_DEFS_H' is defined here; did you mean '_HFI2_SDMA_DEFS_H'?
       8 | #define _HFI2_SMDA_DEFS_H
         |         ^~~~~~~~~~~~~~~~~
         |         _HFI2_SDMA_DEFS_H
>> drivers/infiniband/hw/hfi2/chip.c:11131:28: warning: variable 'extended_vl' set but not used [-Wunused-but-set-variable]
    11131 |         unsigned int qpns_per_vl, extended_vl, ctxt, i, qpn, n, m;
          |                                   ^
   2 warnings generated.
--
>> Warning: drivers/infiniband/hw/hfi2/chip_gen.c:588 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Ask cport firmware for the temperature.
--
   In file included from drivers/infiniband/hw/hfi2/cport.c:13:
   In file included from drivers/infiniband/hw/hfi2/hfi2.h:40:
   In file included from drivers/infiniband/hw/hfi2/verbs.h:31:
   In file included from drivers/infiniband/hw/hfi2/iowait.h:14:
   In file included from drivers/infiniband/hw/hfi2/sdma_txreq.h:9:
>> drivers/infiniband/hw/hfi2/sdma_defs.h:7:9: warning: '_HFI2_SDMA_DEFS_H' is used as a header guard here, followed by #define of a different macro [-Wheader-guard]
       7 | #ifndef _HFI2_SDMA_DEFS_H
         |         ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/hfi2/sdma_defs.h:8:9: note: '_HFI2_SMDA_DEFS_H' is defined here; did you mean '_HFI2_SDMA_DEFS_H'?
       8 | #define _HFI2_SMDA_DEFS_H
         |         ^~~~~~~~~~~~~~~~~
         |         _HFI2_SDMA_DEFS_H
>> drivers/infiniband/hw/hfi2/cport.c:843:50: warning: result of comparison of constant 256 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     843 |         if (op_start > op_end || op_start < 0 || op_end >= 256)
         |                                                  ~~~~~~ ^  ~~~
   2 warnings generated.
--
>> Warning: drivers/infiniband/hw/hfi2/chip.c:8166 function parameter 'ppd' not described in 'set_hdrq_regs'
>> Warning: drivers/infiniband/hw/hfi2/chip.c:10799 function parameter 'ppd' not described in 'hfi2_get_qp_map'
>> Warning: drivers/infiniband/hw/hfi2/chip.c:10843 function parameter 'ppd' not described in 'init_qpmap_table'
>> Warning: drivers/infiniband/hw/hfi2/chip.c:8166 function parameter 'ppd' not described in 'set_hdrq_regs'
>> Warning: drivers/infiniband/hw/hfi2/chip.c:10799 function parameter 'ppd' not described in 'hfi2_get_qp_map'
>> Warning: drivers/infiniband/hw/hfi2/chip.c:10843 function parameter 'ppd' not described in 'init_qpmap_table'
--
   In file included from drivers/infiniband/hw/hfi2/init.c:19:
   In file included from drivers/infiniband/hw/hfi2/hfi2.h:40:
   In file included from drivers/infiniband/hw/hfi2/verbs.h:31:
   In file included from drivers/infiniband/hw/hfi2/iowait.h:14:
   In file included from drivers/infiniband/hw/hfi2/sdma_txreq.h:9:
>> drivers/infiniband/hw/hfi2/sdma_defs.h:7:9: warning: '_HFI2_SDMA_DEFS_H' is used as a header guard here, followed by #define of a different macro [-Wheader-guard]
       7 | #ifndef _HFI2_SDMA_DEFS_H
         |         ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/hfi2/sdma_defs.h:8:9: note: '_HFI2_SMDA_DEFS_H' is defined here; did you mean '_HFI2_SDMA_DEFS_H'?
       8 | #define _HFI2_SMDA_DEFS_H
         |         ^~~~~~~~~~~~~~~~~
         |         _HFI2_SDMA_DEFS_H
>> drivers/infiniband/hw/hfi2/init.c:2499:6: warning: variable 'initfail' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2499 |         if (!ret)
         |             ^~~~
   drivers/infiniband/hw/hfi2/init.c:2502:7: note: uninitialized use occurs here
    2502 |         if (!initfail && !ret)
         |              ^~~~~~~~
   drivers/infiniband/hw/hfi2/init.c:2499:2: note: remove the 'if' if its condition is always true
    2499 |         if (!ret)
         |         ^~~~~~~~~
    2500 |                 initfail = hfi2_init(dd, 0);
   drivers/infiniband/hw/hfi2/init.c:2389:29: note: initialize the variable 'initfail' to silence this warning
    2389 |         int ret = 0, pidx, initfail;
         |                                    ^
         |                                     = 0
   2 warnings generated.
--
>> Warning: drivers/infiniband/hw/hfi2/intr.c:78 function parameter 'ppd' not described in 'handle_linkup_change'
>> Warning: drivers/infiniband/hw/hfi2/intr.c:78 function parameter 'ppd' not described in 'handle_linkup_change'
--
>> Warning: drivers/infiniband/hw/hfi2/init.c:970 function parameter 'index' not described in 'allocate_rcd_index'
>> Warning: drivers/infiniband/hw/hfi2/init.c:1988 function parameter 'params' not described in 'hfi2_alloc_devdata'
>> Warning: drivers/infiniband/hw/hfi2/init.c:970 function parameter 'index' not described in 'allocate_rcd_index'
>> Warning: drivers/infiniband/hw/hfi2/init.c:1988 function parameter 'params' not described in 'hfi2_alloc_devdata'
--
   In file included from drivers/infiniband/hw/hfi2/pinning.c:10:
   In file included from drivers/infiniband/hw/hfi2/trace.h:15:
   In file included from drivers/infiniband/hw/hfi2/trace_dbg.h:12:
   In file included from drivers/infiniband/hw/hfi2/hfi2.h:40:
   In file included from drivers/infiniband/hw/hfi2/verbs.h:31:
   In file included from drivers/infiniband/hw/hfi2/iowait.h:14:
   In file included from drivers/infiniband/hw/hfi2/sdma_txreq.h:9:
>> drivers/infiniband/hw/hfi2/sdma_defs.h:7:9: warning: '_HFI2_SDMA_DEFS_H' is used as a header guard here, followed by #define of a different macro [-Wheader-guard]
       7 | #ifndef _HFI2_SDMA_DEFS_H
         |         ^~~~~~~~~~~~~~~~~
   drivers/infiniband/hw/hfi2/sdma_defs.h:8:9: note: '_HFI2_SMDA_DEFS_H' is defined here; did you mean '_HFI2_SDMA_DEFS_H'?
       8 | #define _HFI2_SMDA_DEFS_H
         |         ^~~~~~~~~~~~~~~~~
         |         _HFI2_SDMA_DEFS_H
   In file included from drivers/infiniband/hw/hfi2/pinning.c:7:
   In file included from include/linux/string.h:386:
   include/linux/fortify-string.h:478:4: warning: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
     478 |                         __write_overflow_field(p_size_field, size);
         |                         ^
   2 warnings generated.
--
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:302 function parameter 'ppd' not described in 'hfi2_netdev_rx_init'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:323 function parameter 'ppd' not described in 'hfi2_netdev_rx_destroy'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:404 function parameter 'ppd' not described in 'hfi2_netdev_enable_queues'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:444 function parameter 'ppd' not described in 'hfi2_netdev_add_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:458 function parameter 'ppd' not described in 'hfi2_netdev_remove_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:471 function parameter 'ppd' not described in 'hfi2_netdev_get_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:484 function parameter 'ppd' not described in 'hfi2_netdev_get_first_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:302 function parameter 'ppd' not described in 'hfi2_netdev_rx_init'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:323 function parameter 'ppd' not described in 'hfi2_netdev_rx_destroy'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:404 function parameter 'ppd' not described in 'hfi2_netdev_enable_queues'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:444 function parameter 'ppd' not described in 'hfi2_netdev_add_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:458 function parameter 'ppd' not described in 'hfi2_netdev_remove_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:471 function parameter 'ppd' not described in 'hfi2_netdev_get_data'
>> Warning: drivers/infiniband/hw/hfi2/netdev_rx.c:484 function parameter 'ppd' not described in 'hfi2_netdev_get_first_data'
..


vim +/_HFI2_SDMA_DEFS_H +7 drivers/infiniband/hw/hfi2/sdma_defs.h

3ee29f993aa1b6 Dennis Dalessandro 2026-01-21 @7  #ifndef _HFI2_SDMA_DEFS_H
3ee29f993aa1b6 Dennis Dalessandro 2026-01-21  8  #define _HFI2_SMDA_DEFS_H
3ee29f993aa1b6 Dennis Dalessandro 2026-01-21  9  

:::::: The code at line 7 was first introduced by commit
:::::: 3ee29f993aa1b67ceb78e1a10847d432be93558a RDMA/hfi2: Add IO related headers

:::::: TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
:::::: CC: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
