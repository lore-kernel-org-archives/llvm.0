Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30542F5A3D;
	Tue, 16 Sep 2025 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758042631; cv=none; b=MbCdmZ5X/6tsB7RfqehtBLLY6a6FM+BstJpDjd6X4BpCo1dD1DI7r/vbnlz7UyM1fwKsMfjseyYDW4qjei2p/bojRG4aDBnRX+25kWhiWNsfExL5S9fknJd07lc0wCQWi76Twxc6ZjaojvhqOhqmnGBj/LKdSNs8xyKQTe/+fdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758042631; c=relaxed/simple;
	bh=LnekTPDizi0xrwz+kYUffE98ZP8J9Ep2VPWnTPE/A70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MshO6Ki2dORCZCAQjx8nkxtkvOpUjpv5IERSKFnZxEkT3lUxG0rztreNwQm+q/Gf91FeqyZFx/ppKnTBc0/9HPa2nfEJ89/udk+2Lvrs7FLt5MJdUajIg3H4odExN/4oatgHBk1vqLABl1a4VIxkBHRQHq4JiuM1V8ApK4K6QE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5cluEgJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5cluEgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758042630; x=1789578630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LnekTPDizi0xrwz+kYUffE98ZP8J9Ep2VPWnTPE/A70=;
  b=L5cluEgJ2B5I9ndH8jcKwWccuoRXg0NkfJUU5rr8KtkNbKWuMdP6/Z8y
   OWNHFkdoKY24rM2q5qVdp3sgIKwoMmMdQ/OmKgmec8InB2tlTXWN3X+ci
   +2qBqTP3vfCtxl+DPr0YR5wJJn4OQpxJ6qC3aaXKGlE5LMC535YflDnjd
   OhuOUhWcwFQL7qwCSNNx1QwRa9cV4KnRPX/7rQZihFt5CItzCsLwpmxKA
   eHOhIKhK5ftJ7GkQ4H9k3ye4C8OyaqqtE41etwO7hfXUFC30MadTE31WQ
   fRRWzo968rhtOfr7c8RNlUih5X12ysG0p/ZCB95TQwaWSk70c9c2h7kIP
   g==;
X-CSE-ConnectionGUID: yqHRPH6YSlSqHoeqvJTB0Q==
X-CSE-MsgGUID: f9ai/x8FTt+948jJk4IvFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="70956952"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="70956952"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 10:10:29 -0700
X-CSE-ConnectionGUID: uHWo4kXWS7CPiqGLZc6MJw==
X-CSE-MsgGUID: UzWnjKnaSkSSU/YYiJ6tRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="180257110"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2025 10:10:28 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyZCD-0000YH-39;
	Tue, 16 Sep 2025 17:10:25 +0000
Date: Wed, 17 Sep 2025 01:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8604/9696] drivers/firewire/core-card.c:552:32:
 warning: overflow in expression; result is -1'179'869'184 with type 'long'
Message-ID: <202509170136.b5ZHaNAV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   05af764719214d6568adb55c8749dec295228da8
commit: 379b870c28c6a615a101df7986eba70fea99eff7 [8604/9696] firewire: core: use helper macros instead of direct access to HZ
config: hexagon-randconfig-001-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170136.b5ZHaNAV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 65ad21d730d25789454d18e811f8ff5db79cb5d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170136.b5ZHaNAV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170136.b5ZHaNAV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firewire/core-card.c:552:32: warning: overflow in expression; result is -1'179'869'184 with type 'long' [-Winteger-overflow]
     552 |         card->split_timeout_jiffies = isoc_cycles_to_jiffies(DEFAULT_SPLIT_TIMEOUT);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core.h:33:64: note: expanded from macro 'isoc_cycles_to_jiffies'
      33 | #define isoc_cycles_to_jiffies(cycles)  usecs_to_jiffies(cycles * USEC_PER_SEC / 8000)
         |                                                          ~~~~~~~^~~~~~~~~~~~~~
   1 warning generated.


vim +552 drivers/firewire/core-card.c

   537	
   538	void fw_card_initialize(struct fw_card *card,
   539				const struct fw_card_driver *driver,
   540				struct device *device)
   541	{
   542		static atomic_t index = ATOMIC_INIT(-1);
   543	
   544		card->index = atomic_inc_return(&index);
   545		card->driver = driver;
   546		card->device = device;
   547		card->current_tlabel = 0;
   548		card->tlabel_mask = 0;
   549		card->split_timeout_hi = DEFAULT_SPLIT_TIMEOUT / 8000;
   550		card->split_timeout_lo = (DEFAULT_SPLIT_TIMEOUT % 8000) << 19;
   551		card->split_timeout_cycles = DEFAULT_SPLIT_TIMEOUT;
 > 552		card->split_timeout_jiffies = isoc_cycles_to_jiffies(DEFAULT_SPLIT_TIMEOUT);
   553		card->color = 0;
   554		card->broadcast_channel = BROADCAST_CHANNEL_INITIAL;
   555	
   556		kref_init(&card->kref);
   557		init_completion(&card->done);
   558		INIT_LIST_HEAD(&card->transaction_list);
   559		INIT_LIST_HEAD(&card->phy_receiver_list);
   560		spin_lock_init(&card->lock);
   561	
   562		card->local_node = NULL;
   563	
   564		INIT_DELAYED_WORK(&card->br_work, br_work);
   565		INIT_DELAYED_WORK(&card->bm_work, bm_work);
   566	}
   567	EXPORT_SYMBOL(fw_card_initialize);
   568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
