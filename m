Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5344D1BC39;
	Mon,  9 Sep 2024 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725898354; cv=none; b=CJX38+V4W7DoToTAsLbPRmbj0YLMlEi3kf65j6EiOSVuS3VhNZcPRjx4ih+or9LblPFsMjembr+pOhnr4h8/aFyV+Lsu4zeDtOTogkNBwtGq5ItUuSwEMAR1o1Z5vKzitxvyMeZYguAcB7a6cyzKCXE0/J9nz1Zh85w8XniBw+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725898354; c=relaxed/simple;
	bh=w+mLJLGVqYXWVkRzmXhaGBtOFvLmxxz91gh9OcGTQdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kREPDfHLIjAnkZ0FB2qqchHAYmmrXHkQTm97r5a+7Natz+53c9YqJnusDei6cVkWVty3TAH3xvDiXYui7OZDVQR2Iuz1gKgR2foJyI1GX7fG/wFdlz5nOsJo5PP0BTIgCq6JfH8MkdX7UGU3WIOtBZHuEZI2sQKv6gLMNFMIuhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfruG1GM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfruG1GM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725898352; x=1757434352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+mLJLGVqYXWVkRzmXhaGBtOFvLmxxz91gh9OcGTQdY=;
  b=kfruG1GMXpDbm70ougpSpQdgOot1xsrrKY7whRVr6HQPV0MVdc5j9xsU
   zDllAGTNRN2aU0Z+2oCt6VyX96SkG5Km5KAeBP8IZNTlx0quQr9fpJSyh
   N1oR3x3W5hI/yKqPpdO1MeMdUA1nOozkpqrxz3mE/mqPNGTyRnkbbezJK
   eo1wk6h3+Yi5XCrp9Rng6yqL6XQAFxDDOQEOhf22EpCQGwK/7EXzvrgbj
   auSEEiNBejVsoDX05wV7lXBW+/LN3FrZNUoqdnY25er08Vap/LS8j6AZ1
   mDQlw3eWv+tVbmbkEIpHMDmPaE2/DF7tB+kyF1XIgmrH9RDiV0N/SxPjI
   g==;
X-CSE-ConnectionGUID: z/gSJBpCQnOTIslyaGEmIg==
X-CSE-MsgGUID: xorQstIcTmC8GQBhkZJ5vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24798690"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24798690"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 09:12:32 -0700
X-CSE-ConnectionGUID: PDJewC3TT4OOo1dra7ycEw==
X-CSE-MsgGUID: vqoWjEWXQum4/qWO+htB6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66429081"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Sep 2024 09:12:30 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snh08-000EwA-1F;
	Mon, 09 Sep 2024 16:12:28 +0000
Date: Tue, 10 Sep 2024 00:11:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 190/258]
 drivers/net/ethernet/sfc/ef100_rx.c:175:3: warning: shift count >= width of
 type
