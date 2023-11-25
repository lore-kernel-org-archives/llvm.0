Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D3A28E01;
	Sat, 25 Nov 2023 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePp2f9kD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700925215; x=1732461215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HyCGyyAxIlCd4SOkvzpHE7K6NOyi0LsAjq2XKx3mggM=;
  b=ePp2f9kDgV9Td0NhX3Mp+u4hCeTbkqw7LbPIBcUvblIuo/HT76685MEQ
   GyRkES0KWXbLD5iqZT/G9A8G1jLEqoSE3/Mx41cuJfyBRQkWY7/uj1wbu
   ko5INi1+OYIBM5iEXcks1e3sJeg4+DACC9es1j/+0fUQXfYdFcfLBL5q+
   ct+d1YvUFI1sLhX7pqKk1bW32lm1sDCFj65uZHznUcQYd/bcwmH2TOtPI
   UaD6+n4IqdcrXrSE6KZ87tmvbMKQNZvxcKJXhEakiF/V6OwB3SZRx9UFj
   SGYWIV8i+wKErP5KC5oZHa8XZu2DEEB87VzfSPurq1lYWvVsK19xDIrCk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="395344779"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="395344779"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 07:13:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="9211869"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2023 07:13:33 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6uLa-00047L-13;
	Sat, 25 Nov 2023 15:13:30 +0000
Date: Sat, 25 Nov 2023 23:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.7-rc1-esp32 16/44]
 drivers/net/wireless/espressif/esp32-ng/main.c:61:12: warning: variable 'c'
 set but not used
Message-ID: <202311252200.XNnYW1BD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.7-rc1-esp32
head:   29146ecac0ff1d907be16ff18d485a34985f6bf3
commit: 68443b38720d1296140f260511f3281d5d5cccb5 [16/44] drivers/net/wireless/espressif/esp32-ng: initial import
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311252200.XNnYW1BD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311252200.XNnYW1BD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311252200.XNnYW1BD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/espressif/esp32-ng/main.c:20:
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:32: error: variable has incomplete type 'struct cfg80211_rx_assoc_resp'
           struct cfg80211_rx_assoc_resp resp = {0};
                                         ^
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:9: note: forward declaration of 'struct cfg80211_rx_assoc_resp'
           struct cfg80211_rx_assoc_resp resp = {0};
                  ^
>> drivers/net/wireless/espressif/esp32-ng/main.c:61:12: warning: variable 'c' set but not used [-Wunused-but-set-variable]
           static u8 c;
                     ^
   1 warning and 1 error generated.
--
   In file included from drivers/net/wireless/espressif/esp32-ng/esp_bt.c:10:
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:32: error: variable has incomplete type 'struct cfg80211_rx_assoc_resp'
           struct cfg80211_rx_assoc_resp resp = {0};
                                         ^
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:9: note: forward declaration of 'struct cfg80211_rx_assoc_resp'
           struct cfg80211_rx_assoc_resp resp = {0};
                  ^
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:14:6: warning: no previous prototype for function 'esp_hci_update_tx_counter' [-Wmissing-prototypes]
   void esp_hci_update_tx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
        ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void esp_hci_update_tx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
   ^
   static 
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:29:6: warning: no previous prototype for function 'esp_hci_update_rx_counter' [-Wmissing-prototypes]
   void esp_hci_update_rx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
        ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void esp_hci_update_rx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
   ^
   static 
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:167:5: warning: no previous prototype for function 'esp_deinit_bt' [-Wmissing-prototypes]
   int esp_deinit_bt(struct esp_adapter *adapter)
       ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:167:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int esp_deinit_bt(struct esp_adapter *adapter)
   ^
   static 
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:184:5: warning: no previous prototype for function 'esp_init_bt' [-Wmissing-prototypes]
   int esp_init_bt(struct esp_adapter *adapter)
       ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:184:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int esp_init_bt(struct esp_adapter *adapter)
   ^
   static 
   4 warnings and 1 error generated.
--
   In file included from drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:14:
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:32: error: variable has incomplete type 'struct cfg80211_rx_assoc_resp'
           struct cfg80211_rx_assoc_resp resp = {0};
                                         ^
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:9: note: forward declaration of 'struct cfg80211_rx_assoc_resp'
           struct cfg80211_rx_assoc_resp resp = {0};
                  ^
>> drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:414:22: warning: no previous prototype for function 'prepare_command_request' [-Wmissing-prototypes]
   struct command_node *prepare_command_request(struct esp_adapter *adapter, u8 cmd_code, u16 len)
                        ^
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:414:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct command_node *prepare_command_request(struct esp_adapter *adapter, u8 cmd_code, u16 len)
   ^
   static 
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:847:23: warning: variable 'bss' set but not used [-Wunused-but-set-variable]
           struct cfg80211_bss *bss;
                                ^
   2 warnings and 1 error generated.
--
>> drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.c:34:5: warning: no previous prototype for function 'wpa_cipher_key_len' [-Wmissing-prototypes]
   int wpa_cipher_key_len(int cipher)
       ^
   drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.c:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int wpa_cipher_key_len(int cipher)
   ^
   static 
   1 warning generated.
--
>> drivers/net/wireless/espressif/esp32-ng/esp_stats.c:182:6: warning: no previous prototype for function 'process_test_capabilities' [-Wmissing-prototypes]
   void process_test_capabilities(u8 cap)
        ^
   drivers/net/wireless/espressif/esp32-ng/esp_stats.c:182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void process_test_capabilities(u8 cap)
   ^
   static 
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
