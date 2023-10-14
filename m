Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726F9EADF;
	Sat, 14 Oct 2023 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPOaJ5dI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697286992; x=1728822992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O7Xwz2yPydGYhxbWbNkAtO4dOB2zzsGA9xkgKRUhbxg=;
  b=BPOaJ5dI2KmpQItSJ02luhbgo4IZ38CbYkoFPySPMHlumOFZ+wpDvlXM
   3iWIKG05u61yXfDH0vgVwni/nK96WqcLfbLDx9T8fu86yLpNLAriEge1V
   ueZKZW/kbjksaFjMz+QsO3SYfLzn0SNfwHSzOxoEW5NhqgiMv41iuBP9v
   3ivo6OZ5d0hPJTdSgqf/bG2Mmm1EqPj1aTQui69uD3/XPX1Qo1xv+HNDm
   g30aNf+IijTW34JhhfK8of0H7zKFOrcyKbCacciZHD64FtbdlmMeFh49/
   LS8lOfqq0U1HTQ2GVELdaVUb9tzffmg3CoRoZbzZP39S3ojxnIdijs/fr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="382552501"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="382552501"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 05:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="748664969"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="748664969"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 05:36:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrdsW-0006A7-07;
	Sat, 14 Oct 2023 12:36:24 +0000
Date: Sat, 14 Oct 2023 20:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] netlink: add variable-length / auto integers
Message-ID: <202310142003.fYeLpu4J-lkp@intel.com>
References: <20231011003313.105315-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011003313.105315-1-kuba@kernel.org>

Hi Jakub,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master v6.6-rc5 next-20231013]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/netlink-add-variable-length-auto-integers/20231011-083419
base:   net/main
patch link:    https://lore.kernel.org/r/20231011003313.105315-1-kuba%40kernel.org
patch subject: [RFC] netlink: add variable-length / auto integers
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231014/202310142003.fYeLpu4J-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142003.fYeLpu4J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142003.fYeLpu4J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/e1000e/netdev.c:15:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:20:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1647:9: error: call to undeclared function 'nla_get_u64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return nla_get_u64(nla);
                  ^
   include/net/netlink.h:1647:9: note: did you mean 'nla_get_u32'?
   include/net/netlink.h:1634:19: note: 'nla_get_u32' declared here
   static inline u32 nla_get_u32(const struct nlattr *nla)
                     ^
   include/net/netlink.h:1708:19: error: static declaration of 'nla_get_u64' follows non-static declaration
   static inline u64 nla_get_u64(const struct nlattr *nla)
                     ^
   include/net/netlink.h:1647:9: note: previous implicit declaration is here
           return nla_get_u64(nla);
                  ^
>> drivers/net/ethernet/intel/e1000e/netdev.c:4462:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   adapter->cc.mask = CYCLECOUNTER_MASK(64);
                                      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/timecounter.h:14:59: note: expanded from macro 'CYCLECOUNTER_MASK'
   #define CYCLECOUNTER_MASK(bits) (u64)((bits) < 64 ? ((1ULL<<(bits))-1) : -1)
                                                             ^ ~~~~~~
   drivers/net/ethernet/intel/e1000e/netdev.c:7386:46: warning: shift count >= width of type [-Wshift-count-overflow]
           err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                       ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   2 warnings and 2 errors generated.
--
   In file included from drivers/net/ethernet/intel/igb/igb_main.c:13:
   In file included from include/linux/ipv6.h:94:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:20:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1647:9: error: call to undeclared function 'nla_get_u64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return nla_get_u64(nla);
                  ^
   include/net/netlink.h:1647:9: note: did you mean 'nla_get_u32'?
   include/net/netlink.h:1634:19: note: 'nla_get_u32' declared here
   static inline u32 nla_get_u32(const struct nlattr *nla)
                     ^
   include/net/netlink.h:1708:19: error: static declaration of 'nla_get_u64' follows non-static declaration
   static inline u64 nla_get_u64(const struct nlattr *nla)
                     ^
   include/net/netlink.h:1647:9: note: previous implicit declaration is here
           return nla_get_u64(nla);
                  ^
   drivers/net/ethernet/intel/igb/igb_main.c:3226:46: warning: shift count >= width of type [-Wshift-count-overflow]
           err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                       ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
