Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EDB394474;
	Thu,  7 May 2026 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144272; cv=none; b=RuTZWOGsPFhzri5vKVU/Hv0qMnPgOMh5RWHTRyDGMuE/2EcyFDy/WuZoCDTh06OQACaqWjv7oHI9WZCRV+lxxkmPB5MV9NBqaJ/LBNz22lqCGdFjcPtsWebL6AiTMyQeRshQBl1lDY/95S6F/UWagijcrkLidkDjufb5xSciF+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144272; c=relaxed/simple;
	bh=cHcYiIB31kTFmN5tVJRDPvRCT0ebJbGY7ygT3fERYko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfabZVBcYJQeiVu+eAbkzlNY3CKdodZpo1X30wQQIPIzj63d8ELHPFjXaBpiQ8gOAGY+NVQ86BR+bJDJO+knDyaNZdtql4WE9xcDryp53nQvE/1hxGVf0AZeUjuM0Lp6y21jWdb1H3Cvq5tUlYqo3iyYYcNgbkgU42Kea8cxHxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UE0HVVDu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UE0HVVDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778144266; x=1809680266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cHcYiIB31kTFmN5tVJRDPvRCT0ebJbGY7ygT3fERYko=;
  b=UE0HVVDuWPzA8d/tcoA0HS1RPHITdQLeODiMFHi1GZ9EcGf1iTf2GdSU
   MqonltRtRgbHUGoUXhP45Fu5jKlmCU70m+yWVKi/T32IBqbLHlOlg0adp
   nuOr+4JWpbox2ym2M/k85RwsQTeogDs/4n1iGOS+fu4pmF1RhtFzgd1iy
   kbex+zYNxn7lxnQDYGPjp0LYdT5X65nit7s16U/d/EOmf3V4v9ppMyTOF
   v0p8gjP50SZ8QecfEx0UljQKVrQhfquyF0zNrDJzgN+/R6hNM4h8QHrKK
   XZK71U2kcQFoxmjaGdDmqFOO0v/b1mEOIOj7OMwEKgzN6kfETtdlDiXRc
   A==;
X-CSE-ConnectionGUID: w5zgm1+HTZiYb1bcY2CVRA==
X-CSE-MsgGUID: qtgkL+clTUGf/gMuwONKeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79198572"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79198572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 01:57:40 -0700
X-CSE-ConnectionGUID: xKhl4r4fQnuInnjNvm+EsQ==
X-CSE-MsgGUID: pHvPIPflRXOzCLwvmFAExw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="266783647"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2026 01:57:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKuY0-000000006nx-09wI;
	Thu, 07 May 2026 08:57:32 +0000
Date: Thu, 7 May 2026 10:56:45 +0200
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] rhashtable: Bounce deferred worker kick through
 irq_work when insecure_elasticity is set
Message-ID: <202605071043.7pOYYoAU-lkp@intel.com>
References: <67fedbf2-914b-44f7-9422-1fe97d833705@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67fedbf2-914b-44f7-9422-1fe97d833705@kernel.org>

