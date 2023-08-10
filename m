Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE811111A;
	Thu, 10 Aug 2023 06:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691647990; x=1723183990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rKnBU8rlIUEGB9TtDq6P/7AAb8/0Sgt0qJecWPjF/Rs=;
  b=fkjS2dkfYg9e66tkXL+t5cQnnDRA7jFKJonTJsNPErfxnyf1cp6RE+E3
   7pM6qUZsqTZ4cdQW4xT2BXNX4SiA+c1pluQtuyKmvqLjog0kkSCgw1evu
   21YW2Sdrsepfm0YtGRZizzii37qfKGReyE3viaOl+QIZvypS9v7ADy++n
   iKT8RGw0VcFC1Y/K6WnqcuUsye9PiXkyEU4nsfx+N5IZpLD4C25FTkiNq
   zEQ239L/IJz1wQISOBjv0BOt6IaujkmC+Wq4ZYg56ZcLNsPpQYr0WARB0
   Q6HGZzAGBdJXrWl88bX29fB+dIfSLsq+yCViTYGi181D4QQPjLyBjgm++
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="368764333"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="368764333"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 23:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="797484221"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="797484221"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Aug 2023 23:13:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTyur-0006my-0k;
	Thu, 10 Aug 2023 06:13:01 +0000
Date: Thu, 10 Aug 2023 14:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>, bpf@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org, kuba@kernel.org, toke@kernel.org,
	willemb@google.com, dsahern@kernel.org, magnus.karlsson@intel.com,
	bjorn@kernel.org, maciej.fijalkowski@intel.com, hawk@kernel.org,
	netdev@vger.kernel.org, xdp-hints@xdp-project.net
Subject: Re: [PATCH bpf-next 2/9] xsk: add TX timestamp and TX checksum
 offload support
Message-ID: <202308101330.Z7cRgzuH-lkp@intel.com>
References: <20230809165418.2831456-3-sdf@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809165418.2831456-3-sdf@google.com>

Hi Stanislav,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/xsk-Support-XDP_TX_METADATA_LEN/20230810-010031
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230809165418.2831456-3-sdf%40google.com
patch subject: [PATCH bpf-next 2/9] xsk: add TX timestamp and TX checksum offload support
config: arm-randconfig-r003-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101330.Z7cRgzuH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101330.Z7cRgzuH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101330.Z7cRgzuH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/igc/igc_main.c:13:
   In file included from include/net/xdp_sock_drv.h:10:
>> include/net/xsk_buff_pool.h:237:49: error: must use 'struct' tag to refer to type 'xdp_buff_xsk'
     237 | static inline bool xp_tx_metadata_enabled(const xdp_buff_xsk *xskb)
         |                                                 ^
         |                                                 struct 
>> include/net/xsk_buff_pool.h:239:9: error: use of undeclared identifier 'sq'
     239 |         return sq->xsk_pool->tx_metadata_len > 0;
         |                ^
>> drivers/net/ethernet/intel/igc/igc_main.c:1267:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1267 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_VLAN,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1268 |                                  IGC_ADVTXD_DCMD_VLE);
         |                                  ~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1257:30: note: expanded from macro 'IGC_SET_FLAG'
    1257 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1271:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1271 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSO,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1272 |                                  (IGC_ADVTXD_DCMD_TSE));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1257:30: note: expanded from macro 'IGC_SET_FLAG'
    1257 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1275:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1275 |         cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1276 |                                  (IGC_ADVTXD_MAC_TSTAMP));
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1257:30: note: expanded from macro 'IGC_SET_FLAG'
    1257 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1279:14: warning: division by zero is undefined [-Wdivision-by-zero]
    1279 |         cmd_type ^= IGC_SET_FLAG(skb->no_fcs, 1, IGC_ADVTXD_DCMD_IFCS);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1257:30: note: expanded from macro 'IGC_SET_FLAG'
    1257 |          ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:6692:46: warning: shift count >= width of type [-Wshift-count-overflow]
    6692 |         err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   5 warnings and 2 errors generated.
--
   In file included from drivers/net/ethernet/intel/igc/igc_xdp.c:5:
   In file included from include/net/xdp_sock_drv.h:10:
>> include/net/xsk_buff_pool.h:237:49: error: must use 'struct' tag to refer to type 'xdp_buff_xsk'
     237 | static inline bool xp_tx_metadata_enabled(const xdp_buff_xsk *xskb)
         |                                                 ^
         |                                                 struct 
