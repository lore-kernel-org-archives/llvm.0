Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02A219A2A3;
	Thu, 16 Apr 2026 04:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776313828; cv=none; b=RnuL6dNMIHNSopMBo39vluUzewnilWxOLkoB614OSXIT6D7HF0/NumSeb3XQO7LO4P+uSTOWqjJJDtUxd/YFSJ17ouvpyrpHVf9Yr6QSTeAld8Lc2wAm8hjV71w3ROjtvN8xV7mwrfROQmK35lwOXaMuLS/dbYdfeuG1McY7jOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776313828; c=relaxed/simple;
	bh=gVDQTZ+QmDKEo5HPebS5xKbZinZivn2oTdY/Ox5Xq2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=klc54IFgK1hJH9ZQP6rigK1mFyEZ9ckAwxYFkYrLrxYuMUhrun/rchbxK+WVr3iKRimUmThBqbXg1qmBwbDkyVgeqEyQEju19a/9n10PJkXt0v1/fzeFo8ZyxwS2m22KywQJglpG+4TwQJDSTN4EHDel1BfZy4nWI55IxmkCFcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hg5P4Clc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hg5P4Clc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776313825; x=1807849825;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gVDQTZ+QmDKEo5HPebS5xKbZinZivn2oTdY/Ox5Xq2M=;
  b=hg5P4ClcN+T7ZCNvITy5PUM0FnjcWcm25oF+lB/vH5ydgc9wDfXYWcHF
   CasLxRHf04aen0xISLqlNG/u4AhVAJ+DB+DzrVIs/K12XkxM8Nrim/uhC
   Q+fvlr+WrnyCruHuVXfhexCcc4fvTIcSFucvLKyknZ7jyUk2COPgffEGJ
   K3SRbct5VnOK/YEcDhuDzP7kv8+bEYj0hu9ymZ46TFeOdwFx/IpX60uws
   bTNfqP5i6x8PUsd7i4X9rb5KQQmnozIPItJNSS067pD1uzPUD4hbOU2Eg
   CaxugqbDJWng35+mChEN3PeKTrw1WAavIfojY7lAZG06jp9+iDcPui9fg
   A==;
X-CSE-ConnectionGUID: eNohXuJ6RjS+9pXaLEYPTg==
X-CSE-MsgGUID: PgoKOoMxTFqPi/gU4QABgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81175796"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="81175796"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 21:30:24 -0700
X-CSE-ConnectionGUID: 8ySpdSmzS7WLHl/7M4BRVQ==
X-CSE-MsgGUID: H9de/zuDRPSTR8RM06cyJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="234640916"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Apr 2026 21:30:22 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDEMu-000000001Hq-0hEs;
	Thu, 16 Apr 2026 04:30:20 +0000
