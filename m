Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4A2199921;
	Sat, 11 Jan 2025 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736603536; cv=none; b=B4yUwk5Dnd5Xxw+ybCTxZLeX9pwQWHE85JrbxbJFcSPdmsqEfhxfWoEl5ylmRUjr0916Ui90MUGEpLXf0kp2ikod/ZEOrZ5dF2xH+U/Xst7cWRyy2Z1OQHrVUWsuiUCfH4uHTyPCJq5fGNy4pWhwtCB4Hk5tz4R0MyFQtrMl3mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736603536; c=relaxed/simple;
	bh=4mzNc+R5hTivEu+R8FMcSGVx6fteb5tJK8Cu8z5CYTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hTiONzrsfUYROiSI7h3axA/QsWFhem43H77HPLJZkEErn8g6e3yMJXfWc6ub06DoIMgWwbUAwaBdXSsw/eoLhz4WkLSGzCs1T8LaOr3hPdL7XoaS+xv2oka5WV+Q3c+ZFiPIzd/IelAbeAMsFbPABnhP1A6iwsIFkA5zXju9O8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMetyrM7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMetyrM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736603535; x=1768139535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4mzNc+R5hTivEu+R8FMcSGVx6fteb5tJK8Cu8z5CYTk=;
  b=IMetyrM73d1cEIhUnfVXEui/DsVL1B+uif/OWplLgWR5uOVTUCxsXteA
   K1xwxInHRRqzk18e7sBI1q2Ru+bO4wm4wwCd74s6lJSaMfN6esuN+3RNT
   JyvlkuJNjYdoByoTVc90ywUz0ODtatvkN0KaDPBMU3r5ggdqaW9ZKBjQQ
   L6Uawr9Sm/U1b5JZy05ZidA6dixtiDOmWoLLR/3oKMjIkuFOENpk59ISm
   qanQ/ZDTeWAerNqJoYrRZkadEoCUvNa/b4TunqtcdQESXi3zAUherGOTs
   4vGmhezVsD6tlpLIlzhKi1RtKnUCNaH7ptKF9KvMKTSz2l3xObJK8gbXC
   g==;
X-CSE-ConnectionGUID: kVXsdfAQSLaIzPXzOGC2bg==
X-CSE-MsgGUID: kGjJm2QZTVyAB9vIu8C2Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="40567681"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="40567681"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 05:52:13 -0800
X-CSE-ConnectionGUID: l8zuaSk5Ra6SkWZZzjQwnQ==
X-CSE-MsgGUID: tB/Wby5JSJyM4KlHfOY/RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="104172198"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jan 2025 05:52:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWbuL-000KiF-0i;
	Sat, 11 Jan 2025 13:52:09 +0000
Date: Sat, 11 Jan 2025 21:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Katta Dhanunjanrao <katta.dhanunjanrao@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 284/504]
 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.h:185:22: error: field has
 incomplete type 'struct delayed_work'
Message-ID: <202501112143.cOO7OCGd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 18423b91613062a236168cdd7df7a0ce5d999c9f [284/504] drm: xlnx: dptx: Add HDCP1x support for DPTx subsystem
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501112143.cOO7OCGd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501112143.cOO7OCGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112143.cOO7OCGd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xlnx/hdcp/xhdcp1x_tx.c:22:
   In file included from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.h:11:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/xlnx/hdcp/xhdcp1x_tx.c:22:
   In file included from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.h:11:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/xlnx/hdcp/xhdcp1x_tx.c:22:
   In file included from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.h:11:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/xlnx/hdcp/xhdcp1x_tx.c:22:
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.h:185:22: error: field has incomplete type 'struct delayed_work'
     185 |         struct delayed_work     sm_work;
         |                                 ^
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.h:185:9: note: forward declaration of 'struct delayed_work'
     185 |         struct delayed_work     sm_work;
         |                ^
   12 warnings and 1 error generated.


vim +185 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.h

   153	
   154	/*
   155	 * struct xlnx_hdcp1x_config - This structure contains Hdcp1x driver
   156	 * configuration information
   157	 * @dev: device information
   158	 * @handlers: Callback handlers
   159	 * @sm_work: state machine worker
   160	 * @curr_state: current authentication state
   161	 * @prev_sate: Previous Authentication State
   162	 * @repeatervalues: The downstream repeater capabilities
   163	 * @stats: authentication status
   164	 * @hdcp1x_keymgmt_base: Key management base address
   165	 * @cipher: Pointer to cipher driver instance
   166	 * @interface_ref: Pointer to interface(DP/HDMI) driver instance
   167	 * @interface_base: Pointer to instance iomem base
   168	 * @pending_events: Evenets that are set by interface driver
   169	 * @downstreamready: To check the downstream device status ready or not
   170	 * @is_repeater: says whether downstream is repeater or receiver
   171	 * @hdcp1x_key_availble: The KMS block has key exists or not.
   172	 * @lane_count: number of lanes data to be encrypted
   173	 * @hdcp1x_key: hdcp1x key pointer
   174	 * @auth_status: first stage authentication status
   175	 * @keyinit: Key Management Block with key initiliazed properly or not
   176	 * @is_encryption_en: Encryption enbalemnet is done or not
   177	 * @is_cipher: is cipher init is done or not
   178	 * @state_helper: to store the An value temp basis
   179	 * @encryption_map: To check the encryption progress
   180	 *
   181	 */
   182	struct xlnx_hdcp1x_config {
   183		struct device *dev;
   184		struct xhdcp1x_tx_callbacks handlers;
 > 185		struct delayed_work	sm_work;
   186		enum hdcp1x_tx_state	curr_state;
   187		enum hdcp1x_tx_state	prev_state;
   188		struct xhdcp1x_tx_status stats;
   189		struct regmap *hdcp1x_keymgmt_base;
   190		void	*cipher;
   191		void	*interface_ref;
   192		void __iomem	*interface_base;
   193		u32	pending_events;
   194		u32	downstreamready;
   195		bool	is_repeater;
   196		bool	hdcp1x_key_available;
   197		u8	lane_count;
   198		u8	*hdcp1x_key;
   199		u8	auth_status;
   200		u8	keyinit;
   201		u8	is_encryption_en;
   202		u8	is_enabled;
   203		u8	is_cipher;
   204		u64	state_helper;
   205		u64	encryption_map;
   206	};
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