>> include/net/xsk_buff_pool.h:239:9: error: use of undeclared identifier 'sq'
     239 |         return sq->xsk_pool->tx_metadata_len > 0;
         |                ^
   2 errors generated.
--
   In file included from drivers/net/ethernet/intel/i40e/i40e_main.c:16:
   In file included from include/net/xdp_sock_drv.h:10:
>> include/net/xsk_buff_pool.h:237:49: error: must use 'struct' tag to refer to type 'xdp_buff_xsk'
     237 | static inline bool xp_tx_metadata_enabled(const xdp_buff_xsk *xskb)
         |                                                 ^
         |                                                 struct 
>> include/net/xsk_buff_pool.h:239:9: error: use of undeclared identifier 'sq'
     239 |         return sq->xsk_pool->tx_metadata_len > 0;
         |                ^
   drivers/net/ethernet/intel/i40e/i40e_main.c:15666:46: warning: shift count >= width of type [-Wshift-count-overflow]
    15666 |         err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
          |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:40:
   In file included from include/net/xdp_sock_drv.h:10:
>> include/net/xsk_buff_pool.h:237:49: error: must use 'struct' tag to refer to type 'xdp_buff_xsk'
     237 | static inline bool xp_tx_metadata_enabled(const xdp_buff_xsk *xskb)
         |                                                 ^
         |                                                 struct 
>> include/net/xsk_buff_pool.h:239:9: error: use of undeclared identifier 'sq'
     239 |         return sq->xsk_pool->tx_metadata_len > 0;
         |                ^
>> drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8219:14: warning: division by zero is undefined [-Wdivision-by-zero]
    8219 |         cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_HW_VLAN,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8220 |                                    IXGBE_ADVTXD_DCMD_VLE);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8209 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8223:14: warning: division by zero is undefined [-Wdivision-by-zero]
    8223 |         cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_TSO,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8224 |                                    IXGBE_ADVTXD_DCMD_TSE);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8209 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8227:14: warning: division by zero is undefined [-Wdivision-by-zero]
    8227 |         cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_TSTAMP,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8228 |                                    IXGBE_ADVTXD_MAC_TSTAMP);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8209 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8231:14: warning: division by zero is undefined [-Wdivision-by-zero]
    8231 |         cmd_type ^= IXGBE_SET_FLAG(skb->no_fcs, 1, IXGBE_ADVTXD_DCMD_IFCS);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8209 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8242:19: warning: division by zero is undefined [-Wdivision-by-zero]
    8242 |         olinfo_status |= IXGBE_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
    8243 |                                         IXGBE_TX_FLAGS_CSUM,
         |                                         ~~~~~~~~~~~~~~~~~~~~
    8244 |                                         IXGBE_ADVTXD_POPTS_TXSM);
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8209 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8247:19: warning: division by zero is undefined [-Wdivision-by-zero]
    8247 |         olinfo_status |= IXGBE_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
    8248 |                                         IXGBE_TX_FLAGS_IPV4,
         |                                         ~~~~~~~~~~~~~~~~~~~~
    8249 |                                         IXGBE_ADVTXD_POPTS_IXSM);
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8209 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8252:19: warning: division by zero is undefined [-Wdivision-by-zero]
    8252 |         olinfo_status |= IXGBE_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
    8253 |                                         IXGBE_TX_FLAGS_IPSEC,
         |                                         ~~~~~~~~~~~~~~~~~~~~~
    8254 |                                         IXGBE_ADVTXD_POPTS_IPSEC);
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8209 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8260:19: warning: division by zero is undefined [-Wdivision-by-zero]
    8260 |         olinfo_status |= IXGBE_SET_FLAG(tx_flags,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
    8261 |                                         IXGBE_TX_FLAGS_CC,
         |                                         ~~~~~~~~~~~~~~~~~~
    8262 |                                         IXGBE_ADVTXD_CC);
         |                                         ~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
    8209 |          ((u32)(_input & _flag) / (_flag / _result)))
         |                                 ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:10789:46: warning: shift count >= width of type [-Wshift-count-overflow]
    10789 |         err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
          |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   9 warnings and 2 errors generated.


vim +237 include/net/xsk_buff_pool.h

   236	
 > 237	static inline bool xp_tx_metadata_enabled(const xdp_buff_xsk *xskb)
   238	{
 > 239		return sq->xsk_pool->tx_metadata_len > 0;
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