>> drivers/net/ethernet/intel/igb/igb_main.c:6132:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IGB_SET_FLAG(tx_flags, IGB_TX_FLAGS_VLAN,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6122:26: note: expanded from macro 'IGB_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6136:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IGB_SET_FLAG(tx_flags, IGB_TX_FLAGS_TSO,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6122:26: note: expanded from macro 'IGB_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6140:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IGB_SET_FLAG(tx_flags, IGB_TX_FLAGS_TSTAMP,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6122:26: note: expanded from macro 'IGB_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6144:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type ^= IGB_SET_FLAG(skb->no_fcs, 1, E1000_ADVTXD_DCMD_IFCS);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6122:26: note: expanded from macro 'IGB_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6160:19: warning: division by zero is undefined [-Wdivision-by-zero]
           olinfo_status |= IGB_SET_FLAG(tx_flags,
                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6122:26: note: expanded from macro 'IGB_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6165:19: warning: division by zero is undefined [-Wdivision-by-zero]
           olinfo_status |= IGB_SET_FLAG(tx_flags,
                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igb/igb_main.c:6122:26: note: expanded from macro 'IGB_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   7 warnings and 2 errors generated.
--
   In file included from drivers/net/ethernet/intel/igb/igb_ptp.c:7:
   In file included from include/linux/ptp_classify.h:17:
   In file included from include/linux/udp.h:16:
   In file included from include/net/inet_sock.h:22:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:20:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1647:9: error: call to undeclared function 'nla_get_u64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return nla_get_u64(nla);
                  ^
   include/net/netlink.h:1647:9: note: did you mean 'nla_get_u32'?
   include/net/netlink.h:1634:19: note: 'nla_get_u32' declared here
   static inline u32 nla_get_u32(const struct nlattr *nla)
                     ^
   include/net/netlink.h:1708:19: error: static declaration of 'nla_get_u64' follows non-static declaration
   static inline u64 nla_get_u64(const struct nlattr *nla)
                     ^
   include/net/netlink.h:1647:9: note: previous implicit declaration is here
           return nla_get_u64(nla);
                  ^
>> drivers/net/ethernet/intel/igb/igb_ptp.c:1336:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   adapter->cc.mask = CYCLECOUNTER_MASK(64);
                                      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/timecounter.h:14:59: note: expanded from macro 'CYCLECOUNTER_MASK'
   #define CYCLECOUNTER_MASK(bits) (u64)((bits) < 64 ? ((1ULL<<(bits))-1) : -1)
                                                             ^ ~~~~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/net/ethernet/intel/igc/igc_main.c:7:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:20:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1647:9: error: call to undeclared function 'nla_get_u64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return nla_get_u64(nla);
                  ^
   include/net/netlink.h:1647:9: note: did you mean 'nla_get_u32'?
   include/net/netlink.h:1634:19: note: 'nla_get_u32' declared here
   static inline u32 nla_get_u32(const struct nlattr *nla)
                     ^
   include/net/netlink.h:1708:19: error: static declaration of 'nla_get_u64' follows non-static declaration
   static inline u64 nla_get_u64(const struct nlattr *nla)
                     ^
   include/net/netlink.h:1647:9: note: previous implicit declaration is here
           return nla_get_u64(nla);
                  ^
>> drivers/net/ethernet/intel/igc/igc_main.c:1267:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_VLAN,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1257:30: note: expanded from macro 'IGC_SET_FLAG'
            ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
                                       ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1271:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSO,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1257:30: note: expanded from macro 'IGC_SET_FLAG'
            ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
                                       ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1277:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1257:30: note: expanded from macro 'IGC_SET_FLAG'
            ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
                                       ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1280:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP_1,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1257:30: note: expanded from macro 'IGC_SET_FLAG'
            ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
                                       ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1283:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP_2,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1257:30: note: expanded from macro 'IGC_SET_FLAG'
            ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
                                       ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1286:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IGC_SET_FLAG(tx_flags, IGC_TX_FLAGS_TSTAMP_3,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1257:30: note: expanded from macro 'IGC_SET_FLAG'
            ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
                                       ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1290:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type ^= IGC_SET_FLAG(skb->no_fcs, 1, IGC_ADVTXD_DCMD_IFCS);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1257:30: note: expanded from macro 'IGC_SET_FLAG'
            ((u32)((_input) & (_flag)) / ((_flag) / (_result))))
                                       ^ ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:6751:46: warning: shift count >= width of type [-Wshift-count-overflow]
           err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                       ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   8 warnings and 2 errors generated.
--
   In file included from drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:13:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:66:
   In file included from include/net/dst.h:20:
   In file included from include/net/neighbour.h:31:
   In file included from include/net/rtnetlink.h:6:
   include/net/netlink.h:1647:9: error: call to undeclared function 'nla_get_u64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return nla_get_u64(nla);
                  ^
   include/net/netlink.h:1647:9: note: did you mean 'nla_get_u32'?
   include/net/netlink.h:1634:19: note: 'nla_get_u32' declared here
   static inline u32 nla_get_u32(const struct nlattr *nla)
                     ^
   include/net/netlink.h:1708:19: error: static declaration of 'nla_get_u64' follows non-static declaration
   static inline u64 nla_get_u64(const struct nlattr *nla)
                     ^
   include/net/netlink.h:1647:9: note: previous implicit declaration is here
           return nla_get_u64(nla);
                  ^
>> drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8219:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_HW_VLAN,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8223:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_TSO,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8227:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type |= IXGBE_SET_FLAG(tx_flags, IXGBE_TX_FLAGS_TSTAMP,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8231:14: warning: division by zero is undefined [-Wdivision-by-zero]
           cmd_type ^= IXGBE_SET_FLAG(skb->no_fcs, 1, IXGBE_ADVTXD_DCMD_IFCS);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8242:19: warning: division by zero is undefined [-Wdivision-by-zero]
           olinfo_status |= IXGBE_SET_FLAG(tx_flags,
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8247:19: warning: division by zero is undefined [-Wdivision-by-zero]
           olinfo_status |= IXGBE_SET_FLAG(tx_flags,
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8252:19: warning: division by zero is undefined [-Wdivision-by-zero]
           olinfo_status |= IXGBE_SET_FLAG(tx_flags,
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8260:19: warning: division by zero is undefined [-Wdivision-by-zero]
           olinfo_status |= IXGBE_SET_FLAG(tx_flags,
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:8209:26: note: expanded from macro 'IXGBE_SET_FLAG'
            ((u32)(_input & _flag) / (_flag / _result)))
                                   ^ ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:10786:46: warning: shift count >= width of type [-Wshift-count-overflow]
           err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                       ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   9 warnings and 2 errors generated.


vim +4462 drivers/net/ethernet/intel/e1000e/netdev.c

98942d70538a16 drivers/net/ethernet/intel/e1000e/netdev.c Miroslav Lichvar 2018-11-09  4432  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4433  /**
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4434   * e1000_sw_init - Initialize general software structures (struct e1000_adapter)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4435   * @adapter: board private structure to initialize
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4436   *
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4437   * e1000_sw_init initializes the Adapter private data structure.
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4438   * Fields are initialized based on PCI device information and
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4439   * OS network device settings (MTU size).
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4440   **/
9f9a12f8ca7983 drivers/net/ethernet/intel/e1000e/netdev.c Bill Pemberton   2012-12-03  4441  static int e1000_sw_init(struct e1000_adapter *adapter)
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4442  {
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4443  	struct net_device *netdev = adapter->netdev;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4444  
8084b86dcfbc4b drivers/net/ethernet/intel/e1000e/netdev.c Alexander Duyck  2015-05-02  4445  	adapter->rx_buffer_len = VLAN_ETH_FRAME_LEN + ETH_FCS_LEN;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4446  	adapter->rx_ps_bsize0 = 128;
8084b86dcfbc4b drivers/net/ethernet/intel/e1000e/netdev.c Alexander Duyck  2015-05-02  4447  	adapter->max_frame_size = netdev->mtu + VLAN_ETH_HLEN + ETH_FCS_LEN;
318a94d68979cb drivers/net/e1000e/netdev.c                Jeff Kirsher     2008-03-28  4448  	adapter->min_frame_size = ETH_ZLEN + ETH_FCS_LEN;
55aa69854a93d7 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2011-12-16  4449  	adapter->tx_ring_count = E1000_DEFAULT_TXD;
55aa69854a93d7 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2011-12-16  4450  	adapter->rx_ring_count = E1000_DEFAULT_RXD;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4451  
67fd4fcb78a7ce drivers/net/e1000e/netdev.c                Jeff Kirsher     2011-01-07  4452  	spin_lock_init(&adapter->stats64_lock);
67fd4fcb78a7ce drivers/net/e1000e/netdev.c                Jeff Kirsher     2011-01-07  4453  
4662e82b2cb41c drivers/net/e1000e/netdev.c                Bruce Allan      2008-08-26  4454  	e1000e_set_interrupt_capability(adapter);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4455  
4662e82b2cb41c drivers/net/e1000e/netdev.c                Bruce Allan      2008-08-26  4456  	if (e1000_alloc_queues(adapter))
4662e82b2cb41c drivers/net/e1000e/netdev.c                Bruce Allan      2008-08-26  4457  		return -ENOMEM;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4458  
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4459  	/* Setup hardware time stamping cyclecounter */
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4460  	if (adapter->flags & FLAG_HAS_HW_TIMESTAMP) {
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4461  		adapter->cc.read = e1000e_cyclecounter_read;
4d045b4c06b1f7 drivers/net/ethernet/intel/e1000e/netdev.c Richard Cochran  2015-01-02 @4462  		adapter->cc.mask = CYCLECOUNTER_MASK(64);
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4463  		adapter->cc.mult = 1;
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4464  		/* cc.shift set in e1000e_get_base_tininca() */
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4465  
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4466  		spin_lock_init(&adapter->systim_lock);
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4467  		INIT_WORK(&adapter->tx_hwtstamp_work, e1000e_tx_hwtstamp_work);
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4468  	}
b67e191307a3f3 drivers/net/ethernet/intel/e1000e/netdev.c Bruce Allan      2012-12-27  4469  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4470  	/* Explicitly disable IRQ since the NIC can be in any state. */
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4471  	e1000_irq_disable(adapter);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4472  
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4473  	set_bit(__E1000_DOWN, &adapter->state);
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4474  	return 0;
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4475  }
bc7f75fa97884d drivers/net/e1000e/netdev.c                Auke Kok         2007-09-17  4476  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
