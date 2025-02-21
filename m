Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529A41FBCAF;
	Fri, 21 Feb 2025 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740122716; cv=none; b=RNAM3walZaBgi31Ncwkjtlan0PKKjn7xs1JqpoVdoRmGXlyieMxnXtGr7JWhFamTEiFdybqEMMKlvQpfOpuqKF88aqSG2T6qymdeWj8BrPcdnyD5Pzl8XXnDfqjh3anVoDa0/OApdAQmm+nDsvYr/VLVK7JHDy38YnLOqCXsd5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740122716; c=relaxed/simple;
	bh=hVIKf6k/41CyHKzBvJeG06LeegKlgrHZUwO/LcK86qE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aF8GUCj4qXIoiYmXTdNfuv7t+OLAvS82CdjVUwC5e+hOCgyd32yIIAH0DqMP518Fcx7bzJ/066DAj1/ddJzxBJXmTHo/5SL4dul8jgX3u7Q41oCVhV19cft7S+zG1DK3Pc3xNaLpyh2NuUwCn5dYcRP3xKYnoBKiQ468fF8SnYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUcd6k/u; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUcd6k/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740122715; x=1771658715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hVIKf6k/41CyHKzBvJeG06LeegKlgrHZUwO/LcK86qE=;
  b=nUcd6k/u2IZIEpp2DuCsSlOibI8SWuBkzsztOqPODYBCjnlE+553GP3i
   G+QQkQ2AyClFGo/6VdeCHmmw/GK8qqtsQAH0YsE2Yrxc4NJvrENFqnD66
   wN7roTKsukMksTffIDUXXkYp2hwOsL7mO4n9eOOeKDs8a4ZMpGtRWCD08
   tTiDDw2Lv9aaBA3VjnaqKeaW+YPeqsjlWxdBDuUuSE65JqO4T+el5YI8I
   iyNPhaAbrsXdHWXaEMTIkc38s7WMcdJ5wrPOYDXaRE+3pa0J1FOtXQyhy
   OGsMKf26+8T3Yeac+O1ivvhMmKXsiJxiVngJlY9xEyedABl/epCmg1D08
   g==;
X-CSE-ConnectionGUID: uPWtv6ocTaKWvctFVW6ugQ==
X-CSE-MsgGUID: pONQKY9FQT22pjsmZSkYBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41139184"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41139184"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 23:25:14 -0800
X-CSE-ConnectionGUID: lrmH/CX6RS6GPTayLz68HQ==
X-CSE-MsgGUID: L4rs13O4Qt+bmUpby2T0Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115013085"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Feb 2025 23:25:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlNPF-0005ES-2K;
	Fri, 21 Feb 2025 07:25:06 +0000