Message-ID: <202409100019.2rv1U5EA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: a2a5fdffbb42082064006597ddabecccdb746d39 [190/258] vmalloc: is_vmalloc_addr_inlined()
config: i386-randconfig-001-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100019.2rv1U5EA-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100019.2rv1U5EA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100019.2rv1U5EA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/sfc/ef100_rx.c:11:
   In file included from drivers/net/ethernet/sfc/net_driver.h:13:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   include/linux/mm.h:1200:17: error: use of undeclared identifier 'VMALLOC_START'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                        ^~~~~~~~~~~~~
         |                        KMALLOC_DMA
   include/linux/slab.h:408:2: note: 'KMALLOC_DMA' declared here
     408 |         KMALLOC_DMA = KMALLOC_NORMAL,
         |         ^
   In file included from drivers/net/ethernet/sfc/ef100_rx.c:11:
   In file included from drivers/net/ethernet/sfc/net_driver.h:13:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   include/linux/mm.h:1200:41: error: use of undeclared identifier 'VMALLOC_END'; did you mean 'KMALLOC_DMA'?
    1200 |         return addr >= VMALLOC_START && addr < VMALLOC_END;
         |                                                ^~~~~~~~~~~
         |                                                KMALLOC_DMA
   include/linux/slab.h:408:2: note: 'KMALLOC_DMA' declared here
     408 |         KMALLOC_DMA = KMALLOC_NORMAL,
         |         ^
   drivers/net/ethernet/sfc/ef100_rx.c:175:3: warning: shift count is negative [-Wshift-count-negative]
     175 |                 EFX_QWORD_FIELD(*p_event, ESF_GZ_EV_RXPKTS_NUM_PKT);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:231:26: note: expanded from macro 'EFX_QWORD_FIELD'
     231 | #define EFX_QWORD_FIELD         EFX_QWORD_FIELD32
         |                                 ^
   drivers/net/ethernet/sfc/bitfield.h:183:2: note: expanded from macro 'EFX_QWORD_FIELD32'
     183 |         EFX_EXTRACT_QWORD32(qword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     184 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:163:4: note: expanded from macro 'EFX_EXTRACT_QWORD32'
     163 |           EFX_EXTRACT32((qword).u32[1], 32, 63, low, high)) &           \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:143:2: note: expanded from macro 'EFX_EXTRACT32'
     143 |         EFX_EXTRACT_NATIVE(le32_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:128:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     128 |          (native_element) >> ((low) - (min)) :                          \
         |                           ^  ~~~~~~~~~~~~~~~
>> drivers/net/ethernet/sfc/ef100_rx.c:175:3: warning: shift count >= width of type [-Wshift-count-overflow]
     175 |                 EFX_QWORD_FIELD(*p_event, ESF_GZ_EV_RXPKTS_NUM_PKT);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:231:26: note: expanded from macro 'EFX_QWORD_FIELD'
     231 | #define EFX_QWORD_FIELD         EFX_QWORD_FIELD32
         |                                 ^
   drivers/net/ethernet/sfc/bitfield.h:183:2: note: expanded from macro 'EFX_QWORD_FIELD32'
     183 |         EFX_EXTRACT_QWORD32(qword, EFX_LOW_BIT(field),          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     184 |                             EFX_HIGH_BIT(field))
         |                             ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:163:4: note: expanded from macro 'EFX_EXTRACT_QWORD32'
     163 |           EFX_EXTRACT32((qword).u32[1], 32, 63, low, high)) &           \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:143:2: note: expanded from macro 'EFX_EXTRACT32'
     143 |         EFX_EXTRACT_NATIVE(le32_to_cpu(element), min, max, low, high)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:129:20: note: expanded from macro 'EFX_EXTRACT_NATIVE'
     129 |          (native_element) << ((min) - (low)))
         |                           ^  ~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/ef100_rx.c:204:3: warning: shift count is negative [-Wshift-count-negative]
     204 |                 EFX_POPULATE_QWORD_1(*rxd, ESF_GZ_RX_BUF_ADDR, rx_buf->dma_addr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:440:2: note: expanded from macro 'EFX_POPULATE_QWORD_1'
     440 |         EFX_POPULATE_QWORD_2(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:438:2: note: expanded from macro 'EFX_POPULATE_QWORD_2'
     438 |         EFX_POPULATE_QWORD_3(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:436:2: note: expanded from macro 'EFX_POPULATE_QWORD_3'
     436 |         EFX_POPULATE_QWORD_4(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 21 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:258:3: note: expanded from macro 'EFX_INSERT_NATIVE'
     258 |          EFX_INSERT_NATIVE64(min, max, low, high, value) :      \
         |          ^
   drivers/net/ethernet/sfc/bitfield.h:247:21: note: expanded from macro 'EFX_INSERT_NATIVE64'
     247 |           (((u64) (value)) << (low - min)) :            \
         |                            ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/net/ethernet/sfc/ef100_rx.c:204:3: warning: shift count is negative [-Wshift-count-negative]
     204 |                 EFX_POPULATE_QWORD_1(*rxd, ESF_GZ_RX_BUF_ADDR, rx_buf->dma_addr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:440:2: note: expanded from macro 'EFX_POPULATE_QWORD_1'
     440 |         EFX_POPULATE_QWORD_2(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:438:2: note: expanded from macro 'EFX_POPULATE_QWORD_2'
     438 |         EFX_POPULATE_QWORD_3(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:436:2: note: expanded from macro 'EFX_POPULATE_QWORD_3'
     436 |         EFX_POPULATE_QWORD_4(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 21 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:259:3: note: expanded from macro 'EFX_INSERT_NATIVE'
     259 |          EFX_INSERT_NATIVE32(min, max, low, high, value))
         |          ^
   drivers/net/ethernet/sfc/bitfield.h:253:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
     253 |           (((u32) (value)) << (low - min)) :            \
         |                            ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/net/ethernet/sfc/ef100_rx.c:204:3: warning: shift count >= width of type [-Wshift-count-overflow]
     204 |                 EFX_POPULATE_QWORD_1(*rxd, ESF_GZ_RX_BUF_ADDR, rx_buf->dma_addr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:440:2: note: expanded from macro 'EFX_POPULATE_QWORD_1'
     440 |         EFX_POPULATE_QWORD_2(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:438:2: note: expanded from macro 'EFX_POPULATE_QWORD_2'
     438 |         EFX_POPULATE_QWORD_3(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:436:2: note: expanded from macro 'EFX_POPULATE_QWORD_3'
     436 |         EFX_POPULATE_QWORD_4(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 21 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:259:3: note: expanded from macro 'EFX_INSERT_NATIVE'
     259 |          EFX_INSERT_NATIVE32(min, max, low, high, value))
         |          ^
   drivers/net/ethernet/sfc/bitfield.h:254:21: note: expanded from macro 'EFX_INSERT_NATIVE32'
     254 |           (((u32) (value)) >> (min - low))))
         |                            ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   drivers/net/ethernet/sfc/ef100_rx.c:204:3: warning: shift count is negative [-Wshift-count-negative]
     204 |                 EFX_POPULATE_QWORD_1(*rxd, ESF_GZ_RX_BUF_ADDR, rx_buf->dma_addr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:440:2: note: expanded from macro 'EFX_POPULATE_QWORD_1'
     440 |         EFX_POPULATE_QWORD_2(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:438:2: note: expanded from macro 'EFX_POPULATE_QWORD_2'
     438 |         EFX_POPULATE_QWORD_3(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/bitfield.h:436:2: note: expanded from macro 'EFX_POPULATE_QWORD_3'
     436 |         EFX_POPULATE_QWORD_4(qword, EFX_DUMMY_FIELD, 0, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 21 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/ethernet/sfc/bitfield.h:258:3: note: expanded from macro 'EFX_INSERT_NATIVE'
     258 |          EFX_INSERT_NATIVE64(min, max, low, high, value) :      \


vim +175 drivers/net/ethernet/sfc/ef100_rx.c

8e57daf70671e4 Edward Cree 2020-08-03  170  
8e57daf70671e4 Edward Cree 2020-08-03  171  void efx_ef100_ev_rx(struct efx_channel *channel, const efx_qword_t *p_event)
8e57daf70671e4 Edward Cree 2020-08-03  172  {
8e57daf70671e4 Edward Cree 2020-08-03  173  	struct efx_rx_queue *rx_queue = efx_channel_get_rx_queue(channel);
8e57daf70671e4 Edward Cree 2020-08-03  174  	unsigned int n_packets =
8e57daf70671e4 Edward Cree 2020-08-03 @175  		EFX_QWORD_FIELD(*p_event, ESF_GZ_EV_RXPKTS_NUM_PKT);
8e57daf70671e4 Edward Cree 2020-08-03  176  	int i;
8e57daf70671e4 Edward Cree 2020-08-03  177  
8e57daf70671e4 Edward Cree 2020-08-03  178  	WARN_ON_ONCE(!n_packets);
8e57daf70671e4 Edward Cree 2020-08-03  179  	if (n_packets > 1)
8e57daf70671e4 Edward Cree 2020-08-03  180  		++channel->n_rx_merge_events;
8e57daf70671e4 Edward Cree 2020-08-03  181  
8e57daf70671e4 Edward Cree 2020-08-03  182  	channel->irq_mod_score += 2 * n_packets;
8e57daf70671e4 Edward Cree 2020-08-03  183  
8e57daf70671e4 Edward Cree 2020-08-03  184  	for (i = 0; i < n_packets; ++i) {
8e57daf70671e4 Edward Cree 2020-08-03  185  		ef100_rx_packet(rx_queue,
8e57daf70671e4 Edward Cree 2020-08-03  186  				rx_queue->removed_count & rx_queue->ptr_mask);
8e57daf70671e4 Edward Cree 2020-08-03  187  		++rx_queue->removed_count;
8e57daf70671e4 Edward Cree 2020-08-03  188  	}
8e57daf70671e4 Edward Cree 2020-08-03  189  }
8e57daf70671e4 Edward Cree 2020-08-03  190  

:::::: The code at line 175 was first introduced by commit
:::::: 8e57daf70671e482209b5d231a181f04845cf73e sfc_ef100: RX path for EF100

:::::: TO: Edward Cree <ecree@solarflare.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
