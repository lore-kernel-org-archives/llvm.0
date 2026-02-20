Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382F82773EC;
	Fri, 20 Feb 2026 05:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771565165; cv=none; b=LoFx1QcRdgfzTZw+an7aPos2bD+M0vMeyz1h/BFpl8sNM/0/slUMT035U1esdwR2aVTPJSdwGM+FMARGbDYx3SfZsQIulRcx+bpjCCbQOqLJTcHBF0P7wCgCJtOkmg933hrli3GLgDth85jXvKqlLLo4j/7K++uk8W70euph+TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771565165; c=relaxed/simple;
	bh=5yll32r30jwkh9CmTbp2M/bSdHNBhxzn4INjbpji480=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aBGwPe4JIdcRkCmwfIYcAQa1d0gJAvEA1rugafW8nRS3tSlAg3lx3JffxNAZ+fiGhAZz52Rq6rWmqb8b92977tQsLkEqXkbOIP/m3HsgDDjX1mrBOm7qFAPYY6kzjoMKdcMqrYJcxP88ci8Ch+7oi95JAeYmuKh38Oy/LIlvijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/KkupQZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/KkupQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771565163; x=1803101163;
  h=date:from:to:cc:subject:message-id;
  bh=5yll32r30jwkh9CmTbp2M/bSdHNBhxzn4INjbpji480=;
  b=b/KkupQZxhhAgTUxAnAFCC5OsNk2N2mIMlIOIbQdUnwINOGUujRAn2Eg
   MwulmOMQUqYjzIBCE8eErgioqizp0/0OGn6VaM5KGtyaw1UCs2LotomNR
   sxigkM05vK8Yzz6xX5VtLYJiUBQtuDCh4Wp1Q3HXRBuY2o3aTuKSOCe8u
   VXOE6Aunc+A8efhCtXWOIFzIRt1KuPGBBDAI4ZaP3CMcb6PI124Nl43As
   TU7ATqq8Zgh6wi7bdCjsLS/bMEoVr3b196sl3sWXidiclJSrawygIsgZi
   hHeT2Gg8yXdQuNGnLP2W9nQ3yo35GLNhbv9ih4N9vEN7ofs36fXt84Xx/
   g==;
X-CSE-ConnectionGUID: 9O9WO4UhRCaVNneyut1Jjw==
X-CSE-MsgGUID: RFioZoayQriaarkpWzOODQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72759512"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72759512"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 21:26:02 -0800
X-CSE-ConnectionGUID: 4zZ73TF/TwWJvDjcoqk0nQ==
X-CSE-MsgGUID: i2TDsMIVQ7+PB4nVe2SfhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="214603613"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Feb 2026 21:26:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtJ1a-000000013qL-2ID9;
	Fri, 20 Feb 2026 05:25:58 +0000
