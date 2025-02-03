Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0457B667;
	Mon,  3 Feb 2025 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606812; cv=none; b=fBI/lZtRMrRWac1mCOVbTCA4sNIaHjwt+2BtlewMuk05p4hqO1vbN8cnuWqVY1MXPSwtdG0EebUiiVaIWbXedLTDi476IgLxVOk21fCwV8/YNIBRnSct3kIFUOHGwxe6TgwgCNM4XrPAAhk933ehBuxRPR2kWPegLVQ9c5gbNJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606812; c=relaxed/simple;
	bh=0/SFe6ontQ1rBUmBbKb/Z1ll73rs7sKXF9VyAHyLdIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZIn1n+sldmb6E4khzc2okoy34bJol+WCydaH9mhFM93Mar8wTrpjMk4gC/5shNZ2JUDbFMcExUXyXFalSduo5GmFvqq1P0mBlaVgOq0GzlAIrKepJGrh4Rc421FoqL+LLogX3KNnaZ8QsrP5jLNXI8m+zTnAwaVb4fXnRDbZHsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnhJnxvd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnhJnxvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738606811; x=1770142811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0/SFe6ontQ1rBUmBbKb/Z1ll73rs7sKXF9VyAHyLdIM=;
  b=nnhJnxvdgumpfVNcBpOC384wUQvHKkKXH/Eu4qnRMcDbjJFu7o1+4DIo
   RcyRka/dwY+xBTx16gfBLGE/5n4cokmjalH6qpjMJ4EOJ7uVEwYxrz2qS
   Vr7YuG1IeT7GvLSlkme/zlDdRK49LN5rsB7p8fDEUkuw21GJ+tmudAJ29
   Abae1UVc3R2ubTMODlzs01ljqHGsEdUvuTdVY7Zzi39q2pvliFFRBDjuN
   nlw/gegCEu6HYWMkQUzf1gCCrdCfL9LO5Q7w1Ottemtonhpg2WPcPcPyR
   3zlbUiKDJ3A61mRb3wzH1IdGHH/mtQDQofXVvSNW1sPPVMDQ4ie+RdEPY
   Q==;
X-CSE-ConnectionGUID: IyruCw2ETmm43Gy0RAB96A==
X-CSE-MsgGUID: F72pPUlzTienh842J1ZNxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39212868"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39212868"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 10:20:05 -0800
X-CSE-ConnectionGUID: PfXEsjFESbGPV+UjiYtbow==
X-CSE-MsgGUID: L+FTKLhsSpSSnLQf0+i42A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110905817"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Feb 2025 10:20:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf13B-000rKT-2K;
	Mon, 03 Feb 2025 18:20:01 +0000
Date: Tue, 4 Feb 2025 02:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 25/53]
 drivers/net/wireless/espressif/esp32-ng/main.c:61:12: warning: variable 'c'
 set but not used
Message-ID: <202502040232.anRep9mw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: 6c0af79e75e54aeb74a525f9c6e958db674bf816 [25/53] drivers/net/wireless/espressif/esp32-ng: initial import
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250204/202502040232.anRep9mw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040232.anRep9mw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040232.anRep9mw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/espressif/esp32-ng/main.c:20:
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:32: error: variable has incomplete type 'struct cfg80211_rx_assoc_resp'
     181 |         struct cfg80211_rx_assoc_resp resp = {0};
         |                                       ^
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:9: note: forward declaration of 'struct cfg80211_rx_assoc_resp'
     181 |         struct cfg80211_rx_assoc_resp resp = {0};
         |                ^
>> drivers/net/wireless/espressif/esp32-ng/main.c:61:12: warning: variable 'c' set but not used [-Wunused-but-set-variable]
      61 |         static u8 c;
         |                   ^
   1 warning and 1 error generated.
