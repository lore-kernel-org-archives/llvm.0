Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3090A1CD3C;
	Sun,  9 Jun 2024 14:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717942754; cv=none; b=YFLdkSkGfmBzyrIJWgPI7fNfEb5vgCnRenwK5SeRNeGog1GRpp7OXV134t1VS+FdtU5syL2laTMDZSYnUC8v/dlmqkWHtWELW7KEyWazRmLzCchiZgltZseYOb7uIc0QN1bSymghBKouGYEbNiNLc3xZ9GPitDR7A4ubD+Zhb3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717942754; c=relaxed/simple;
	bh=0LOyIpUlnAST825XFh1I9RM3CFpeNzaj7f7ZCyM/BVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOB1KOVRxXd+fKnmdwcO6AAtn2ZOJmWDYiF/sE93oGsOml9x6x+HWYd9hD7ZJ5HhRzPam9OvM6eHRfKMiIUmciC4N7x699RU3Uf7BcnCCR9S0GBxWqVPsZ56HogxETpFIj4sJduZ9pIGxNFjaknkD+NytGcLv208oPJ4+31UFz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=daIFivMk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="daIFivMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717942753; x=1749478753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0LOyIpUlnAST825XFh1I9RM3CFpeNzaj7f7ZCyM/BVg=;
  b=daIFivMkIe/wvqnIg2xWw2icILfMZSNaHkh3pKAxUzYy4+hnCwGQEvrc
   pC+/NhLIaQNj8DzmGyr31ybY0fwyiWtt7Kwts9eu91U9XjsOBTJlgjDVz
   oZo+bGS6zjoz/zZayRdY85FW8+YAxd2JihgBDv2ZkjiwI24mkMQb39XGD
   L6/CKANOcyXEKZ2fCUbDS2lUtuzm3XXOUN3KsqsG0V7tq0unopX9CjdHD
   cCYob7GPHcJHUgSaydW6LizpaSBKFfTnLEkAkFwll40d9nDhUGab35t38
   eE5p7ReCk1SizHv8L0kUEiZypIHcIAEMZiGBsdrTUhG17d6TvXR6o57Tl
   Q==;
X-CSE-ConnectionGUID: R2cqCZ3MS8iSWp8KsHmqwA==
X-CSE-MsgGUID: TRYDSwDCRFWPDBCE8l+pTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="11985762"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="11985762"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 07:19:12 -0700
X-CSE-ConnectionGUID: wzB9Ol1BTZ6MulyeBk/z3w==
X-CSE-MsgGUID: dpp2/PWIQBCHMjTEFiSwow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="43752070"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Jun 2024 07:19:11 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGJO1-0001HW-0T;
	Sun, 09 Jun 2024 14:19:09 +0000
Date: Sun, 9 Jun 2024 22:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.10-rc2-esp32 24/46]
 drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:8: error: no member
 named 'dev_type' in 'struct hci_dev'
Message-ID: <202406092218.hkC8h29P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.10-rc2-esp32
head:   abd44c5784518efb46e1601d9b04cb5a63506944
commit: 95c1c9a2c0485380d57c4d0e645098add2a37e93 [24/46] drivers/net/wireless/espressif/esp32-ng: initial import
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240609/202406092218.hkC8h29P-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406092218.hkC8h29P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406092218.hkC8h29P-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/espressif/esp32-ng/esp_bt.c:10:
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:32: error: variable has incomplete type 'struct cfg80211_rx_assoc_resp'
     181 |         struct cfg80211_rx_assoc_resp resp = {0};
         |                                       ^
   drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:181:9: note: forward declaration of 'struct cfg80211_rx_assoc_resp'
     181 |         struct cfg80211_rx_assoc_resp resp = {0};
         |                ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:14:6: warning: no previous prototype for function 'esp_hci_update_tx_counter' [-Wmissing-prototypes]
      14 | void esp_hci_update_tx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         |      ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      14 | void esp_hci_update_tx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         | ^
         | static 
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:29:6: warning: no previous prototype for function 'esp_hci_update_rx_counter' [-Wmissing-prototypes]
      29 | void esp_hci_update_rx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         |      ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      29 | void esp_hci_update_rx_counter(struct hci_dev *hdev, u8 pkt_type, size_t len)
         | ^
         | static 
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:167:5: warning: no previous prototype for function 'esp_deinit_bt' [-Wmissing-prototypes]
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
   include/net/bluetooth/hci.h:387:2: note: 'HCI_PRIVACY' declared here
     387 |         HCI_PRIVACY,
         |         ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:184:5: warning: no previous prototype for function 'esp_init_bt' [-Wmissing-prototypes]
     184 | int esp_init_bt(struct esp_adapter *adapter)
         |     ^
   drivers/net/wireless/espressif/esp32-ng/esp_bt.c:184:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     184 | int esp_init_bt(struct esp_adapter *adapter)
         | ^
         | static 
   4 warnings and 3 errors generated.


vim +243 drivers/net/wireless/espressif/esp32-ng/esp_bt.c

   242	
 > 243		hdev->dev_type = HCI_PRIMARY;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
