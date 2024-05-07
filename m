Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBE84A0C;
	Tue,  7 May 2024 01:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715046320; cv=none; b=hjjYZ/56oUmTUduMEA72cL3PeFuZ5R5CwwZRjZ/HAkBl/902Hxv9DcArwMkxjAijYF4E5JH/7ySUf92Lvam8QltUwhE/Dfa8E94pxSzD97hthDhR5XnILK48K5oGXWjzRRBQU5/QRnmImIhe30FK4/YGPjwHQkKznYGgkfzDVog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715046320; c=relaxed/simple;
	bh=Pv1AQtJOYkxC1yQA8no3goFIzvaWgQo7xKQd+D4EqU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9tMaJq2kV4ZIxI8meAi8mgZb+OB2D8adQyDlAtfuw0e8O+VEEUUiuxAUtSAW6kEEiK570gwLAtYf/Op0bAP1VqjEeXnd0xG7kJq7Kyi8uAz62FBwuNE8p6rMH8pqwyTuaaTiEcSEj71KG5dxMxcJvmeA4gLBULZlgqIdkXY8xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8M4qr6e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8M4qr6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715046319; x=1746582319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pv1AQtJOYkxC1yQA8no3goFIzvaWgQo7xKQd+D4EqU8=;
  b=C8M4qr6e1Tf23FQn42BId0c1F2lNFbp+++6+HKxTs8B4Nz00Cl/I36hE
   btpm/AcUDed2fTTZN9GSf4FfyuDOmFLAGNGdalenkITR1jkzSwZ9tZ7iD
   eBY5ML6h1RcJKQm2TGeIWnodPJP5qCiYJ9vMxFQGpSz4uA8AXkFEf25Lv
   pjPJndkMGBb77wmKy+AvirJnLwLophHR0IcRXfuCT32x0jE80hKv4occT
   ADwC1RP2vvpjNo1Vi7AnSLJgDOqbGEsgwskyKMdPf9VL1ap1gRbjM6O1z
   g3h62wrzXLTbGwtnBTSO0ldZ9gkTZNmnKz5RcVXHExvSuquNU/NnZdR/Y
   A==;
X-CSE-ConnectionGUID: lxKuPs4QTGiTPLbUiEnf9Q==
X-CSE-MsgGUID: +pW7QMRUSkCQ+6Yobw2/pA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10692311"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="10692311"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 18:45:15 -0700
X-CSE-ConnectionGUID: mT/Q3UGcSUejYskr7pmnHg==
X-CSE-MsgGUID: X5fdfTvqSXaULbUPjlhPUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="59207567"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 May 2024 18:45:13 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s49tG-0001D9-1e;
	Tue, 07 May 2024 01:45:10 +0000
Date: Tue, 7 May 2024 09:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1] Bluetooth: HCI: Remove HCI_AMP support
Message-ID: <202405070914.iRNrUUQb-lkp@intel.com>
References: <20240506223758.460710-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506223758.460710-1-luiz.dentz@gmail.com>

Hi Luiz,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240506]
[cannot apply to v6.9-rc7 v6.9-rc6 v6.9-rc5 linus/master v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-HCI-Remove-HCI_AMP-support/20240507-063936
base:   next-20240506
patch link:    https://lore.kernel.org/r/20240506223758.460710-1-luiz.dentz%40gmail.com
patch subject: [PATCH v1] Bluetooth: HCI: Remove HCI_AMP support
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240507/202405070914.iRNrUUQb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070914.iRNrUUQb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070914.iRNrUUQb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bluetooth/btmrvl_main.c:682:8: error: no member named 'dev_type' in 'struct hci_dev'
           hdev->dev_type = priv->btmrvl_dev.dev_type;
           ~~~~  ^
   1 error generated.


vim +682 drivers/bluetooth/btmrvl_main.c

132ff4e5fa8dfb Bing Zhao              2009-06-02  656  
64061607eab7cb Bing Zhao              2010-03-03  657  int btmrvl_register_hdev(struct btmrvl_private *priv)
132ff4e5fa8dfb Bing Zhao              2009-06-02  658  {
132ff4e5fa8dfb Bing Zhao              2009-06-02  659  	struct hci_dev *hdev = NULL;
70a7808b50b119 Abhishek Pandit-Subedi 2020-06-10  660  	struct btmrvl_sdio_card *card = priv->btmrvl_dev.card;
132ff4e5fa8dfb Bing Zhao              2009-06-02  661  	int ret;
132ff4e5fa8dfb Bing Zhao              2009-06-02  662  
132ff4e5fa8dfb Bing Zhao              2009-06-02  663  	hdev = hci_alloc_dev();
132ff4e5fa8dfb Bing Zhao              2009-06-02  664  	if (!hdev) {
132ff4e5fa8dfb Bing Zhao              2009-06-02  665  		BT_ERR("Can not allocate HCI device");
132ff4e5fa8dfb Bing Zhao              2009-06-02  666  		goto err_hdev;
132ff4e5fa8dfb Bing Zhao              2009-06-02  667  	}
132ff4e5fa8dfb Bing Zhao              2009-06-02  668  
132ff4e5fa8dfb Bing Zhao              2009-06-02  669  	priv->btmrvl_dev.hcidev = hdev;
155961e8001719 David Rheinsberg       2012-02-09  670  	hci_set_drvdata(hdev, priv);
132ff4e5fa8dfb Bing Zhao              2009-06-02  671  
c13854cef47510 Marcel Holtmann        2010-02-08  672  	hdev->bus   = HCI_SDIO;
132ff4e5fa8dfb Bing Zhao              2009-06-02  673  	hdev->open  = btmrvl_open;
132ff4e5fa8dfb Bing Zhao              2009-06-02  674  	hdev->close = btmrvl_close;
132ff4e5fa8dfb Bing Zhao              2009-06-02  675  	hdev->flush = btmrvl_flush;
132ff4e5fa8dfb Bing Zhao              2009-06-02  676  	hdev->send  = btmrvl_send_frame;
4b245722cabc6e Amitkumar Karwar       2013-10-01  677  	hdev->setup = btmrvl_setup;
27b869f59d5d98 Amitkumar Karwar       2014-07-18  678  	hdev->set_bdaddr = btmrvl_set_bdaddr;
4539ca67fe8ede Luiz Augusto von Dentz 2021-10-01  679  	hdev->wakeup = btmrvl_wakeup;
70a7808b50b119 Abhishek Pandit-Subedi 2020-06-10  680  	SET_HCIDEV_DEV(hdev, &card->func->dev);
64061607eab7cb Bing Zhao              2010-03-03  681  
f120c6b635a62d Bing Zhao              2010-03-03 @682  	hdev->dev_type = priv->btmrvl_dev.dev_type;
f120c6b635a62d Bing Zhao              2010-03-03  683  
132ff4e5fa8dfb Bing Zhao              2009-06-02  684  	ret = hci_register_dev(hdev);
132ff4e5fa8dfb Bing Zhao              2009-06-02  685  	if (ret < 0) {
132ff4e5fa8dfb Bing Zhao              2009-06-02  686  		BT_ERR("Can not register HCI device");
132ff4e5fa8dfb Bing Zhao              2009-06-02  687  		goto err_hci_register_dev;
132ff4e5fa8dfb Bing Zhao              2009-06-02  688  	}
132ff4e5fa8dfb Bing Zhao              2009-06-02  689  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