Date: Thu, 16 Apr 2026 12:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:libeth 8/8]
 drivers/net/ethernet/intel/idpf/idpf_txrx.h:724:1: error: static assertion
 failed due to requirement '__builtin_offsetof(struct idpf_tx_queue,
 __cacheline_group_end__read_write) - (__builtin_offsetof(struct
 idpf_tx_queue, __cacheline_group_begin__read_wri...
Message-ID: <202604161224.45VyJGG4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/alobakin/linux libeth
head:   2f4cad2257c116e3f47b7547bdd3412637a16b32
commit: 2f4cad2257c116e3f47b7547bdd3412637a16b32 [8/8] idpf: add flow-based=
 XDP fallback for FWs without Tx FIFO support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260416=
/202604161224.45VyJGG4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c=
1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260416/202604161224.45VyJGG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161224.45VyJGG4-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
   In file included from drivers/net/ethernet/intel/idpf/idpf.h:28:
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:724:1: error: static asserti=
on failed due to requirement '__builtin_offsetof(struct idpf_tx_queue, __ca=
cheline_group_end__read_write) - (__builtin_offsetof(struct idpf_tx_queue, =
__cacheline_group_begin__read_write) + sizeof ((((struct idpf_tx_queue *)0)=
->__cacheline_group_begin__read_write))) <=3D (104 + __builtin_offsetof(str=
uct idpf_tx_queue, cached_tstamp_caps) - (__builtin_offsetof(struct idpf_tx=
_queue, timer) + sizeof ((((struct idpf_tx_queue *)0)->timer))) + __builtin=
_offsetof(struct idpf_tx_queue, q_stats) - (__builtin_offsetof(struct idpf_=
tx_queue, tstamp_task) + sizeof ((((struct idpf_tx_queue *)0)->tstamp_task)=
)))': offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - o=
ffsetofend(struct idpf_tx_queue, __cacheline_group_begin__read_write) <=3D =
(104 + __builtin_offsetof(struct idpf_tx_queue, cached_tstamp_caps) - (__bu=
iltin_offsetof(struct idpf_tx_queue, timer) + sizeof((((struct idpf_tx_queu=
e *)0)->timer))) + __builtin_offsetof(struct idpf_tx_queue, q_stats) - (__b=
uiltin_offsetof(struct idpf_tx_queue, tstamp_task) + sizeof((((struct idpf_=
tx_queue *)0)->tstamp_task))))
     724 | libeth_cacheline_set_assert(struct idpf_tx_queue, 64,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     725 |                             104 +
         |                             ~~~~~
     726 |                             offsetof(struct idpf_tx_queue, cache=
d_tstamp_caps) -
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
     727 |                             offsetofend(struct idpf_tx_queue, ti=
mer) +
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
     728 |                             offsetof(struct idpf_tx_queue, q_sta=
ts) -
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
     729 |                             offsetofend(struct idpf_tx_queue, ts=
tamp_task),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
     730 |                             32);
         |                             ~~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cache=
line_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);    =
              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:24:16: note: expanded from macro 'libeth_cach=
eline_group_assert'
      24 |         static_assert(offsetof(type, __cacheline_group_end__##gr=
p) -          \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
      25 |                       offsetofend(type, __cacheline_group_begin_=
_##grp) <=3D    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
      26 |                       (sz))
         |                       ~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_asser=
t'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_ass=
ert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:724:1: note: expression eval=
uates to '184 <=3D 112'
     724 | libeth_cacheline_set_assert(struct idpf_tx_queue, 64,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     725 |                             104 +
         |                             ~~~~~
     726 |                             offsetof(struct idpf_tx_queue, cache=
d_tstamp_caps) -
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
     727 |                             offsetofend(struct idpf_tx_queue, ti=
mer) +
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
     728 |                             offsetof(struct idpf_tx_queue, q_sta=
ts) -
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
     729 |                             offsetofend(struct idpf_tx_queue, ts=
tamp_task),
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
     730 |                             32);
         |                             ~~~
   include/net/libeth/cache.h:62:2: note: expanded from macro 'libeth_cache=
line_set_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);    =
              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:25:59: note: expanded from macro 'libeth_cach=
