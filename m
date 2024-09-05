Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2C61A0B00;
	Thu,  5 Sep 2024 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725557722; cv=none; b=rHR+U6fLQr0IcDFyjfY3dQRs6SvgjZHn2gc/k33KB6sctt6RBAjLJxsHOExVbdRbyc4/5UTWfi4pfkXml0xqughKI2qpq5d1la5EEnMK0rSab2F7IFtAGyjK5+aHnmZjyNafcEh8AwkiPfmpXLfhFhcWYf29lZRvu+DID2Hb86o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725557722; c=relaxed/simple;
	bh=G/F/UHG4uRgcMZjYmNrETdagpwVjlq9kEEnV6jemLPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KXFQL8voUkMfyBIXXS/j3wuM6UfCIn5HLjZSxcin0amQF1qZcWpSXD4fenGQAP83Yja11x8HlE/qkMRHTnjvuFJZuLoyhYn75kMOo4v6FPNDkyP7Y5vqRdj1TwUW620BgWIzZrmq2iFlVletgrxQYNvEO6iaanEPrOyF+dVeKWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgYCmn8S; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgYCmn8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725557720; x=1757093720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G/F/UHG4uRgcMZjYmNrETdagpwVjlq9kEEnV6jemLPU=;
  b=NgYCmn8SwgrMwwAakj+YDjonx7HFNOjnGXpLoJYNLpghBBEY3whYkSvq
   hgDqx2zMe9Kp7APbrVgwhyH43MRfehr0qr1dj8TKIdfCL65HEMY7Ockcs
   kkkAJ9HLn2ZBe4aqIhRQ9jf4IpMBpRrUTF0No3eILrGFUzkFiTq9P7mRG
   PFvn9UNhtQPVTRjdkFbH4YqmMEIwr2WICQyBOqf0XgAOlGjZae0A77ZuC
   U5W6aJT2z4FLC6YMYtu8+W2h7u65TTX9nKHu3eWRGcrPPTL4T9Qlxkabm
   5kB2Vl5htcIAeq8RWZ+JaMlGJKlFiZ+xLAdpi07MpkQ4RvDuOhqsixTdM
   w==;
X-CSE-ConnectionGUID: BOlykN+nT/2wGKthHFlv/Q==
X-CSE-MsgGUID: o0a9uj+GQnuhU5Hg8qycEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24097486"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="24097486"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 10:35:19 -0700
X-CSE-ConnectionGUID: 8As0Rz39TW+mPLF42u7WeQ==
X-CSE-MsgGUID: IAcNz56bT26bzBiwIHdKTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65414989"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Sep 2024 10:34:21 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smGN9-000ABH-0j;
	Thu, 05 Sep 2024 17:34:19 +0000
Date: Fri, 6 Sep 2024 01:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 25/53]
 drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:8: error: no member
 named 'dev_type' in 'struct hci_dev'
Message-ID: <202409060148.ud2mF5Io-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: 963c678969c7db8aa9be578713ebd9adf4500d0b [25/53] drivers/net/wireless/espressif/esp32-ng: initial import
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240906/202409060148.ud2mF5Io-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060148.ud2mF5Io-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060148.ud2mF5Io-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:8: error: no member named 'dev_type' in 'struct hci_dev'
     243 |         hdev->dev_type = HCI_PRIMARY;
         |         ~~~~  ^
>> drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:19: error: use of undeclared identifier 'HCI_PRIMARY'; did you mean 'HCI_PRIVACY'?
     243 |         hdev->dev_type = HCI_PRIMARY;
         |                          ^~~~~~~~~~~
         |                          HCI_PRIVACY
   include/net/bluetooth/hci.h:401:2: note: 'HCI_PRIVACY' declared here
     401 |         HCI_PRIVACY,
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
   drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1588:2: error: call to undeclared library function 'strlcpy' with type 'unsigned long (char *, const char *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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


vim +243 drivers/net/wireless/espressif/esp32-ng/esp_bt.c

   166	
 > 167	int esp_deinit_bt(struct esp_adapter *adapter)
   168	{
   169		struct hci_dev *hdev = NULL;
   170	
   171		if (!adapter || !adapter->hcidev)
   172			return 0;
   173	
   174		hdev = adapter->hcidev;
   175	
   176		hci_unregister_dev(hdev);
   177		hci_free_dev(hdev);
   178	
   179		adapter->hcidev = NULL;
   180	
   181		return 0;
   182	}
   183	
 > 184	int esp_init_bt(struct esp_adapter *adapter)
   185	{
   186		int ret = 0;
   187		struct hci_dev *hdev = NULL;
   188	
   189		if (!adapter) {
   190			return -EINVAL;
   191		}
   192	
   193		if (adapter->hcidev) {
   194			return -EEXIST;
   195		}
   196	
   197		hdev = hci_alloc_dev();
   198	
   199		if (!hdev) {
   200			BT_ERR("Can not allocate HCI device");
   201			return -ENOMEM;
   202		}
   203	
   204		adapter->hcidev = hdev;
   205		hci_set_drvdata(hdev, adapter);
   206	
   207		hdev->bus = INVALID_HDEV_BUS;
   208	
   209		if (adapter->if_type == ESP_IF_TYPE_SDIO)
   210			hdev->bus   = HCI_SDIO;
   211	    #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 7, 0))
   212		else if (adapter->if_type == ESP_IF_TYPE_SPI)
   213			hdev->bus   = HCI_SPI;
   214	    #endif
   215	
   216		if (hdev->bus == INVALID_HDEV_BUS) {
   217	
   218			if (adapter->if_type == ESP_IF_TYPE_SDIO) {
   219				esp_err("Kernel version does not support HCI over SDIO BUS\n");
   220			} else if (adapter->if_type == ESP_IF_TYPE_SPI) {
   221				esp_err("Kernel version does not support HCI over SPI BUS\n");
   222			} else {
   223				esp_err("HCI over expected BUS[%u] is not supported\n", adapter->if_type);
   224			}
   225			hci_free_dev(hdev);
   226			adapter->hcidev = NULL;
   227			return -EINVAL;
   228		}
   229	
   230		hdev->open  = esp_bt_open;
   231		hdev->close = esp_bt_close;
   232		hdev->flush = esp_bt_flush;
   233		hdev->send  = esp_bt_send_frame;
   234	
   235	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 10, 0))
   236		hdev->setup = esp_bt_setup;
   237	#endif
   238	
   239	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0))
   240		hdev->set_bdaddr = esp_bt_set_bdaddr;
   241	#endif
   242	
 > 243		hdev->dev_type = HCI_PRIMARY;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
