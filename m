Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AED14036E;
	Sat,  5 Oct 2024 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728121869; cv=none; b=dUbt+OUla693Xx8BtmZQM0hwaI17RxjdU2E7Ps1O29wPaPZN7vihKle39RbcYLuJXn/LsNmhCaH3+Sa1Y0yrItwpHX2wX52HGipGzF2zK+68jimp3H7dw6tLS/Qgsw9BsnwvVF5BUlhcEZ3M7b5rF6yCfU7VSEgjLduwVvBaTC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728121869; c=relaxed/simple;
	bh=7ccxXUDF8pnQG1efTiVY/xQwqLVgoUjnrfxZup8lDTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HH2emdj11Kdjtu8LCyV/L4T4/HyK34NE96vlZUainV2xfOQxqdQCj+H9yytOoP4wFYANiLTmd317t5lQzY57CvtiimLdpWI77VZlpL84yh6V3UNi3L7FCidq4po8CxaYIRrmGsQFTAdoBM4IqP08vMrHC6ZMm5YASudllSFMzcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P50sMQH2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P50sMQH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728121867; x=1759657867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7ccxXUDF8pnQG1efTiVY/xQwqLVgoUjnrfxZup8lDTA=;
  b=P50sMQH2iM8cP9M7XXMun4XgYiQ0M/V0jPjVTUwJrY/6i9J+d4r9I/oh
   85qXyRAzpvnhdPiMh5VyzyxRQaJqi+Jm3dXUdD/Upls5tS91/mOVSalIW
   bGyd9E7UqwhtyuAcf4ZCPSlAFikqnex0pw6zZRS0Qg3YZQrRQ/fFaKWBv
   PqAuIZ1jLadWCK/LLcI07k5TexFpJT8TQ9ekP71U/2VRa6H6kvzOiSX6J
   u0UQ81EWEEfsNSol1Ottf1hVKY6Z0er2s5wDBbAImcBV+c7MfAoe1sSgv
   S+Q3Snf37qiLkACkEGny/vlPbG5HEYQRDfjWivLj9TD6Q52AJJGiM27/1
   w==;
X-CSE-ConnectionGUID: KPkUc7THTGu37wFyBGefzg==
X-CSE-MsgGUID: 3Khch0aSScmveVe0dgATRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="44862879"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="44862879"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 02:51:06 -0700
X-CSE-ConnectionGUID: gXfYx072SKyuF+ULT1IycA==
X-CSE-MsgGUID: nL1w9jyrSS6aXFj/4+jdLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="79716068"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Oct 2024 02:51:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx1RG-0002pH-2m;
	Sat, 05 Oct 2024 09:51:02 +0000
Date: Sat, 5 Oct 2024 17:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next v4 5/9] net: napi: Add napi_config
Message-ID: <202410051705.OzprttUB-lkp@intel.com>
References: <20241001235302.57609-6-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001235302.57609-6-jdamato@fastly.com>

Hi Joe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/net-napi-Make-napi_defer_hard_irqs-per-NAPI/20241002-075725
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241001235302.57609-6-jdamato%40fastly.com
patch subject: [RFC net-next v4 5/9] net: napi: Add napi_config
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241005/202410051705.OzprttUB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051705.OzprttUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051705.OzprttUB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:7:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:22:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:440:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_q_vector, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_q_vector *)0)->__cacheline_group_begin__read_write))) == (440 + 2 * sizeof(struct dim))': offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) == (440 + 2 * sizeof(struct dim))
     440 | libeth_cacheline_set_assert(struct idpf_q_vector, 112,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     441 |                             440 + 2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     442 |                             8 + sizeof(cpumask_var_t));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:440:1: note: expression evaluates to '784 == 776'
     440 | libeth_cacheline_set_assert(struct idpf_q_vector, 112,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     441 |                             440 + 2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     442 |                             8 + sizeof(cpumask_var_t));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
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
--
   In file included from drivers/net/ethernet/intel/idpf/idpf_main.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:22:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:440:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_q_vector, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_q_vector *)0)->__cacheline_group_begin__read_write))) == (440 + 2 * sizeof(struct dim))': offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) == (440 + 2 * sizeof(struct dim))
     440 | libeth_cacheline_set_assert(struct idpf_q_vector, 112,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     441 |                             440 + 2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     442 |                             8 + sizeof(cpumask_var_t));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:440:1: note: expression evaluates to '784 == 776'
     440 | libeth_cacheline_set_assert(struct idpf_q_vector, 112,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     441 |                             440 + 2 * sizeof(struct dim),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     442 |                             8 + sizeof(cpumask_var_t));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/net/ethernet/intel/idpf/idpf_main.c:167:39: warning: shift count >= width of type [-Wshift-count-overflow]
     167 |         err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +440 drivers/net/ethernet/intel/idpf/idpf_txrx.h

