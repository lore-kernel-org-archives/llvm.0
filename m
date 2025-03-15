Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FD71A0B0E;
	Sat, 15 Mar 2025 08:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742027155; cv=none; b=Z7iToMmS8r/5cbcT+pbR3k5j6imfOErqICnIn++YxRLtuHUAuC71rqNznCEkHYoQG2E2kwiMtdqloZowwdwnbd+p/ZO0d3XXhSRyB1ZBKJqorZtKwvfO6kLxEJ8+oRJxryauHmlyp+b3/sPj6MPybAgXbjxjBeVIaLnA31KLvQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742027155; c=relaxed/simple;
	bh=OqCzJ2wDgr7fqdtjwNX9kgQ7EEAIyjSA+n47BJX5y/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AZYd0cRk2/srSBfpTYmWjwXqdM/addXQMkzG7rQgdc/UF9SsFdpimKbfIj2zzaNOpH1zvx3cz0FtqT0SlrvOUE9dQUc4fcVOPfxKLsE2OxyjOvFCnf9Z9vmH4QyJRhQke9aO+R8v9rsq3IStIUV/USB/nxJRjtSeFn0hwJKHQUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccD+AHl3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccD+AHl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742027153; x=1773563153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OqCzJ2wDgr7fqdtjwNX9kgQ7EEAIyjSA+n47BJX5y/0=;
  b=ccD+AHl3Jtglyqxgx0EcqvtbSoyKni6oXu1UfiYFqY1EKnhFi7/oVLMK
   VfB5+W6/2DuJbSZ6i0E1YRXmqVP42KNaG+s51w/Q8L4EJz9QN8a+rjoPY
   VUTpVW1OQ3vEcjjGqcHTWrL5eCnXW1vrnHfb1V3TyGBWIw6qrBlGCdJ0D
   22w1Az6XvAXGZKtALTRidWcRDMcs7/EBPKtxRUqOZXv8Dh6Dgsv+dA7l8
   uNr98qlm41Dg+RYL/o0NExFljhxniYISk8P59dQzVwFhXHIaAAZvO5Je3
   UhdHxo5ZsSFQ3FJrS5I+byl289XV/+CiNxlNAy6mwzJH/4YPsELWfMJfH
   Q==;
X-CSE-ConnectionGUID: PGKEDHBaTcWLsHL8viXK0g==
X-CSE-MsgGUID: YTeMMjBeSO+sFOeOfA2GKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43388355"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="43388355"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 01:25:52 -0700
X-CSE-ConnectionGUID: sqRqEvdhTuKfdU5UgFeguA==
X-CSE-MsgGUID: JaQqhqKHSCK+XVcUapiJXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="125691056"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2025 01:25:50 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttMq4-000B9x-1W;
	Sat, 15 Mar 2025 08:25:48 +0000
Date: Sat, 15 Mar 2025 16:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sarika Sharma <quic_sarishar@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [ath:ath12k-split-phy 141/158]
 drivers/net/wireless/intel/iwlwifi/dvm/lib.c:589:40: error: too few
 arguments to function call, expected 2, have 1
Message-ID: <202503151644.yfAQJbDP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
head:   b8fa5b81fe378ec2bf46db73a2ff7d43151121da
commit: 203d9de0460ca9a0eb7a281f36d854968a1101bc [141/158] wifi: mac80211: add support towards MLO handling of station statistics
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250315/202503151644.yfAQJbDP-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151644.yfAQJbDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151644.yfAQJbDP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/dvm/lib.c:6:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/wireless/intel/iwlwifi/dvm/lib.c:6:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/wireless/intel/iwlwifi/dvm/lib.c:6:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/net/wireless/intel/iwlwifi/dvm/lib.c:589:40: error: too few arguments to function call, expected 2, have 1
     589 |         ave_rssi = ieee80211_ave_rssi(ctx->vif);
         |                    ~~~~~~~~~~~~~~~~~~         ^
   include/net/mac80211.h:7234:5: note: 'ieee80211_ave_rssi' declared here
    7234 | int ieee80211_ave_rssi(struct ieee80211_vif *vif, int link_id);
         |     ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings and 1 error generated.


vim +589 drivers/net/wireless/intel/iwlwifi/dvm/lib.c