--
   In file included from drivers/net/wireless/espressif/esp32-ng/esp_bt.c:10:
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:32: error: variable has incomplete type 'struct cfg80211_rx_assoc_resp'
     181 |         struct cfg80211_rx_assoc_resp resp = {0};
         |                                       ^
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:9: note: forward declaration of 'struct cfg80211_rx_assoc_resp'
     181 |         struct cfg80211_rx_assoc_resp resp = {0};
         |                ^
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:14:6: warning: no previous prototype for function 'esp_hci_update_tx_counter' [-Wmissing-prototypes]
      14 | void esp_hci_update_tx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         |      ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      14 | void esp_hci_update_tx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         | ^
         | static 
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:29:6: warning: no previous prototype for function 'esp_hci_update_rx_counter' [-Wmissing-prototypes]
      29 | void esp_hci_update_rx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         |      ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      29 | void esp_hci_update_rx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         | ^
         | static 
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:167:5: warning: no previous prototype for function 'esp_deinit_bt' [-Wmissing-prototypes]
     167 | int esp_deinit_bt(struct esp_adapter *adapter)
         |     ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:167:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     167 | int esp_deinit_bt(struct esp_adapter *adapter)
         | ^
         | static 
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:8: error: no member named 'dev_type' in 'struct hci_dev'
     243 |         hdev->dev_type = HCI_PRIMARY;
         |         ~~~~  ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:19: error: use of undeclared identifier 'HCI_PRIMARY'; did you mean 'HCI_PRIVACY'?
     243 |         hdev->dev_type = HCI_PRIMARY;
         |                          ^~~~~~~~~~~
         |                          HCI_PRIVACY
   include/net/bluetooth/hci.h:417:2: note: 'HCI_PRIVACY' declared here
     417 |         HCI_PRIVACY,
         |         ^
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:184:5: warning: no previous prototype for function 'esp_init_bt' [-Wmissing-prototypes]
     184 | int esp_init_bt(struct esp_adapter *adapter)
         |     ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:184:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     184 | int esp_init_bt(struct esp_adapter *adapter)
         | ^
         | static 
   4 warnings and 3 errors generated.
--
   In file included from drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:14:
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:32: error: variable has incomplete type 'struct cfg80211_rx_assoc_resp'
     181 |         struct cfg80211_rx_assoc_resp resp = {0};
         |                                       ^
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:9: note: forward declaration of 'struct cfg80211_rx_assoc_resp'
     181 |         struct cfg80211_rx_assoc_resp resp = {0};
         |                ^
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:414:22: warning: no previous prototype for function 'prepare_command_request' [-Wmissing-prototypes]
     414 | struct command_node *prepare_command_request(struct esp_adapter *adapter, u8 cmd_code, u16 len)
         |                      ^
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:414:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     414 | struct command_node *prepare_command_request(struct esp_adapter *adapter, u8 cmd_code, u16 len)
         | ^
         | static 
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:847:23: warning: variable 'bss' set but not used [-Wunused-but-set-variable]
     847 |         struct cfg80211_bss *bss;
         |                              ^
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1588:2: error: call to undeclared library function 'strlcpy' with type 'unsigned int (char *, const char *, unsigned int)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1588 |         strlcpy(cmd->country_code, priv->country_code, MAX_COUNTRY_LEN);
         |         ^
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1588:2: note: include the header <string.h> or explicitly provide a declaration for 'strlcpy'
   2 warnings and 2 errors generated.
--
>> drivers/net/wireless/espressif/esp32-ng/esp_stats.c:182:6: warning: no previous prototype for function 'process_test_capabilities' [-Wmissing-prototypes]
     182 | void process_test_capabilities(u8 cap)
         |      ^
   drivers/net/wireless/espressif/esp32-ng/esp_stats.c:182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     182 | void process_test_capabilities(u8 cap)
         | ^
         | static 
   1 warning generated.


