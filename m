Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BE6947E;
	Mon, 14 Aug 2023 12:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692016583; x=1723552583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OzRjG5TN+2NRV923M7qX/sdtn26c2W4ENmJI7RRNNaU=;
  b=fJ4XAg9RpRad850R3pTzyp/+ojxOTxd9lUBRumNL5MpFmQzPV8AvQuPc
   33E76ZB8EIzRHSqDfsU2lEk0kAURpcxO73TRkqpWIMRR8dd0Fdx3xj9+K
   QCWfy+imSaCH6i7ByDrHvwkbvOFKdzhFQLsZaMLF2UOHUPI86nQEEc+Cf
   JkzL654DjhvfGRZonoovs0JmNM70rU8B9Ys8QfojUxlq9pomQ3YFrx1if
   gRlYWE/NYhGxEHdEJrEn/AGDDjXcagMfm/FcHvepWeMp2npEO0/H5xe+n
   q8GsHuq2SdJI8KSc4Sv8uiVJvYLeLzWdwaCF15KiNk5ARwFFJNPOoSjUV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="370926432"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="370926432"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 05:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="907219229"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="907219229"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Aug 2023 05:36:19 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVWnz-00008x-0y;
	Mon, 14 Aug 2023 12:36:19 +0000
Date: Mon, 14 Aug 2023 20:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 15/24]
 drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1977:35: warning: implicit
 conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes
 value from 18446744073709551615 to 4294967295
Message-ID: <202308142006.YnDbddQC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   5e3487a17fbf6e33d8ddd60444073ff0bc59b35e
commit: 6908950a8afc72c0e7e4131658994a3cd384c95c [15/24] pci: Add basic support for discovery of IDE on PCIe device
config: riscv-randconfig-r013-20230814 (https://download.01.org/0day-ci/archive/20230814/202308142006.YnDbddQC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308142006.YnDbddQC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308142006.YnDbddQC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/intel/iwlwifi/pcie/trans.c:7:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     751 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/intel/iwlwifi/pcie/trans.c:7:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     759 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/intel/iwlwifi/pcie/trans.c:7:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     768 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/intel/iwlwifi/pcie/trans.c:7:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     777 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/intel/iwlwifi/pcie/trans.c:7:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     786 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/intel/iwlwifi/pcie/trans.c:7:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1134 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/intel/iwlwifi/pcie/trans.c:7:
   include/linux/pci.h:352:12: warning: declaration of 'enum pci_ide_stream_type' will not be visible outside of this function [-Wvisibility]
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^
   include/linux/pci.h:352:32: error: variable has incomplete type 'enum pci_ide_stream_type'
     352 |                                          enum pci_ide_stream_type type)
         |                                                                   ^
   include/linux/pci.h:352:12: note: forward declaration of 'enum pci_ide_stream_type'
     352 |                                          enum pci_ide_stream_type type)
         |                                               ^
>> drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1977:35: warning: implicit conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1977 |         trans_pcie->supported_dma_mask = DMA_BIT_MASK(12);
         |                                        ~ ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1979:36: warning: implicit conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1979 |                 trans_pcie->supported_dma_mask = DMA_BIT_MASK(11);
         |                                                ~ ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                        ^~~~~
   16 warnings and 1 error generated.


vim +1977 drivers/net/wireless/intel/iwlwifi/pcie/trans.c

