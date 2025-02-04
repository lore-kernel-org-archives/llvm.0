Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83271FFC75;
	Tue,  4 Feb 2025 06:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738649544; cv=none; b=lRBePXA/5tL0R/y+hHsv6XXmolkDgcfuKyJfPzjMN2xstXUr2Ttr/d8VwAoWXRtR1y9W6kLEv+uvk3x/1I1CpBVlBKsNYGwTXR7RRTaLtZDwyR8KlMTuhCmEeDB5TIFjHOOtsBMLx4mGTb7g15Rf/yEbemnwrUy74x6FDbe9B2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738649544; c=relaxed/simple;
	bh=aqZp83J0Mli+PN3oSYxuPUebpjy+AB82aoEFMx8LYR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JcuuzOWiZKgWomHEydxj2ydc6KrMvmOr2mriguuCdf76kAHKUodKEa0/h731b3vni39VrlAGp6Ihhs7hk8BaaTEtb0PKuHUS2UQoCPtP3SoEMLlKaEBbbYw3SBZrp/5J+Yk7KCyjcgwk8om0Lfs1+9OSNNRCaBUaRP8JnYpS4W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dV842yZL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dV842yZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738649542; x=1770185542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aqZp83J0Mli+PN3oSYxuPUebpjy+AB82aoEFMx8LYR0=;
  b=dV842yZLBOkS+ZcR2t+9+OSrFCyOhJ1G32Er/GhklNRdLccuOLiHS7k6
   YsqxUyU4Zh2vASONO8SSDug2tWGUCFTWgpq3ml0MMiHdhJLogkL9u+Fmz
   jBS9oTyPxQuWjbKqMqqAayMS4+DcnXvPNpfBA60Sl393ZtaYeK0zBiuW/
   SHIpQYeWWRvyKxM5/A2lpNGfdRE3O7rQBxXo3wO4N5ZsymzliVRfRkloY
   AK/tFAyf45fE14ae5VHf22Acu45luCrUYb9EbP9xUSSqDWsDB4iTk1Ft+
   fIuMB5x1JQjDY7xz2u814Vbk/UOdW/w0dFEHkK0J9wolxFmI2nUoa/VX1
   g==;
X-CSE-ConnectionGUID: +R5QtX0PRVSkLPgtlUXHsw==
X-CSE-MsgGUID: ORPJBbF1Q/CQfjWQ7ZBCVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50551396"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="50551396"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 22:12:21 -0800
X-CSE-ConnectionGUID: MJIxjJqTQ8CnNbXBizG5gA==
X-CSE-MsgGUID: oVxDNQwhQL2YG99jXgcZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="111088515"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Feb 2025 22:12:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfCAT-000s3X-27;
	Tue, 04 Feb 2025 06:12:17 +0000
Date: Tue, 4 Feb 2025 14:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 25/53]
 drivers/net/wireless/espressif/esp32-ng/esp_bt.c:243:8: error: no member
 named 'dev_type' in 'struct hci_dev'
Message-ID: <202502041439.Q00SNGV7-lkp@intel.com>
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
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250204/202502041439.Q00SNGV7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041439.Q00SNGV7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041439.Q00SNGV7-lkp@intel.com/

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
   include/net/bluetooth/hci.h:417:2: note: 'HCI_PRIVACY' declared here
     417 |         HCI_PRIVACY,
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
