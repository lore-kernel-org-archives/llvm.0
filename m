Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D97283FF1;
	Tue, 30 Sep 2025 20:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759264601; cv=none; b=EQSyb0wn7t/4GdXNjnpbMPumHbJNmjQmgNlQ1Disy+EPxNMUk9E5XkiE2l6EtdExCYIBg9+thi4s958vn7KDOS0U0bq8hjhJ2L2Hy3O8jEpsfKQ+imABc/Lpe8UJYty/jyFpwWvK5wzzHVeV0aZA2v4XeCaVzExJNXqDzKRcHGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759264601; c=relaxed/simple;
	bh=57SjqRtU8zsQMebYTlCwu4Olnzupds+OK54BUKDJeQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rB+W0XSMMmz0A/BvH/jv6FzkHDPVjmVJ414vI8GVdullamT/ornEV6sNYC9kQHjsAQRxN8Gkw69rDQIzZxvMZEfkKJAxT1QMAIPrdJX7SwnL8KWc6Hw20sbZS48Y0N9DbBshc8j2pBQ66F4Mi+lx3cJrO+/zToyXww5Rb9NZ3Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5sSIt+Z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5sSIt+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759264599; x=1790800599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=57SjqRtU8zsQMebYTlCwu4Olnzupds+OK54BUKDJeQU=;
  b=b5sSIt+ZIbJpmYmJauTcrY/0SrLnFIlbY5gjOwKUuiDavmqryLsEVMv8
   c2Ofyc+AVNlxo2r9SxVeG4/+lMb9VM4Ka6l70tFfqhGCaj13ZMgpdBTIc
   JrGMaIwnXfPadLqnAquOHcDVHU89I5pAoYAjWiJ9wyH+zYt7Lg2bT1oIk
   UDRj1i4goMbo80LQW5AZZuhNNwmzAWLLoskXtGu/hxu7OknemN2Nn8law
   wrIo5KFVIQ1kYl88+q7t+SZ8QRCzjYtqjGZ3M49uFeI3lyHiX4VKdV7a2
   ILjRHkDXWAZiB24+4vYBwQh+5GNcDkuQGXEv+4pWx0QN8SW0lFnHH1geR
   Q==;
X-CSE-ConnectionGUID: 8MaOIxyEQVeCjI8q5lF2UA==
X-CSE-MsgGUID: ZInixDZGSXi/3JvLugf8xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72892531"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="72892531"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 13:36:39 -0700
X-CSE-ConnectionGUID: u7TMxt/tRuu1m/FvlCrp8Q==
X-CSE-MsgGUID: x7ZZANBkQK+dJx6Xu1L3sA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2025 13:36:38 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3h5Q-0002Tb-09;
	Tue, 30 Sep 2025 20:36:36 +0000
Date: Wed, 1 Oct 2025 04:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:cex7 170/173] drivers/net/phy/qsfp.c:1229:3: warning:
 misleading indentation; statement is not part of the previous 'if'
Message-ID: <202510010457.FGDu3A6h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm cex7
head:   2371f18181318a9492b01d8b312a9ee85f47e8c2
commit: f958ddacf4e1c4aa03ad01b6abef03501217da1c [170/173] net: add qsfp support                              [*experimental*]
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251001/202510010457.FGDu3A6h-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510010457.FGDu3A6h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510010457.FGDu3A6h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/qsfp.c:1229:3: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
    1229 |                 qsfp_sm_ins_next(qsfp, SFP_MOD_PRESENT, 0);
         |                 ^
   drivers/net/phy/qsfp.c:1222:2: note: previous statement is here
    1222 |         if (!qsfp->gpio_irq[GPIO_INTL])
         |         ^
   1 warning generated.


vim +/if +1229 drivers/net/phy/qsfp.c

  1215	
  1216		if (qsfp->sm_dev_state == SFP_DEV_DETACHED) {
  1217			qsfp_sm_ins_next(qsfp, SFP_MOD_WATTACH, 0);
  1218			return;
  1219		}
  1220	
  1221		// Start the poller if there is no interrupt support if not running
  1222		if (!qsfp->gpio_irq[GPIO_INTL])
  1223			queue_delayed_work(system_wq, &qsfp->poll, poll_jiffies);
  1224	
  1225	//	ret = sfp_module_insert(qsfp->sfp_bus, &id);
  1226	//	if (ret < 0)
  1227	//		qsfp_sm_ins_next(qsfp, SFP_MOD_ERROR, 0);
  1228	//	else
> 1229			qsfp_sm_ins_next(qsfp, SFP_MOD_PRESENT, 0);
  1230	}
  1231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