6a06b6c131d529f drivers/net/wireless/iwlwifi/pcie/trans.c       Emmanuel Grumbach      2012-12-02  1948  
c6f600fcfe8a7e4 drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Meenakshi Venkataraman 2012-03-08  1949  static void iwl_trans_pcie_configure(struct iwl_trans *trans,
c6f600fcfe8a7e4 drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Meenakshi Venkataraman 2012-03-08  1950  				     const struct iwl_trans_config *trans_cfg)
c6f600fcfe8a7e4 drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Meenakshi Venkataraman 2012-03-08  1951  {
c6f600fcfe8a7e4 drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Meenakshi Venkataraman 2012-03-08  1952  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
c6f600fcfe8a7e4 drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Meenakshi Venkataraman 2012-03-08  1953  
6ac5720086c8b17 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg          2021-08-02  1954  	/* free all first - we might be reconfigured for a different size */
6ac5720086c8b17 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg          2021-08-02  1955  	iwl_pcie_free_rbs_pool(trans);
6ac5720086c8b17 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg          2021-08-02  1956  
4f4822b7cd5ab81 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Mordechay Goodstein    2020-05-29  1957  	trans->txqs.cmd.q_id = trans_cfg->cmd_queue;
4f4822b7cd5ab81 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Mordechay Goodstein    2020-05-29  1958  	trans->txqs.cmd.fifo = trans_cfg->cmd_fifo;
4f4822b7cd5ab81 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Mordechay Goodstein    2020-05-29  1959  	trans->txqs.cmd.wdg_timeout = trans_cfg->cmd_q_wdg_timeout;
22852fad9c17c64 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Mordechay Goodstein    2020-09-26  1960  	trans->txqs.page_offs = trans_cfg->cb_data_offs;
22852fad9c17c64 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Mordechay Goodstein    2020-09-26  1961  	trans->txqs.dev_cmd_offs = trans_cfg->cb_data_offs + sizeof(void *);
227f25972c5adc8 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg          2022-02-10  1962  	trans->txqs.queue_alloc_cmd_ver = trans_cfg->queue_alloc_cmd_ver;
22852fad9c17c64 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Mordechay Goodstein    2020-09-26  1963  
d663ee73f62903a drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Johannes Berg          2012-03-10  1964  	if (WARN_ON(trans_cfg->n_no_reclaim_cmds > MAX_NO_RECLAIM_CMDS))
d663ee73f62903a drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Johannes Berg          2012-03-10  1965  		trans_pcie->n_no_reclaim_cmds = 0;
d663ee73f62903a drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Johannes Berg          2012-03-10  1966  	else
d663ee73f62903a drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Johannes Berg          2012-03-10  1967  		trans_pcie->n_no_reclaim_cmds = trans_cfg->n_no_reclaim_cmds;
d663ee73f62903a drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Johannes Berg          2012-03-10  1968  	if (trans_pcie->n_no_reclaim_cmds)
d663ee73f62903a drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Johannes Berg          2012-03-10  1969  		memcpy(trans_pcie->no_reclaim_cmds, trans_cfg->no_reclaim_cmds,
d663ee73f62903a drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Johannes Berg          2012-03-10  1970  		       trans_pcie->n_no_reclaim_cmds * sizeof(u8));
9eae88fa9a02e31 drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Johannes Berg          2012-03-15  1971  
6c4fbcbc1c954d6 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Emmanuel Grumbach      2015-11-10  1972  	trans_pcie->rx_buf_size = trans_cfg->rx_buf_size;
6c4fbcbc1c954d6 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Emmanuel Grumbach      2015-11-10  1973  	trans_pcie->rx_page_order =
6c4fbcbc1c954d6 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Emmanuel Grumbach      2015-11-10  1974  		iwl_trans_get_rb_size_order(trans_pcie->rx_buf_size);
80084e359139036 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg          2019-10-02  1975  	trans_pcie->rx_buf_bytes =
80084e359139036 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg          2019-10-02  1976  		iwl_trans_get_rb_size(trans_pcie->rx_buf_size);
cfdc20efebdc1dc drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg          2019-10-02 @1977  	trans_pcie->supported_dma_mask = DMA_BIT_MASK(12);
cfdc20efebdc1dc drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg          2019-10-02  1978  	if (trans->trans_cfg->device_family >= IWL_DEVICE_FAMILY_AX210)
cfdc20efebdc1dc drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg          2019-10-02  1979  		trans_pcie->supported_dma_mask = DMA_BIT_MASK(11);
7c5ba4a830cbb73 drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Johannes Berg          2012-04-09  1980  
8e3b79f887b9939 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Mordechay Goodstein    2020-09-24  1981  	trans->txqs.bc_table_dword = trans_cfg->bc_table_dword;
3a736bcb18f7979 drivers/net/wireless/iwlwifi/pcie/trans.c       Emmanuel Grumbach      2014-09-10  1982  	trans_pcie->scd_set_active = trans_cfg->scd_set_active;
f14d6b39c0b3519 drivers/net/wireless/iwlwifi/pcie/trans.c       Johannes Berg          2014-03-21  1983  
39bdb17ebb5bd7a drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sharon Dvir            2015-10-15  1984  	trans->command_groups = trans_cfg->command_groups;
39bdb17ebb5bd7a drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sharon Dvir            2015-10-15  1985  	trans->command_groups_size = trans_cfg->command_groups_size;
39bdb17ebb5bd7a drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sharon Dvir            2015-10-15  1986  
f14d6b39c0b3519 drivers/net/wireless/iwlwifi/pcie/trans.c       Johannes Berg          2014-03-21  1987  	/* Initialize NAPI here - it should be before registering to mac80211
f14d6b39c0b3519 drivers/net/wireless/iwlwifi/pcie/trans.c       Johannes Berg          2014-03-21  1988  	 * in the opmode but after the HW struct is allocated.
f14d6b39c0b3519 drivers/net/wireless/iwlwifi/pcie/trans.c       Johannes Berg          2014-03-21  1989  	 * As this function may be called again in some corner cases don't
f14d6b39c0b3519 drivers/net/wireless/iwlwifi/pcie/trans.c       Johannes Berg          2014-03-21  1990  	 * do anything if NAPI was already initialized.
f14d6b39c0b3519 drivers/net/wireless/iwlwifi/pcie/trans.c       Johannes Berg          2014-03-21  1991  	 */
bce977310416a2b drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon            2016-01-25  1992  	if (trans_pcie->napi_dev.reg_state != NETREG_DUMMY)
f14d6b39c0b3519 drivers/net/wireless/iwlwifi/pcie/trans.c       Johannes Berg          2014-03-21  1993  		init_dummy_netdev(&trans_pcie->napi_dev);
906d4eb84408a4b drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg          2020-12-09  1994  
906d4eb84408a4b drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg          2020-12-09  1995  	trans_pcie->fw_reset_handshake = trans_cfg->fw_reset_handshake;
c6f600fcfe8a7e4 drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Meenakshi Venkataraman 2012-03-08  1996  }
c6f600fcfe8a7e4 drivers/net/wireless/iwlwifi/iwl-trans-pcie.c   Meenakshi Venkataraman 2012-03-08  1997  

:::::: The code at line 1977 was first introduced by commit
:::::: cfdc20efebdc1dc918338818b10f1d95b58b2ca5 iwlwifi: pcie: use partial pages if applicable

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Luca Coelho <luciano.coelho@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