eline_group_assert'
      24 |         static_assert(offsetof(type, __cacheline_group_end__##gr=
p) -          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
      25 |                       offsetofend(type, __cacheline_group_begin_=
_##grp) <=3D    \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~^~~~~~~
      26 |                       (sz))
         |                       ~~~~~
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_asser=
t'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_ass=
ert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +724 drivers/net/ethernet/intel/idpf/idpf_txrx.h

1c325aac10a82f1 Alan Brady        2023-08-07  477 =20
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  478  /**
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  479   * struct idpf_rx_queue =
- software structure representing a receive queue
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  480   * @rx: universal receiv=
e descriptor array
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  481   * @single_buf: buffer d=
escriptor array in singleq
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  482   * @desc_ring: virtual d=
escriptor ring address
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  483   * @bufq_sets: Pointer t=
o the array of buffer queues in splitq mode
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  484   * @napi: NAPI instance =
corresponding to this queue (splitq)
705457e7211f22c Michal Kubiak     2025-08-26  485   * @xdp_prog: attached X=
DP program
74d1412ac8f3719 Alexander Lobakin 2024-06-20  486   * @rx_buf: See struct &=
libeth_fqe
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  487   * @pp: Page pool pointe=
r in singleq mode
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  488   * @tail: Tail offset. U=
sed for both queue models single and split.
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  489   * @flags: See enum idpf=
_queue_flags_t
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  490   * @idx: For RX queue, i=
t is used to index to total RX queue across groups and
95af467d9a4e3be Alan Brady        2023-08-07  491   *	 used for skb reporti=
ng.
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  492   * @desc_count: Number o=
f descriptors
ac8a861f632e68e Michal Kubiak     2025-08-26  493   * @num_xdp_txq: total n=
umber of XDP Tx queues
ac8a861f632e68e Michal Kubiak     2025-08-26  494   * @xdpsqs: shortcut for=
 XDP Tx queues array
5a816aae2d463d7 Alexander Lobakin 2024-06-20  495   * @rxdids: Supported RX=
 descriptor ids
ac8a861f632e68e Michal Kubiak     2025-08-26  496   * @truesize: data buffe=
r truesize in singleq
5a816aae2d463d7 Alexander Lobakin 2024-06-20  497   * @rx_ptype_lkup: LUT o=
f Rx ptypes
ac8a861f632e68e Michal Kubiak     2025-08-26  498   * @xdp_rxq: XDP queue i=
nfo
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  499   * @next_to_use: Next de=
scriptor to use
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  500   * @next_to_clean: Next =
descriptor to clean
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  501   * @next_to_alloc: RX bu=
ffer to allocate at
a4d755d1040a490 Alexander Lobakin 2025-08-26  502   * @xdp: XDP buffer with=
 the current frame
9705d6552f5871a Alexander Lobakin 2025-09-11  503   * @xsk: current XDP buf=
fer in XSk mode
9705d6552f5871a Alexander Lobakin 2025-09-11  504   * @pool: XSk pool if in=
stalled
494565a74502671 Milena Olech      2025-04-16  505   * @cached_phc_time: Cac=
hed PHC time for the Rx queue
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  506   * @stats_sync: See stru=
ct u64_stats_sync
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  507   * @q_stats: See union i=
dpf_rx_queue_stats
1c325aac10a82f1 Alan Brady        2023-08-07  508   * @q_id: Queue id
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  509   * @size: Length of desc=
riptor ring in bytes
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  510   * @dma: Physical addres=
s of ring
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  511   * @q_vector: Backrefere=
nce to associated vector
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  512   * @rx_buffer_low_waterm=
ark: RX buffer low watermark
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  513   * @rx_hbuf_size: Header=
 buffer size
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  514   * @rx_buf_size: Buffer =
size
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  515   * @rx_max_pkt_size: RX =
max packet size
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  516   */
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  517  struct idpf_rx_queue {
5a816aae2d463d7 Alexander Lobakin 2024-06-20  518  	__cacheline_group_begin=
_aligned(read_mostly);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  519  	union {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  520  		union virtchnl2_rx_des=
c *rx;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  521  		struct virtchnl2_singl=
eq_rx_buf_desc *single_buf;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  522 =20
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  523  		void *desc_ring;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  524  	};
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  525  	union {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  526  		struct {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  527  			struct idpf_bufq_set =
*bufq_sets;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  528  			struct napi_struct *n=
api;
705457e7211f22c Michal Kubiak     2025-08-26  529  			struct bpf_prog __rcu=
 *xdp_prog;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  530  		};
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  531  		struct {
74d1412ac8f3719 Alexander Lobakin 2024-06-20  532  			struct libeth_fqe *rx=
_buf;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  533  			struct page_pool *pp;
705457e7211f22c Michal Kubiak     2025-08-26  534  			void __iomem *tail;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  535  		};
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  536  	};
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  537 =20
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  538  	DECLARE_BITMAP(flags, _=
_IDPF_Q_FLAGS_NBITS);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  539  	u16 idx;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  540  	u16 desc_count;
5a816aae2d463d7 Alexander Lobakin 2024-06-20  541 =20
ac8a861f632e68e Michal Kubiak     2025-08-26  542  	u32 num_xdp_txq;
ac8a861f632e68e Michal Kubiak     2025-08-26  543  	union {
ac8a861f632e68e Michal Kubiak     2025-08-26  544  		struct idpf_tx_queue *=
*xdpsqs;
ac8a861f632e68e Michal Kubiak     2025-08-26  545  		struct {
5a816aae2d463d7 Alexander Lobakin 2024-06-20  546  			u32 rxdids;
ac8a861f632e68e Michal Kubiak     2025-08-26  547  			u32 truesize;
ac8a861f632e68e Michal Kubiak     2025-08-26  548  		};
ac8a861f632e68e Michal Kubiak     2025-08-26  549  	};
1b1b26208515482 Alexander Lobakin 2024-06-20  550  	const struct libeth_rx_=
pt *rx_ptype_lkup;
ac8a861f632e68e Michal Kubiak     2025-08-26  551 =20
ac8a861f632e68e Michal Kubiak     2025-08-26  552  	struct xdp_rxq_info xdp=
_rxq;
5a816aae2d463d7 Alexander Lobakin 2024-06-20  553  	__cacheline_group_end_a=
ligned(read_mostly);
5a816aae2d463d7 Alexander Lobakin 2024-06-20  554 =20
5a816aae2d463d7 Alexander Lobakin 2024-06-20  555  	__cacheline_group_begin=
_aligned(read_write);
a4d755d1040a490 Alexander Lobakin 2025-08-26  556  	u32 next_to_use;
a4d755d1040a490 Alexander Lobakin 2025-08-26  557  	u32 next_to_clean;
a4d755d1040a490 Alexander Lobakin 2025-08-26  558  	u32 next_to_alloc;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  559 =20
9705d6552f5871a Alexander Lobakin 2025-09-11  560  	union {
a4d755d1040a490 Alexander Lobakin 2025-08-26  561  		struct libeth_xdp_buff=
_stash xdp;
9705d6552f5871a Alexander Lobakin 2025-09-11  562  		struct {
9705d6552f5871a Alexander Lobakin 2025-09-11  563  			struct libeth_xdp_buf=
f *xsk;
9705d6552f5871a Alexander Lobakin 2025-09-11  564  			struct xsk_buff_pool =
*pool;
9705d6552f5871a Alexander Lobakin 2025-09-11  565  		};
9705d6552f5871a Alexander Lobakin 2025-09-11  566  	};
494565a74502671 Milena Olech      2025-04-16  567  	u64 cached_phc_time;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  568 =20
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  569  	struct u64_stats_sync s=
tats_sync;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  570  	struct idpf_rx_queue_st=
ats q_stats;
5a816aae2d463d7 Alexander Lobakin 2024-06-20  571  	__cacheline_group_end_a=
ligned(read_write);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  572 =20
5a816aae2d463d7 Alexander Lobakin 2024-06-20  573  	__cacheline_group_begin=
_aligned(cold);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  574  	u32 q_id;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  575  	u32 size;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  576  	dma_addr_t dma;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  577 =20
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  578  	struct idpf_q_vector *q=
_vector;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  579 =20
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  580  	u16 rx_buffer_low_water=
mark;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  581  	u16 rx_hbuf_size;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  582  	u16 rx_buf_size;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  583  	u16 rx_max_pkt_size;
5a816aae2d463d7 Alexander Lobakin 2024-06-20  584  	__cacheline_group_end_a=
ligned(cold);
5a816aae2d463d7 Alexander Lobakin 2024-06-20  585  };
ac8a861f632e68e Michal Kubiak     2025-08-26  586  libeth_cacheline_set_ass=
ert(struct idpf_rx_queue,
ac8a861f632e68e Michal Kubiak     2025-08-26  587  			    ALIGN(64, __align=
of(struct xdp_rxq_info)) +
ac8a861f632e68e Michal Kubiak     2025-08-26  588  			    sizeof(struct xdp=
_rxq_info),
a4d755d1040a490 Alexander Lobakin 2025-08-26  589  			    96 + offsetof(str=
uct idpf_rx_queue, q_stats) -
a4d755d1040a490 Alexander Lobakin 2025-08-26  590  			    offsetofend(struc=
t idpf_rx_queue, cached_phc_time),
5a816aae2d463d7 Alexander Lobakin 2024-06-20  591  			    32);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  592 =20
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  593  /**
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  594   * struct idpf_tx_queue =
- software structure representing a transmit queue
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  595   * @base_tx: base Tx des=
criptor array
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  596   * @base_ctx: base Tx co=
ntext descriptor array
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  597   * @flex_tx: flex Tx des=
criptor array
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  598   * @flex_ctx: flex Tx co=
ntext descriptor array
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  599   * @desc_ring: virtual d=
escriptor ring address
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  600   * @tx_buf: See struct i=
dpf_tx_buf
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  601   * @txq_grp: See struct =
idpf_txq_group
ac8a861f632e68e Michal Kubiak     2025-08-26  602   * @complq: correspondin=
g completion queue in XDP mode
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  603   * @dev: Device back poi=
nter for DMA mapping
8ff6d62261a3d9a Alexander Lobakin 2025-09-11  604   * @pool: corresponding =
XSk pool if installed
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  605   * @tail: Tail offset. U=
sed for both queue models single and split
1c325aac10a82f1 Alan Brady        2023-08-07  606   * @flags: See enum idpf=
_queue_flags_t
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  607   * @idx: For TX queue, i=
t is used as index to map between TX queue group and
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  608   *	 hot path TX pointers=
 stored in vport. Used in both singleq/splitq.
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  609   * @desc_count: Number o=
f descriptors
1c325aac10a82f1 Alan Brady        2023-08-07  610   * @tx_min_pkt_len: Min =
supported packet length
ac8a861f632e68e Michal Kubiak     2025-08-26  611   * @thresh: XDP queue cl=
eaning threshold
5a816aae2d463d7 Alexander Lobakin 2024-06-20  612   * @netdev: &net_device =
corresponding to this queue
5a816aae2d463d7 Alexander Lobakin 2024-06-20  613   * @next_to_use: Next de=
scriptor to use
5a816aae2d463d7 Alexander Lobakin 2024-06-20  614   * @next_to_clean: Next =
descriptor to clean
f2d18e16479cac7 Joshua Hay        2025-07-25  615   * @last_re: last descri=
ptor index that RE bit was set
f2d18e16479cac7 Joshua Hay        2025-07-25  616   * @tx_max_bufs: Max buf=
fers that can be transmitted with scatter-gather
5a816aae2d463d7 Alexander Lobakin 2024-06-20  617   * @cleaned_bytes: Split=
q only, TXQ only: When a TX completion is received on
5a816aae2d463d7 Alexander Lobakin 2024-06-20  618   *		   the TX completion=
 queue, it can be for any TXQ associated
5a816aae2d463d7 Alexander Lobakin 2024-06-20  619   *		   with that complet=
ion queue. This means we can clean up to
5a816aae2d463d7 Alexander Lobakin 2024-06-20  620   *		   N TXQs during a s=
ingle call to clean the completion queue.
5a816aae2d463d7 Alexander Lobakin 2024-06-20  621   *		   cleaned_bytes|pkt=
s tracks the clean stats per TXQ during
5a816aae2d463d7 Alexander Lobakin 2024-06-20  622   *		   that single call =
to clean the completion queue. By doing so,
5a816aae2d463d7 Alexander Lobakin 2024-06-20  623   *		   we can update BQL=
 with aggregate cleaned stats for each TXQ
5a816aae2d463d7 Alexander Lobakin 2024-06-20  624   *		   only once at the =
end of the cleaning routine.
5a816aae2d463d7 Alexander Lobakin 2024-06-20  625   * @clean_budget: single=
q only, queue cleaning budget
5a816aae2d463d7 Alexander Lobakin 2024-06-20  626   * @cleaned_pkts: Number=
 of packets cleaned for the above said case
cb83b559bea39f2 Joshua Hay        2025-07-25  627   * @refillq: Pointer to =
refill queue
2f4cad2257c116e Alexander Lobakin 2026-04-15  628   * @cached_tstamp_caps: =
Tx timestamp capabilities negotiated with the CP
ac8a861f632e68e Michal Kubiak     2025-08-26  629   * @pending: number of p=
ending descriptors to send in QB
ac8a861f632e68e Michal Kubiak     2025-08-26  630   * @xdp_tx: number of pe=
nding &xdp_buff or &xdp_frame buffers
ac8a861f632e68e Michal Kubiak     2025-08-26  631   * @timer: timer for XDP=
 Tx queue cleanup
ac8a861f632e68e Michal Kubiak     2025-08-26  632   * @xdp_lock: lock for X=
DP Tx queues sharing
2f4cad2257c116e Alexander Lobakin 2026-04-15  633   * @pending_mask: mask o=
f buffers waiting for completion in the FB XDP mode
1a49cf814fe1edf Milena Olech      2025-04-16  634   * @tstamp_task: Work th=
at handles Tx timestamp read
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  635   * @stats_sync: See stru=
ct u64_stats_sync
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  636   * @q_stats: See union i=
dpf_tx_queue_stats
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  637   * @q_id: Queue id
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  638   * @size: Length of desc=
riptor ring in bytes
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  639   * @dma: Physical addres=
s of ring
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  640   * @q_vector: Backrefere=
nce to associated vector
5f417d551324d28 Joshua Hay        2025-07-25  641   * @buf_pool_size: Total=
 number of idpf_tx_buf
6b8e30b640653bb Michal Kubiak     2025-09-11  642   * @rel_q_id: relative v=
irtchnl queue index
1c325aac10a82f1 Alan Brady        2023-08-07  643   */
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  644  struct idpf_tx_queue {
5a816aae2d463d7 Alexander Lobakin 2024-06-20  645  	__cacheline_group_begin=
_aligned(read_mostly);
95af467d9a4e3be Alan Brady        2023-08-07  646  	union {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  647  		struct idpf_base_tx_de=
sc *base_tx;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  648  		struct idpf_base_tx_ct=
x_desc *base_ctx;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  649  		union idpf_tx_flex_des=
c *flex_tx;
1a49cf814fe1edf Milena Olech      2025-04-16  650  		union idpf_flex_tx_ctx=
_desc *flex_ctx;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  651 =20
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  652  		void *desc_ring;
95af467d9a4e3be Alan Brady        2023-08-07  653  	};
d9028db618a63e4 Alexander Lobakin 2024-09-04  654  	struct libeth_sqe *tx_b=
uf;
ac8a861f632e68e Michal Kubiak     2025-08-26  655  	union {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  656  		struct idpf_txq_group =
*txq_grp;
ac8a861f632e68e Michal Kubiak     2025-08-26  657  		struct idpf_compl_queu=
e *complq;
ac8a861f632e68e Michal Kubiak     2025-08-26  658  	};
8ff6d62261a3d9a Alexander Lobakin 2025-09-11  659  	union {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  660  		struct device *dev;
8ff6d62261a3d9a Alexander Lobakin 2025-09-11  661  		struct xsk_buff_pool *=
pool;
8ff6d62261a3d9a Alexander Lobakin 2025-09-11  662  	};
1c325aac10a82f1 Alan Brady        2023-08-07  663  	void __iomem *tail;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  664 =20
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  665  	DECLARE_BITMAP(flags, _=
_IDPF_Q_FLAGS_NBITS);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  666  	u16 idx;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  667  	u16 desc_count;
5a816aae2d463d7 Alexander Lobakin 2024-06-20  668 =20
ac8a861f632e68e Michal Kubiak     2025-08-26  669  	union {
5a816aae2d463d7 Alexander Lobakin 2024-06-20  670  		u16 tx_min_pkt_len;
ac8a861f632e68e Michal Kubiak     2025-08-26  671  		u32 thresh;
ac8a861f632e68e Michal Kubiak     2025-08-26  672  	};
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  673 =20
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  674  	struct net_device *netd=
ev;
5a816aae2d463d7 Alexander Lobakin 2024-06-20  675  	__cacheline_group_end_a=
ligned(read_mostly);
5a816aae2d463d7 Alexander Lobakin 2024-06-20  676 =20
5a816aae2d463d7 Alexander Lobakin 2024-06-20  677  	__cacheline_group_begin=
_aligned(read_write);
cba102cd719029a Alexander Lobakin 2025-08-26  678  	u32 next_to_use;
cba102cd719029a Alexander Lobakin 2025-08-26  679  	u32 next_to_clean;
ac8a861f632e68e Michal Kubiak     2025-08-26  680 =20
ac8a861f632e68e Michal Kubiak     2025-08-26  681  	union {
ac8a861f632e68e Michal Kubiak     2025-08-26  682  		struct {
f2d18e16479cac7 Joshua Hay        2025-07-25  683  			u16 last_re;
f2d18e16479cac7 Joshua Hay        2025-07-25  684  			u16 tx_max_bufs;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  685 =20
95af467d9a4e3be Alan Brady        2023-08-07  686  			union {
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  687  				u32 cleaned_bytes;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  688  				u32 clean_budget;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  689  			};
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  690  			u16 cleaned_pkts;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  691 =20
cb83b559bea39f2 Joshua Hay        2025-07-25  692  			struct idpf_sw_queue =
*refillq;
2f4cad2257c116e Alexander Lobakin 2026-04-15  693 =20
2f4cad2257c116e Alexander Lobakin 2026-04-15  694  			struct idpf_ptp_vport=
_tx_tstamp_caps *cached_tstamp_caps;
ac8a861f632e68e Michal Kubiak     2025-08-26  695  		};
ac8a861f632e68e Michal Kubiak     2025-08-26  696  		struct {
ac8a861f632e68e Michal Kubiak     2025-08-26  697  			u32 pending;
ac8a861f632e68e Michal Kubiak     2025-08-26  698  			u32 xdp_tx;
ac8a861f632e68e Michal Kubiak     2025-08-26  699 =20
ac8a861f632e68e Michal Kubiak     2025-08-26  700  			struct libeth_xdpsq_t=
imer *timer;
ac8a861f632e68e Michal Kubiak     2025-08-26  701  			struct libeth_xdpsq_l=
ock xdp_lock;
2f4cad2257c116e Alexander Lobakin 2026-04-15  702 =20
2f4cad2257c116e Alexander Lobakin 2026-04-15  703  			unsigned long *pendin=
g_mask;
ac8a861f632e68e Michal Kubiak     2025-08-26  704  		};
ac8a861f632e68e Michal Kubiak     2025-08-26  705  	};
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  706 =20
1a49cf814fe1edf Milena Olech      2025-04-16  707  	struct work_struct *tst=
amp_task;
1a49cf814fe1edf Milena Olech      2025-04-16  708 =20
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  709  	struct u64_stats_sync s=
tats_sync;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  710  	struct idpf_tx_queue_st=
ats q_stats;
5a816aae2d463d7 Alexander Lobakin 2024-06-20  711  	__cacheline_group_end_a=
ligned(read_write);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  712 =20
5a816aae2d463d7 Alexander Lobakin 2024-06-20  713  	__cacheline_group_begin=
_aligned(cold);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  714  	u32 q_id;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  715  	u32 size;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  716  	dma_addr_t dma;
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  717 =20
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  718  	struct idpf_q_vector *q=
_vector;
6b8e30b640653bb Michal Kubiak     2025-09-11  719 =20
5f417d551324d28 Joshua Hay        2025-07-25  720  	u32 buf_pool_size;
6b8e30b640653bb Michal Kubiak     2025-09-11  721  	u32 rel_q_id;
5a816aae2d463d7 Alexander Lobakin 2024-06-20  722  	__cacheline_group_end_a=
ligned(cold);
5a816aae2d463d7 Alexander Lobakin 2024-06-20  723  };
5a816aae2d463d7 Alexander Lobakin 2024-06-20 @724  libeth_cacheline_set_ass=
ert(struct idpf_tx_queue, 64,
ac8a861f632e68e Michal Kubiak     2025-08-26  725  			    104 +
ac8a861f632e68e Michal Kubiak     2025-08-26  726  			    offsetof(struct i=
dpf_tx_queue, cached_tstamp_caps) -
ac8a861f632e68e Michal Kubiak     2025-08-26  727  			    offsetofend(struc=
t idpf_tx_queue, timer) +
ac8a861f632e68e Michal Kubiak     2025-08-26  728  			    offsetof(struct i=
dpf_tx_queue, q_stats) -
ac8a861f632e68e Michal Kubiak     2025-08-26  729  			    offsetofend(struc=
t idpf_tx_queue, tstamp_task),
5f417d551324d28 Joshua Hay        2025-07-25  730  			    32);
e4891e4687c8dd1 Alexander Lobakin 2024-06-20  731 =20

:::::: The code at line 724 was first introduced by commit
:::::: 5a816aae2d463d74882e21672ac5366573b0c511 idpf: strictly assert cache=
lines of queue and queue vector structures

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