354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  567  
83ce21de686a67b drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  568  /*
83ce21de686a67b drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  569   * Upon RSSI changes, sends a bt config command with following changes
83ce21de686a67b drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  570   *  1. enable/disable "reduced control frames tx power
83ce21de686a67b drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  571   *  2. update the "kill)ack_mask" and "kill_cts_mask"
83ce21de686a67b drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  572   *
83ce21de686a67b drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  573   * If "reduced tx power" is enabled, uCode shall
83ce21de686a67b drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  574   *  1. ACK/Back/CTS rate shall reduced to 6Mbps
83ce21de686a67b drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  575   *  2. not use duplciate 20/40MHz mode
83ce21de686a67b drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  576   */
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  577  static bool iwlagn_fill_txpower_mode(struct iwl_priv *priv,
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  578  				struct iwl_bt_uart_msg *uart_msg)
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  579  {
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  580  	bool need_update = false;
dd551ab7b47ace1 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  581  	struct iwl_rxon_context *ctx = &priv->contexts[IWL_RXON_CTX_BSS];
dd551ab7b47ace1 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  582  	int ave_rssi;
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  583  
e19ebcab01cc130 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Ilan Peer  2012-05-10  584  	if (!ctx->vif || (ctx->vif->type != NL80211_IFTYPE_STATION)) {
e19ebcab01cc130 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Ilan Peer  2012-05-10  585  		IWL_DEBUG_INFO(priv, "BSS ctx not active or not in sta mode\n");
e19ebcab01cc130 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Ilan Peer  2012-05-10  586  		return false;
e19ebcab01cc130 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Ilan Peer  2012-05-10  587  	}
e19ebcab01cc130 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Ilan Peer  2012-05-10  588  
dd551ab7b47ace1 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03 @589  	ave_rssi = ieee80211_ave_rssi(ctx->vif);
dd551ab7b47ace1 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  590  	if (!ave_rssi) {
dd551ab7b47ace1 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  591  		/* no rssi data, no changes to reduce tx power */
dd551ab7b47ace1 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  592  		IWL_DEBUG_COEX(priv, "no rssi data available\n");
dd551ab7b47ace1 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  593  		return need_update;
dd551ab7b47ace1 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  594  	}
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  595  	if (!priv->reduced_txpower &&
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  596  	    !iwl_is_associated(priv, IWL_RXON_CTX_PAN) &&
dd551ab7b47ace1 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  597  	    (ave_rssi > BT_ENABLE_REDUCED_TXPOWER_THRESHOLD) &&
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  598  	    (uart_msg->frame3 & (BT_UART_MSG_FRAME3ACL_MSK |
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  599  	    BT_UART_MSG_FRAME3OBEX_MSK)) &&
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  600  	    !(uart_msg->frame3 & (BT_UART_MSG_FRAME3SCOESCO_MSK |
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  601  	    BT_UART_MSG_FRAME3SNIFF_MSK | BT_UART_MSG_FRAME3A2DP_MSK))) {
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  602  		/* enabling reduced tx power */
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  603  		priv->reduced_txpower = true;
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  604  		priv->bt_valid |= IWLAGN_BT_VALID_REDUCED_TX_PWR;
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  605  		need_update = true;
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  606  	} else if (priv->reduced_txpower &&
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  607  		   (iwl_is_associated(priv, IWL_RXON_CTX_PAN) ||
dd551ab7b47ace1 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  608  		   (ave_rssi < BT_DISABLE_REDUCED_TXPOWER_THRESHOLD) ||
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  609  		   (uart_msg->frame3 & (BT_UART_MSG_FRAME3SCOESCO_MSK |
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  610  		   BT_UART_MSG_FRAME3SNIFF_MSK | BT_UART_MSG_FRAME3A2DP_MSK)) ||
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  611  		   !(uart_msg->frame3 & (BT_UART_MSG_FRAME3ACL_MSK |
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  612  		   BT_UART_MSG_FRAME3OBEX_MSK)))) {
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  613  		/* disable reduced tx power */
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  614  		priv->reduced_txpower = false;
f6be8b7845434a5 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  615  		priv->bt_valid |= IWLAGN_BT_VALID_REDUCED_TX_PWR;
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  616  		need_update = true;
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  617  	}
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  618  
354ce4a4ca613f3 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  619  	return need_update;
b6e116e8bf7d749 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2010-08-23  620  }
b6e116e8bf7d749 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2010-08-23  621  

:::::: The code at line 589 was first introduced by commit
:::::: dd551ab7b47ace14753b0d73f79437cc35adcf6b iwlwifi: include rssi as part of decision making for reduce txpower

:::::: TO: Wey-Yi Guy <wey-yi.w.guy@intel.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