4930fbf419a72d Pavan Kumar Linga 2023-08-07  375  
4930fbf419a72d Pavan Kumar Linga 2023-08-07  376  /**
4930fbf419a72d Pavan Kumar Linga 2023-08-07  377   * struct idpf_q_vector
1c325aac10a82f Alan Brady        2023-08-07  378   * @vport: Vport back pointer
5a816aae2d463d Alexander Lobakin 2024-06-20  379   * @num_rxq: Number of RX queues
d4d5587182664b Pavan Kumar Linga 2023-08-07  380   * @num_txq: Number of TX queues
5a816aae2d463d Alexander Lobakin 2024-06-20  381   * @num_bufq: Number of buffer queues
e4891e4687c8dd Alexander Lobakin 2024-06-20  382   * @num_complq: number of completion queues
5a816aae2d463d Alexander Lobakin 2024-06-20  383   * @rx: Array of RX queues to service
1c325aac10a82f Alan Brady        2023-08-07  384   * @tx: Array of TX queues to service
5a816aae2d463d Alexander Lobakin 2024-06-20  385   * @bufq: Array of buffer queues to service
e4891e4687c8dd Alexander Lobakin 2024-06-20  386   * @complq: array of completion queues
5a816aae2d463d Alexander Lobakin 2024-06-20  387   * @intr_reg: See struct idpf_intr_reg
5a816aae2d463d Alexander Lobakin 2024-06-20  388   * @napi: napi handler
5a816aae2d463d Alexander Lobakin 2024-06-20  389   * @total_events: Number of interrupts processed
9c4a27da0ecc40 Joshua Hay        2024-09-04  390   * @wb_on_itr: whether WB on ITR is enabled
c2d548cad1508d Joshua Hay        2023-08-07  391   * @tx_dim: Data for TX net_dim algorithm
1c325aac10a82f Alan Brady        2023-08-07  392   * @tx_itr_value: TX interrupt throttling rate
1c325aac10a82f Alan Brady        2023-08-07  393   * @tx_intr_mode: Dynamic ITR or not
1c325aac10a82f Alan Brady        2023-08-07  394   * @tx_itr_idx: TX ITR index
3a8845af66edb3 Alan Brady        2023-08-07  395   * @rx_dim: Data for RX net_dim algorithm
95af467d9a4e3b Alan Brady        2023-08-07  396   * @rx_itr_value: RX interrupt throttling rate
95af467d9a4e3b Alan Brady        2023-08-07  397   * @rx_intr_mode: Dynamic ITR or not
95af467d9a4e3b Alan Brady        2023-08-07  398   * @rx_itr_idx: RX ITR index
5a816aae2d463d Alexander Lobakin 2024-06-20  399   * @v_idx: Vector index
bf9bf7042a38eb Alexander Lobakin 2024-06-20  400   * @affinity_mask: CPU affinity mask
4930fbf419a72d Pavan Kumar Linga 2023-08-07  401   */
4930fbf419a72d Pavan Kumar Linga 2023-08-07  402  struct idpf_q_vector {
5a816aae2d463d Alexander Lobakin 2024-06-20  403  	__cacheline_group_begin_aligned(read_mostly);
1c325aac10a82f Alan Brady        2023-08-07  404  	struct idpf_vport *vport;
1c325aac10a82f Alan Brady        2023-08-07  405  
5a816aae2d463d Alexander Lobakin 2024-06-20  406  	u16 num_rxq;
d4d5587182664b Pavan Kumar Linga 2023-08-07  407  	u16 num_txq;
5a816aae2d463d Alexander Lobakin 2024-06-20  408  	u16 num_bufq;
e4891e4687c8dd Alexander Lobakin 2024-06-20  409  	u16 num_complq;
5a816aae2d463d Alexander Lobakin 2024-06-20  410  	struct idpf_rx_queue **rx;
e4891e4687c8dd Alexander Lobakin 2024-06-20  411  	struct idpf_tx_queue **tx;
5a816aae2d463d Alexander Lobakin 2024-06-20  412  	struct idpf_buf_queue **bufq;
e4891e4687c8dd Alexander Lobakin 2024-06-20  413  	struct idpf_compl_queue **complq;
e4891e4687c8dd Alexander Lobakin 2024-06-20  414  
5a816aae2d463d Alexander Lobakin 2024-06-20  415  	struct idpf_intr_reg intr_reg;
5a816aae2d463d Alexander Lobakin 2024-06-20  416  	__cacheline_group_end_aligned(read_mostly);
5a816aae2d463d Alexander Lobakin 2024-06-20  417  
5a816aae2d463d Alexander Lobakin 2024-06-20  418  	__cacheline_group_begin_aligned(read_write);
5a816aae2d463d Alexander Lobakin 2024-06-20  419  	struct napi_struct napi;
5a816aae2d463d Alexander Lobakin 2024-06-20  420  	u16 total_events;
9c4a27da0ecc40 Joshua Hay        2024-09-04  421  	bool wb_on_itr;
5a816aae2d463d Alexander Lobakin 2024-06-20  422  
c2d548cad1508d Joshua Hay        2023-08-07  423  	struct dim tx_dim;
1c325aac10a82f Alan Brady        2023-08-07  424  	u16 tx_itr_value;
1c325aac10a82f Alan Brady        2023-08-07  425  	bool tx_intr_mode;
1c325aac10a82f Alan Brady        2023-08-07  426  	u32 tx_itr_idx;
1c325aac10a82f Alan Brady        2023-08-07  427  
3a8845af66edb3 Alan Brady        2023-08-07  428  	struct dim rx_dim;
95af467d9a4e3b Alan Brady        2023-08-07  429  	u16 rx_itr_value;
95af467d9a4e3b Alan Brady        2023-08-07  430  	bool rx_intr_mode;
95af467d9a4e3b Alan Brady        2023-08-07  431  	u32 rx_itr_idx;
5a816aae2d463d Alexander Lobakin 2024-06-20  432  	__cacheline_group_end_aligned(read_write);
95af467d9a4e3b Alan Brady        2023-08-07  433  
5a816aae2d463d Alexander Lobakin 2024-06-20  434  	__cacheline_group_begin_aligned(cold);
5a816aae2d463d Alexander Lobakin 2024-06-20  435  	u16 v_idx;
bf9bf7042a38eb Alexander Lobakin 2024-06-20  436  
bf9bf7042a38eb Alexander Lobakin 2024-06-20  437  	cpumask_var_t affinity_mask;
5a816aae2d463d Alexander Lobakin 2024-06-20  438  	__cacheline_group_end_aligned(cold);
4930fbf419a72d Pavan Kumar Linga 2023-08-07  439  };
9c4a27da0ecc40 Joshua Hay        2024-09-04 @440  libeth_cacheline_set_assert(struct idpf_q_vector, 112,
cb5dc755af3703 Joe Damato        2024-10-01  441  			    440 + 2 * sizeof(struct dim),
5a816aae2d463d Alexander Lobakin 2024-06-20  442  			    8 + sizeof(cpumask_var_t));
0fe45467a1041e Pavan Kumar Linga 2023-08-07  443  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