Date: Fri, 20 Feb 2026 13:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 40/42]
 drivers/net/ethernet/intel/idpf/idpf_txrx.h:436:1: error: static assertion
 failed due to requirement '__builtin_offsetof(struct idpf_q_vector,
 __cacheline_group_end__read_write) - (__builtin_offsetof(struct
 idpf_q_vector, __cacheline_group_begin__read_wri...
Message-ID: <202602201332.zyAOLczl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   999dcca32838c24ad84b897eff67f18554b21aa2
commit: 24ea46a484fdd8d6ac6a90cfb927c1fa3d07d312 [40/42] hrtimer: Use linked timerqueue
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260220/202602201332.zyAOLczl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201332.zyAOLczl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602201332.zyAOLczl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:28:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:436:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_q_vector, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_q_vector *)0)->__cacheline_group_begin__read_write))) == (56 + sizeof(struct napi_struct) + 2 * sizeof(struct dim))': offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) == (56 + sizeof(struct napi_struct) + 2 * sizeof(struct dim))
     436 | libeth_cacheline_set_assert(struct idpf_q_vector, 136,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     437 |                             56 + sizeof(struct napi_struct) +
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     438 |                             2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~
     439 |                             8);
         |                             ~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cacheline_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:17:16: note: expanded from macro 'libeth_cacheline_group_assert'
      17 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      18 |                       offsetofend(type, __cacheline_group_begin__##grp) ==    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      19 |                       (sz))
         |                       ~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:436:1: note: expression evaluates to '960 == 936'
     436 | libeth_cacheline_set_assert(struct idpf_q_vector, 136,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     437 |                             56 + sizeof(struct napi_struct) +
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     438 |                             2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~
     439 |                             8);
         |                             ~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cacheline_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:18:59: note: expanded from macro 'libeth_cacheline_group_assert'
      17 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      18 |                       offsetofend(type, __cacheline_group_begin__##grp) ==    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
      19 |                       (sz))
         |                       ~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +436 drivers/net/ethernet/intel/idpf/idpf_txrx.h

4930fbf419a72d Pavan Kumar Linga 2023-08-07  365  
4930fbf419a72d Pavan Kumar Linga 2023-08-07  366  /**
4930fbf419a72d Pavan Kumar Linga 2023-08-07  367   * struct idpf_q_vector
1c325aac10a82f Alan Brady        2023-08-07  368   * @vport: Vport back pointer
5a816aae2d463d Alexander Lobakin 2024-06-20  369   * @num_rxq: Number of RX queues
d4d5587182664b Pavan Kumar Linga 2023-08-07  370   * @num_txq: Number of TX queues
5a816aae2d463d Alexander Lobakin 2024-06-20  371   * @num_bufq: Number of buffer queues
e4891e4687c8dd Alexander Lobakin 2024-06-20  372   * @num_complq: number of completion queues
8ff6d62261a3d9 Alexander Lobakin 2025-09-11  373   * @num_xsksq: number of XSk send queues
5a816aae2d463d Alexander Lobakin 2024-06-20  374   * @rx: Array of RX queues to service
1c325aac10a82f Alan Brady        2023-08-07  375   * @tx: Array of TX queues to service
5a816aae2d463d Alexander Lobakin 2024-06-20  376   * @bufq: Array of buffer queues to service
e4891e4687c8dd Alexander Lobakin 2024-06-20  377   * @complq: array of completion queues
8ff6d62261a3d9 Alexander Lobakin 2025-09-11  378   * @xsksq: array of XSk send queues
5a816aae2d463d Alexander Lobakin 2024-06-20  379   * @intr_reg: See struct idpf_intr_reg
96da9d67da780c Alexander Lobakin 2025-09-11  380   * @csd: XSk wakeup CSD
5a816aae2d463d Alexander Lobakin 2024-06-20  381   * @total_events: Number of interrupts processed
9c4a27da0ecc40 Joshua Hay        2024-09-04  382   * @wb_on_itr: whether WB on ITR is enabled
96da9d67da780c Alexander Lobakin 2025-09-11  383   * @napi: napi handler
c2d548cad1508d Joshua Hay        2023-08-07  384   * @tx_dim: Data for TX net_dim algorithm
1c325aac10a82f Alan Brady        2023-08-07  385   * @tx_itr_value: TX interrupt throttling rate
1c325aac10a82f Alan Brady        2023-08-07  386   * @tx_intr_mode: Dynamic ITR or not
1c325aac10a82f Alan Brady        2023-08-07  387   * @tx_itr_idx: TX ITR index
3a8845af66edb3 Alan Brady        2023-08-07  388   * @rx_dim: Data for RX net_dim algorithm
95af467d9a4e3b Alan Brady        2023-08-07  389   * @rx_itr_value: RX interrupt throttling rate
95af467d9a4e3b Alan Brady        2023-08-07  390   * @rx_intr_mode: Dynamic ITR or not
95af467d9a4e3b Alan Brady        2023-08-07  391   * @rx_itr_idx: RX ITR index
5a816aae2d463d Alexander Lobakin 2024-06-20  392   * @v_idx: Vector index
4930fbf419a72d Pavan Kumar Linga 2023-08-07  393   */
4930fbf419a72d Pavan Kumar Linga 2023-08-07  394  struct idpf_q_vector {
5a816aae2d463d Alexander Lobakin 2024-06-20  395  	__cacheline_group_begin_aligned(read_mostly);
1c325aac10a82f Alan Brady        2023-08-07  396  	struct idpf_vport *vport;
1c325aac10a82f Alan Brady        2023-08-07  397  
5a816aae2d463d Alexander Lobakin 2024-06-20  398  	u16 num_rxq;
d4d5587182664b Pavan Kumar Linga 2023-08-07  399  	u16 num_txq;
5a816aae2d463d Alexander Lobakin 2024-06-20  400  	u16 num_bufq;
e4891e4687c8dd Alexander Lobakin 2024-06-20  401  	u16 num_complq;
8ff6d62261a3d9 Alexander Lobakin 2025-09-11  402  	u16 num_xsksq;
5a816aae2d463d Alexander Lobakin 2024-06-20  403  	struct idpf_rx_queue **rx;
e4891e4687c8dd Alexander Lobakin 2024-06-20  404  	struct idpf_tx_queue **tx;
5a816aae2d463d Alexander Lobakin 2024-06-20  405  	struct idpf_buf_queue **bufq;
e4891e4687c8dd Alexander Lobakin 2024-06-20  406  	struct idpf_compl_queue **complq;
8ff6d62261a3d9 Alexander Lobakin 2025-09-11  407  	struct idpf_tx_queue **xsksq;
e4891e4687c8dd Alexander Lobakin 2024-06-20  408  
5a816aae2d463d Alexander Lobakin 2024-06-20  409  	struct idpf_intr_reg intr_reg;
5a816aae2d463d Alexander Lobakin 2024-06-20  410  	__cacheline_group_end_aligned(read_mostly);
5a816aae2d463d Alexander Lobakin 2024-06-20  411  
5a816aae2d463d Alexander Lobakin 2024-06-20  412  	__cacheline_group_begin_aligned(read_write);
96da9d67da780c Alexander Lobakin 2025-09-11  413  	call_single_data_t csd;
96da9d67da780c Alexander Lobakin 2025-09-11  414  
5a816aae2d463d Alexander Lobakin 2024-06-20  415  	u16 total_events;
9c4a27da0ecc40 Joshua Hay        2024-09-04  416  	bool wb_on_itr;
5a816aae2d463d Alexander Lobakin 2024-06-20  417  
96da9d67da780c Alexander Lobakin 2025-09-11  418  	struct napi_struct napi;
96da9d67da780c Alexander Lobakin 2025-09-11  419  
c2d548cad1508d Joshua Hay        2023-08-07  420  	struct dim tx_dim;
1c325aac10a82f Alan Brady        2023-08-07  421  	u16 tx_itr_value;
1c325aac10a82f Alan Brady        2023-08-07  422  	bool tx_intr_mode;
1c325aac10a82f Alan Brady        2023-08-07  423  	u32 tx_itr_idx;
1c325aac10a82f Alan Brady        2023-08-07  424  
3a8845af66edb3 Alan Brady        2023-08-07  425  	struct dim rx_dim;
95af467d9a4e3b Alan Brady        2023-08-07  426  	u16 rx_itr_value;
95af467d9a4e3b Alan Brady        2023-08-07  427  	bool rx_intr_mode;
95af467d9a4e3b Alan Brady        2023-08-07  428  	u32 rx_itr_idx;
5a816aae2d463d Alexander Lobakin 2024-06-20  429  	__cacheline_group_end_aligned(read_write);
95af467d9a4e3b Alan Brady        2023-08-07  430  
5a816aae2d463d Alexander Lobakin 2024-06-20  431  	__cacheline_group_begin_aligned(cold);
5a816aae2d463d Alexander Lobakin 2024-06-20  432  	u16 v_idx;
bf9bf7042a38eb Alexander Lobakin 2024-06-20  433  
5a816aae2d463d Alexander Lobakin 2024-06-20  434  	__cacheline_group_end_aligned(cold);
4930fbf419a72d Pavan Kumar Linga 2023-08-07  435  };
8ff6d62261a3d9 Alexander Lobakin 2025-09-11 @436  libeth_cacheline_set_assert(struct idpf_q_vector, 136,
96da9d67da780c Alexander Lobakin 2025-09-11  437  			    56 + sizeof(struct napi_struct) +
49717ef01ce1b6 Joe Damato        2024-10-04  438  			    2 * sizeof(struct dim),
deab38f8f01186 Ahmed Zaki        2025-02-24  439  			    8);
0fe45467a1041e Pavan Kumar Linga 2023-08-07  440  

:::::: The code at line 436 was first introduced by commit
:::::: 8ff6d62261a3d9a522e4bc90e27a2f6b745a22c4 idpf: implement XSk xmit

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