vim +/c +61 drivers/net/wireless/espressif/esp32-ng/main.c

    50	
    51	static int process_tx_packet(struct sk_buff *skb)
    52	{
    53		struct esp_wifi_device *priv = NULL;
    54		struct esp_skb_cb *cb = NULL;
    55		struct esp_payload_header *payload_header = NULL;
    56		struct sk_buff *new_skb = NULL;
    57		int ret = 0;
    58		u8 pad_len = 0, realloc_skb = 0;
    59		u16 len = 0;
    60		u16 total_len = 0;
  > 61		static u8 c;
    62		u8 *pos = NULL;
    63	
    64		c++;
    65		/* Get the priv */
    66		cb = (struct esp_skb_cb *) skb->cb;
    67		priv = cb->priv;
    68	
    69		if (!priv) {
    70			dev_kfree_skb(skb);
    71			esp_info("No priv\n");
    72			return NETDEV_TX_OK;
    73		}
    74	
    75		if (netif_queue_stopped((const struct net_device *) priv->ndev)) {
    76			esp_info("Netif queue stopped\n");
    77			return NETDEV_TX_BUSY;
    78		}
    79	
    80		if (host_sleep) {
    81			return NETDEV_TX_BUSY;
    82		}
    83	
    84		len = skb->len;
    85	
    86		/* Create space for payload header */
    87		pad_len = sizeof(struct esp_payload_header);
    88	
    89		total_len = len + pad_len;
    90	
    91		/* Align buffer length */
    92		pad_len += SKB_DATA_ADDR_ALIGNMENT - (total_len % SKB_DATA_ADDR_ALIGNMENT);
    93	
    94		if (skb_headroom(skb) < pad_len) {
    95			/* Headroom is not sufficient */
    96			realloc_skb = 1;
    97		}
    98	
    99		if (realloc_skb || !IS_ALIGNED((unsigned long) skb->data, SKB_DATA_ADDR_ALIGNMENT)) {
   100			/* Realloc SKB */
   101			if (skb_linearize(skb)) {
   102				priv->stats.tx_errors++;
   103				dev_kfree_skb(skb);
   104				esp_err("Failed to linearize SKB");
   105				return NETDEV_TX_OK;
   106			}
   107	
   108			new_skb = esp_alloc_skb(skb->len + pad_len);
   109	
   110			if (!new_skb) {
   111				esp_err("Failed to allocate SKB");
   112				priv->stats.tx_errors++;
   113				dev_kfree_skb(skb);
   114				return NETDEV_TX_OK;
   115			}
   116	
   117			pos = new_skb->data;
   118			pos += pad_len;
   119	
   120			/* Populate new SKB */
   121			skb_copy_from_linear_data(skb, pos, skb->len);
   122			skb_put(new_skb, skb->len + pad_len);
   123	
   124			/* Replace old SKB */
   125			dev_kfree_skb_any(skb);
   126			skb = new_skb;
   127		} else {
   128			/* Realloc is not needed, Make space for interface header */
   129			skb_push(skb, pad_len);
   130		}
   131	
   132		/* Set payload header */
   133		payload_header = (struct esp_payload_header *) skb->data;
   134		memset(payload_header, 0, pad_len);
   135	
   136		payload_header->if_type = priv->if_type;
   137		payload_header->if_num = priv->if_num;
   138		payload_header->len = cpu_to_le16(len);
   139		payload_header->offset = cpu_to_le16(pad_len);
   140		payload_header->packet_type = PACKET_TYPE_DATA;
   141	
   142		if (adapter.capabilities & ESP_CHECKSUM_ENABLED)
   143			payload_header->checksum = cpu_to_le16(compute_checksum(skb->data, (len + pad_len)));
   144	
   145		if (!priv->stop_data) {
   146			ret = esp_send_packet(priv->adapter, skb);
   147	
   148			if (ret) {
   149	/*			esp_err("Failed to send SKB");*/
   150				priv->stats.tx_errors++;
   151			} else {
   152				priv->stats.tx_packets++;
   153				priv->stats.tx_bytes += skb->len;
   154			}
   155		} else {
   156			dev_kfree_skb_any(skb);
   157			priv->stats.tx_dropped++;
   158		}
   159	
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