Hi Tejun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.0]
[cannot apply to tj-sched-ext/for-7.1-fixes linus/master next-20260506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tejun-Heo/rhashtable-Bounce-deferred-worker-kick-through-irq_work-when-insecure_elasticity-is-set/20260426-103416
base:   v7.0
patch link:    https://lore.kernel.org/r/67fedbf2-914b-44f7-9422-1fe97d833705%40kernel.org
patch subject: [RFC PATCH] rhashtable: Bounce deferred worker kick through irq_work when insecure_elasticity is set
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260507/202605071043.7pOYYoAU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071043.7pOYYoAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071043.7pOYYoAU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ipc/msg.c:41:
   include/linux/rhashtable.h:768:12: error: no member named 'insecure_elasticity' in 'struct rhashtable_params'
     768 |         if (ht->p.insecure_elasticity)
         |             ~~~~~ ^
>> ipc/msg.c:497:20: warning: implicit conversion from 'int' to 'unsigned short' changes value from 32768000 to 0 [-Wconstant-conversion]
     497 |         msginfo->msgseg = MSGSEG;
         |                         ~ ^~~~~~
   include/uapi/linux/msg.h:87:38: note: expanded from macro 'MSGSEG'
      87 | #define MSGSEG (__MSGSEG <= 0xffff ? __MSGSEG : 0xffff)
         |                                      ^~~~~~~~
   include/uapi/linux/msg.h:86:36: note: expanded from macro '__MSGSEG'
      86 | #define __MSGSEG ((MSGPOOL * 1024) / MSGSSZ) /* max no. of segments */
         |                   ~~~~~~~~~~~~~~~~~^~~~~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:29:
   In file included from include/linux/bpf_trace.h:5:
   In file included from include/trace/events/xdp.h:288:
   In file included from include/net/xdp_priv.h:5:
   include/linux/rhashtable.h:768:12: error: no member named 'insecure_elasticity' in 'struct rhashtable_params'
     768 |         if (ht->p.insecure_elasticity)
         |             ~~~~~ ^
>> drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8878:14: warning: division by zero is undefined [-Wdivision-by-zero]
    8878 |         cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_HW_VLAN,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8879 |                                    IXGBE_ADVTXD_DCMD_VLE);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8868:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8868 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8882:14: warning: division by zero is undefined [-Wdivision-by-zero]
    8882 |         cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_TSO,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8883 |                                    IXGBE_ADVTXD_DCMD_TSE);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8868:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8868 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8886:14: warning: division by zero is undefined [-Wdivision-by-zero]
    8886 |         cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_TSTAMP,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8887 |                                    IXGBE_ADVTXD_MAC_TSTAMP);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8868:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8868 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8890:14: warning: division by zero is undefined [-Wdivision-by-zero]
    8890 |         cmd_type ^= IXGBE_SET_FLAG(skb->no_fcs, 1, IXGBE_ADVTXD_DCMD_IFCS);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8868:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8868 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8901:19: warning: division by zero is undefined [-Wdivision-by-zero]
    8901 |         olinfo_status |= IXGBE_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
    8902 |                                         IXGBE_TX_FLAGS_CSUM,
         |                                         ~~~~~~~~~~~~~~~~~~~~
    8903 |                                         IXGBE_ADVTXD_POPTS_TXSM);
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8868:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8868 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8906:19: warning: division by zero is undefined [-Wdivision-by-zero]
    8906 |         olinfo_status |= IXGBE_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
    8907 |                                         IXGBE_TX_FLAGS_IPV4,
         |                                         ~~~~~~~~~~~~~~~~~~~~
    8908 |                                         IXGBE_ADVTXD_POPTS_IXSM);
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8868:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8868 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8911:19: warning: division by zero is undefined [-Wdivision-by-zero]
    8911 |         olinfo_status |= IXGBE_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
    8912 |                                         IXGBE_TX_FLAGS_IPSEC,
         |                                         ~~~~~~~~~~~~~~~~~~~~~
    8913 |                                         IXGBE_ADVTXD_POPTS_IPSEC);
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8868:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8868 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8919:19: warning: division by zero is undefined [-Wdivision-by-zero]
    8919 |         olinfo_status |= IXGBE_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
    8920 |                                         IXGBE_TX_FLAGS_CC,
         |                                         ~~~~~~~~~~~~~~~~~~
    8921 |                                         IXGBE_ADVTXD_CC);
         |                                         ~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8868:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8868 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   8 warnings and 1 error generated.


vim +497 ipc/msg.c

