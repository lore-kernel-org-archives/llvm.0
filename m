Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27244C6D;
	Thu,  2 Mar 2023 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677751992; x=1709287992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5CgQmEl7Cl6LP/yRIVPbv9O2aicpKVEXn05u1U3/eDE=;
  b=a89ympCys5JC7rAuqX+fCvcm4XmJOJwuHt9rou3xk6jJzIRlHcTMdawt
   DB26knr32M9ZyrHay0v3ohCPH8e9jvxu6jyAiHjziPmFOf/x0OQnqUUyK
   PfiE2/DY2g3uEHMNZxG1OkSRwFV1An2M18tAkszcDgY5eLecmwtasTb2b
   9178fRHCXnon9sUW+0Fad/h8M19qkSTkINB9PRoIag0qhN0J1og185Cs0
   FdRq+czpbGDFND9fZ0iJrEBV80BFU0C6sEDpgta01o09M7eNtzD7RyI+T
   U85sqlJSCrlitNH9Esejfe9cH3IyH073cOXY/EGgzuXs7+3oK5RnVz/u8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="362272456"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="362272456"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 02:13:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="920617292"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="920617292"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Mar 2023 02:13:10 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXfvy-0000P0-0r;
	Thu, 02 Mar 2023 10:13:10 +0000
Date: Thu, 2 Mar 2023 18:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Shay Agroskin <shayagr@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v1 net-next 4/5] net: ena: Add support to changing
 tx_push_buf_len
Message-ID: <202303021857.W3OewnNH-lkp@intel.com>
References: <20230301175916.1819491-5-shayagr@amazon.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301175916.1819491-5-shayagr@amazon.com>

Hi Shay,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Shay-Agroskin/ethtool-Add-support-for-configuring-tx_push_buf_len/20230302-023939
patch link:    https://lore.kernel.org/r/20230301175916.1819491-5-shayagr%40amazon.com
patch subject: [PATCH RFC v1 net-next 4/5] net: ena: Add support to changing tx_push_buf_len
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230302/202303021857.W3OewnNH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7e98696241b7456eb53243cc97ba7c64f86f1a97
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shay-Agroskin/ethtool-Add-support-for-configuring-tx_push_buf_len/20230302-023939
        git checkout 7e98696241b7456eb53243cc97ba7c64f86f1a97
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021857.W3OewnNH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/amazon/ena/ena_ethtool.c:528:45: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
                   snprintf(large_llq_size_str, 40, ", %lu", ENA_LLQ_LARGE_HEADER);
                                                       ~~~   ^~~~~~~~~~~~~~~~~~~~
                                                       %u
   drivers/net/ethernet/amazon/ena/ena_eth_com.h:16:30: note: expanded from macro 'ENA_LLQ_LARGE_HEADER'
   #define ENA_LLQ_LARGE_HEADER    (256 - ENA_LLQ_ENTRY_DESC_CHUNK_SIZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/amazon/ena/ena_ethtool.c:532:12: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
                                          ENA_LLQ_HEADER,
                                          ^~~~~~~~~~~~~~
   include/linux/netlink.h:131:58: note: expanded from macro 'NL_SET_ERR_MSG_FMT_MOD'
           NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
                                                            ~~~    ^~~~
   include/linux/netlink.h:117:29: note: expanded from macro 'NL_SET_ERR_MSG_FMT'
                        "%s" fmt "%s", "", ##args, "") >=                         \
                             ~~~             ^~~~
   drivers/net/ethernet/amazon/ena/ena_eth_com.h:15:25: note: expanded from macro 'ENA_LLQ_HEADER'
   #define ENA_LLQ_HEADER          (128 - ENA_LLQ_ENTRY_DESC_CHUNK_SIZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/amazon/ena/ena_ethtool.c:532:12: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
                                          ENA_LLQ_HEADER,
                                          ^~~~~~~~~~~~~~~
   include/linux/netlink.h:131:58: note: expanded from macro 'NL_SET_ERR_MSG_FMT_MOD'
           NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/netlink.h:120:12: note: expanded from macro 'NL_SET_ERR_MSG_FMT'
                                        ##args, "\n");                            \
                                        ~~^~~~~~~~~~~
   include/linux/net.h:286:43: note: expanded from macro 'net_warn_ratelimited'
           net_ratelimited_function(pr_warn, fmt, ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/printk.h:510:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   3 warnings generated.


vim +528 drivers/net/ethernet/amazon/ena/ena_ethtool.c

   494	
   495	static int ena_set_ringparam(struct net_device *netdev,
   496				     struct ethtool_ringparam *ring,
   497				     struct kernel_ethtool_ringparam *kernel_ring,
   498				     struct netlink_ext_ack *extack)
   499	{
   500		struct ena_adapter *adapter = netdev_priv(netdev);
   501		u32 new_tx_size, new_rx_size, new_tx_push_buf_len;
   502		bool changed = false;
   503	
   504		new_tx_size = ring->tx_pending < ENA_MIN_RING_SIZE ?
   505				ENA_MIN_RING_SIZE : ring->tx_pending;
   506		new_tx_size = rounddown_pow_of_two(new_tx_size);
   507	
   508		new_rx_size = ring->rx_pending < ENA_MIN_RING_SIZE ?
   509				ENA_MIN_RING_SIZE : ring->rx_pending;
   510		new_rx_size = rounddown_pow_of_two(new_rx_size);
   511	
   512		changed |= new_tx_size != adapter->requested_tx_ring_size ||
   513			   new_rx_size != adapter->requested_rx_ring_size;
   514	
   515		/* This value is ignored if LLQ is not supported */
   516		new_tx_push_buf_len = 0;
   517		if (adapter->ena_dev->tx_mem_queue_type == ENA_ADMIN_PLACEMENT_POLICY_HOST)
   518			goto no_llq_supported;
   519	
   520		new_tx_push_buf_len = kernel_ring->tx_push_buf_len;
   521	
   522		/* support for ENA_LLQ_LARGE_HEADER is tested in the 'get' command */
   523		if (new_tx_push_buf_len != ENA_LLQ_HEADER &&
   524		    new_tx_push_buf_len != ENA_LLQ_LARGE_HEADER) {
   525			bool large_llq_sup = adapter->large_llq_header_supported;
   526			char large_llq_size_str[40];
   527	
 > 528			snprintf(large_llq_size_str, 40, ", %lu", ENA_LLQ_LARGE_HEADER);
   529	
   530			NL_SET_ERR_MSG_FMT_MOD(extack,
   531					       "Only [%lu%s] tx push buff length values are supported",
   532					       ENA_LLQ_HEADER,
   533					       large_llq_sup ? large_llq_size_str : "");
   534	
   535			return -EINVAL;
   536		}
   537	
   538		changed |= new_tx_push_buf_len != adapter->ena_dev->tx_max_header_size;
   539	
   540	no_llq_supported:
   541		if (!changed)
   542			return 0;
   543	
   544		return ena_update_queue_params(adapter, new_tx_size, new_rx_size,
   545					       new_tx_push_buf_len);
   546	}
   547	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