Date: Fri, 21 Feb 2025 15:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:libeth 11/14]
 drivers/net/ethernet/intel/idpf/idpf_txrx.h:581:1: error: static assertion
 failed due to requirement '__builtin_offsetof(struct idpf_rx_queue,
 __cacheline_group_end__read_write) - (__builtin_offsetof(struct
 idpf_rx_queue, __cacheline_group_begin__read_wri...
Message-ID: <202502211532.dPJelcCx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux libeth
head:   09d460b32d581ec79b06e4a1112fac88263844cf
commit: ad64ef5bd3f5573b788559ba8599613ef80b3794 [11/14] idpf: use generic functions to build xdp_buff and skb
config: riscv-randconfig-001-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211532.dPJelcCx-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211532.dPJelcCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211532.dPJelcCx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/idpf/idpf_main.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:22:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:581:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_rx_queue, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_rx_queue, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_rx_queue *)0)->__cacheline_group_begin__read_write))) <= (88 + sizeof(struct u64_stats_sync))': offsetof(struct idpf_rx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_rx_queue, __cacheline_group_begin__read_write) <= (88 + sizeof(struct u64_stats_sync))
     581 | libeth_cacheline_set_assert(struct idpf_rx_queue,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     582 |                             ALIGN(64, __alignof(struct xdp_rxq_info)) +
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     583 |                             sizeof(struct xdp_rxq_info),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     584 |                             88 + sizeof(struct u64_stats_sync),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     585 |                             32);
         |                             ~~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cacheline_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:24:16: note: expanded from macro 'libeth_cacheline_group_assert'
      24 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      25 |                       offsetofend(type, __cacheline_group_begin__##grp) <=    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      26 |                       (sz))
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
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:581:1: note: expression evaluates to '96 <= 92'
     581 | libeth_cacheline_set_assert(struct idpf_rx_queue,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     582 |                             ALIGN(64, __alignof(struct xdp_rxq_info)) +
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     583 |                             sizeof(struct xdp_rxq_info),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     584 |                             88 + sizeof(struct u64_stats_sync),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     585 |                             32);
         |                             ~~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cacheline_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:25:59: note: expanded from macro 'libeth_cacheline_group_assert'
      24 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      25 |                       offsetofend(type, __cacheline_group_begin__##grp) <=    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
      26 |                       (sz))
         |                       ~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_main.c:168:39: warning: shift count >= width of type [-Wshift-count-overflow]
     168 |         err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 1 error generated.
--
   In file included from drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:6:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:22:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:581:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_rx_queue, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_rx_queue, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_rx_queue *)0)->__cacheline_group_begin__read_write))) <= (88 + sizeof(struct u64_stats_sync))': offsetof(struct idpf_rx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_rx_queue, __cacheline_group_begin__read_write) <= (88 + sizeof(struct u64_stats_sync))
     581 | libeth_cacheline_set_assert(struct idpf_rx_queue,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     582 |                             ALIGN(64, __alignof(struct xdp_rxq_info)) +
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     583 |                             sizeof(struct xdp_rxq_info),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     584 |                             88 + sizeof(struct u64_stats_sync),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     585 |                             32);
         |                             ~~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cacheline_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:24:16: note: expanded from macro 'libeth_cacheline_group_assert'
      24 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      25 |                       offsetofend(type, __cacheline_group_begin__##grp) <=    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      26 |                       (sz))
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
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:581:1: note: expression evaluates to '96 <= 92'
     581 | libeth_cacheline_set_assert(struct idpf_rx_queue,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     582 |                             ALIGN(64, __alignof(struct xdp_rxq_info)) +
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     583 |                             sizeof(struct xdp_rxq_info),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     584 |                             88 + sizeof(struct u64_stats_sync),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     585 |                             32);
         |                             ~~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cacheline_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:25:59: note: expanded from macro 'libeth_cacheline_group_assert'
      24 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      25 |                       offsetofend(type, __cacheline_group_begin__##grp) <=    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
      26 |                       (sz))
         |                       ~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.
--
   In file included from drivers/net/ethernet/intel/idpf/idpf_txrx.c:6:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:22:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:581:1: error: static assertion failed due to requirement '__builtin_offsetof(struct idpf_rx_queue, __cacheline_group_end__read_write) - (__builtin_offsetof(struct idpf_rx_queue, __cacheline_group_begin__read_write) + sizeof ((((struct idpf_rx_queue *)0)->__cacheline_group_begin__read_write))) <= (88 + sizeof(struct u64_stats_sync))': offsetof(struct idpf_rx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_rx_queue, __cacheline_group_begin__read_write) <= (88 + sizeof(struct u64_stats_sync))
     581 | libeth_cacheline_set_assert(struct idpf_rx_queue,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     582 |                             ALIGN(64, __alignof(struct xdp_rxq_info)) +
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     583 |                             sizeof(struct xdp_rxq_info),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     584 |                             88 + sizeof(struct u64_stats_sync),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     585 |                             32);
         |                             ~~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cacheline_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:24:16: note: expanded from macro 'libeth_cacheline_group_assert'
      24 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      25 |                       offsetofend(type, __cacheline_group_begin__##grp) <=    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      26 |                       (sz))
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
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:581:1: note: expression evaluates to '96 <= 92'
     581 | libeth_cacheline_set_assert(struct idpf_rx_queue,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     582 |                             ALIGN(64, __alignof(struct xdp_rxq_info)) +
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     583 |                             sizeof(struct xdp_rxq_info),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     584 |                             88 + sizeof(struct u64_stats_sync),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     585 |                             32);
         |                             ~~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cacheline_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:25:59: note: expanded from macro 'libeth_cacheline_group_assert'
      24 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      25 |                       offsetofend(type, __cacheline_group_begin__##grp) <=    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
      26 |                       (sz))
         |                       ~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.c:2930:49: warning: bitwise operation between different enumeration types ('enum idpf_tx_desc_dtype_value' and 'enum idpf_tx_flex_ctx_desc_cmd_bits') [-Wenum-enum-conversion]
    2930 |                                 cpu_to_le16(IDPF_TX_DESC_DTYPE_FLEX_TSO_CTX |
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
    2931 |                                             IDPF_TX_FLEX_CTX_DESC_CMD_TSO);
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:90:21: note: expanded from macro 'cpu_to_le16'
      90 | #define cpu_to_le16 __cpu_to_le16
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   1 warning and 1 error generated.


vim +581 drivers/net/ethernet/intel/idpf/idpf_txrx.h

e4891e4687c8dd1 Alexander Lobakin 2024-06-20  482  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  483  /**
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  484   * struct idpf_rx_queue - software structure representing a receive queue
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  485   * @rx: universal receive descriptor array
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  486   * @single_buf: buffer descriptor array in singleq
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  487   * @desc_ring: virtual descriptor ring address
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  488   * @bufq_sets: Pointer to the array of buffer queues in splitq mode
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  489   * @napi: NAPI instance corresponding to this queue (splitq)
4319a083ccda18f Michal Kubiak     2023-10-04  490   * @xdp_prog: attached XDP program
74d1412ac8f3719 Alexander Lobakin 2024-06-20  491   * @rx_buf: See struct &libeth_fqe
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  492   * @pp: Page pool pointer in singleq mode
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  493   * @tail: Tail offset. Used for both queue models single and split.
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  494   * @flags: See enum idpf_queue_flags_t
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  495   * @idx: For RX queue, it is used to index to total RX queue across groups and
95af467d9a4e3be Alan Brady        2023-08-07  496   *	 used for skb reporting.
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  497   * @desc_count: Number of descriptors
35b9532337e2d4b Michal Kubiak     2023-10-03  498   * @num_xdp_txq: total number of XDP Tx queues
35b9532337e2d4b Michal Kubiak     2023-10-03  499   * @xdpqs: shortcut for XDP Tx queues array
5a816aae2d463d7 Alexander Lobakin 2024-06-20  500   * @rxdids: Supported RX descriptor ids
35b9532337e2d4b Michal Kubiak     2023-10-03  501   * @truesize: data buffer truesize in singleq
5a816aae2d463d7 Alexander Lobakin 2024-06-20  502   * @rx_ptype_lkup: LUT of Rx ptypes
35b9532337e2d4b Michal Kubiak     2023-10-03  503   * @xdp_rxq: XDP queue info
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  504   * @next_to_use: Next descriptor to use
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  505   * @next_to_clean: Next descriptor to clean
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  506   * @next_to_alloc: RX buffer to allocate at
ad64ef5bd3f5573 Alexander Lobakin 2023-12-06  507   * @xdp: XDP buffer with the current frame
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  508   * @stats_sync: See struct u64_stats_sync
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  509   * @q_stats: See union idpf_rx_queue_stats
1c325aac10a82f1 Alan Brady        2023-08-07  510   * @q_id: Queue id
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  511   * @size: Length of descriptor ring in bytes
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  512   * @dma: Physical address of ring
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  513   * @q_vector: Backreference to associated vector
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  514   * @rx_buffer_low_watermark: RX buffer low watermark
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  515   * @rx_hbuf_size: Header buffer size
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  516   * @rx_buf_size: Buffer size
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  517   * @rx_max_pkt_size: RX max packet size
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  518   */
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  519  struct idpf_rx_queue {
5a816aae2d463d7 Alexander Lobakin 2024-06-20  520  	__cacheline_group_begin_aligned(read_mostly);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  521  	union {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  522  		union virtchnl2_rx_desc *rx;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  523  		struct virtchnl2_singleq_rx_buf_desc *single_buf;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  524  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  525  		void *desc_ring;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  526  	};
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  527  	union {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  528  		struct {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  529  			struct idpf_bufq_set *bufq_sets;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  530  			struct napi_struct *napi;
4319a083ccda18f Michal Kubiak     2023-10-04  531  			struct bpf_prog __rcu *xdp_prog;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  532  		};
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  533  		struct {
74d1412ac8f3719 Alexander Lobakin 2024-06-20  534  			struct libeth_fqe *rx_buf;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  535  			struct page_pool *pp;
4319a083ccda18f Michal Kubiak     2023-10-04  536  			void __iomem *tail;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  537  		};
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  538  	};
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  539  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  540  	DECLARE_BITMAP(flags, __IDPF_Q_FLAGS_NBITS);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  541  	u16 idx;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  542  	u16 desc_count;
5a816aae2d463d7 Alexander Lobakin 2024-06-20  543  
35b9532337e2d4b Michal Kubiak     2023-10-03  544  	u32 num_xdp_txq;
35b9532337e2d4b Michal Kubiak     2023-10-03  545  	union {
35b9532337e2d4b Michal Kubiak     2023-10-03  546  		struct idpf_tx_queue **xdpqs;
35b9532337e2d4b Michal Kubiak     2023-10-03  547  		struct {
5a816aae2d463d7 Alexander Lobakin 2024-06-20  548  			u32 rxdids;
35b9532337e2d4b Michal Kubiak     2023-10-03  549  			u32 truesize;
35b9532337e2d4b Michal Kubiak     2023-10-03  550  		};
35b9532337e2d4b Michal Kubiak     2023-10-03  551  	};
1b1b26208515482 Alexander Lobakin 2024-06-20  552  	const struct libeth_rx_pt *rx_ptype_lkup;
35b9532337e2d4b Michal Kubiak     2023-10-03  553  
35b9532337e2d4b Michal Kubiak     2023-10-03  554  	struct xdp_rxq_info xdp_rxq;
5a816aae2d463d7 Alexander Lobakin 2024-06-20  555  	__cacheline_group_end_aligned(read_mostly);
5a816aae2d463d7 Alexander Lobakin 2024-06-20  556  
5a816aae2d463d7 Alexander Lobakin 2024-06-20  557  	__cacheline_group_begin_aligned(read_write);
ad64ef5bd3f5573 Alexander Lobakin 2023-12-06  558  	u32 next_to_use;
ad64ef5bd3f5573 Alexander Lobakin 2023-12-06  559  	u32 next_to_clean;
ad64ef5bd3f5573 Alexander Lobakin 2023-12-06  560  	u32 next_to_alloc;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  561  
ad64ef5bd3f5573 Alexander Lobakin 2023-12-06  562  	struct libeth_xdp_buff_stash xdp;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  563  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  564  	struct u64_stats_sync stats_sync;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  565  	struct idpf_rx_queue_stats q_stats;
5a816aae2d463d7 Alexander Lobakin 2024-06-20  566  	__cacheline_group_end_aligned(read_write);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  567  
5a816aae2d463d7 Alexander Lobakin 2024-06-20  568  	__cacheline_group_begin_aligned(cold);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  569  	u32 q_id;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  570  	u32 size;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  571  	dma_addr_t dma;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  572  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  573  	struct idpf_q_vector *q_vector;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  574  
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  575  	u16 rx_buffer_low_watermark;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  576  	u16 rx_hbuf_size;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  577  	u16 rx_buf_size;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  578  	u16 rx_max_pkt_size;
5a816aae2d463d7 Alexander Lobakin 2024-06-20  579  	__cacheline_group_end_aligned(cold);
5a816aae2d463d7 Alexander Lobakin 2024-06-20  580  };
35b9532337e2d4b Michal Kubiak     2023-10-03 @581  libeth_cacheline_set_assert(struct idpf_rx_queue,
35b9532337e2d4b Michal Kubiak     2023-10-03  582  			    ALIGN(64, __alignof(struct xdp_rxq_info)) +
35b9532337e2d4b Michal Kubiak     2023-10-03  583  			    sizeof(struct xdp_rxq_info),
ad64ef5bd3f5573 Alexander Lobakin 2023-12-06  584  			    88 + sizeof(struct u64_stats_sync),
5a816aae2d463d7 Alexander Lobakin 2024-06-20  585  			    32);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  586  

:::::: The code at line 581 was first introduced by commit
:::::: 35b9532337e2d4bea6d23bf4fd18239cefbf2c67 idpf: prepare structures to support xdp

:::::: TO: Michal Kubiak <michal.kubiak@intel.com>
:::::: CC: Alexander Lobakin <aleksander.lobakin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