a0d092fc2df845 Pierre Peiffer  2008-04-29  476  
156d9ed1260ee5 Al Viro         2017-07-09  477  static int msgctl_info(struct ipc_namespace *ns, int msqid,
156d9ed1260ee5 Al Viro         2017-07-09  478  			 int cmd, struct msginfo *msginfo)
a0d092fc2df845 Pierre Peiffer  2008-04-29  479  {
2cafed30f150f7 Davidlohr Bueso 2013-07-08  480  	int err;
27c331a1746142 Manfred Spraul  2018-08-21  481  	int max_idx;
5a06a363ef4844 Ingo Molnar     2006-07-30  482  
5a06a363ef4844 Ingo Molnar     2006-07-30  483  	/*
5a06a363ef4844 Ingo Molnar     2006-07-30  484  	 * We must not return kernel stack data.
^1da177e4c3f41 Linus Torvalds  2005-04-16  485  	 * due to padding, it's not enough
^1da177e4c3f41 Linus Torvalds  2005-04-16  486  	 * to set all member fields.
^1da177e4c3f41 Linus Torvalds  2005-04-16  487  	 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  488  	err = security_msg_queue_msgctl(NULL, cmd);
^1da177e4c3f41 Linus Torvalds  2005-04-16  489  	if (err)
^1da177e4c3f41 Linus Torvalds  2005-04-16  490  		return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  491  
156d9ed1260ee5 Al Viro         2017-07-09  492  	memset(msginfo, 0, sizeof(*msginfo));
156d9ed1260ee5 Al Viro         2017-07-09  493  	msginfo->msgmni = ns->msg_ctlmni;
156d9ed1260ee5 Al Viro         2017-07-09  494  	msginfo->msgmax = ns->msg_ctlmax;
156d9ed1260ee5 Al Viro         2017-07-09  495  	msginfo->msgmnb = ns->msg_ctlmnb;
156d9ed1260ee5 Al Viro         2017-07-09  496  	msginfo->msgssz = MSGSSZ;
156d9ed1260ee5 Al Viro         2017-07-09 @497  	msginfo->msgseg = MSGSEG;
d9a605e40b1376 Davidlohr Bueso 2013-09-11  498  	down_read(&msg_ids(ns).rwsem);
72d1e611082eda Jiebin Sun      2022-09-14  499  	if (cmd == MSG_INFO)
156d9ed1260ee5 Al Viro         2017-07-09  500  		msginfo->msgpool = msg_ids(ns).in_use;
72d1e611082eda Jiebin Sun      2022-09-14  501  	max_idx = ipc_get_maxidx(&msg_ids(ns));
72d1e611082eda Jiebin Sun      2022-09-14  502  	up_read(&msg_ids(ns).rwsem);
72d1e611082eda Jiebin Sun      2022-09-14  503  	if (cmd == MSG_INFO) {
72d1e611082eda Jiebin Sun      2022-09-14  504  		msginfo->msgmap = min_t(int,
72d1e611082eda Jiebin Sun      2022-09-14  505  				     percpu_counter_sum(&ns->percpu_msg_hdrs),
72d1e611082eda Jiebin Sun      2022-09-14  506  				     INT_MAX);
72d1e611082eda Jiebin Sun      2022-09-14  507  		msginfo->msgtql = min_t(int,
72d1e611082eda Jiebin Sun      2022-09-14  508  		                     percpu_counter_sum(&ns->percpu_msg_bytes),
72d1e611082eda Jiebin Sun      2022-09-14  509  				     INT_MAX);
^1da177e4c3f41 Linus Torvalds  2005-04-16  510  	} else {
156d9ed1260ee5 Al Viro         2017-07-09  511  		msginfo->msgmap = MSGMAP;
156d9ed1260ee5 Al Viro         2017-07-09  512  		msginfo->msgpool = MSGPOOL;
156d9ed1260ee5 Al Viro         2017-07-09  513  		msginfo->msgtql = MSGTQL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  514  	}
27c331a1746142 Manfred Spraul  2018-08-21  515  	return (max_idx < 0) ? 0 : max_idx;
^1da177e4c3f41 Linus Torvalds  2005-04-16  516  }
2cafed30f150f7 Davidlohr Bueso 2013-07-08  517  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
