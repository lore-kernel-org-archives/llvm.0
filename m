Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FFB2DF3D1;
	Thu, 13 Nov 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763027775; cv=none; b=e/2QMajBkkukVB2kv6AkWqYbFVBxrNdzpEGRjQ5SvulK9HFRZmz/CHAPJU7G6BdrwOfzYGbQHkPNrdDfhfavl7F7PXM42CDdDou6s8/p0QpxN8kNo5yiTQMARZI7GDV5VFo7CylJ8sJVKZa+T8cTtVeMVW9yW0cRd4XAih6uC8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763027775; c=relaxed/simple;
	bh=krUX7hqpzRIL/jGpRRFrUeqSxfbxEobmiKcyt6cbc6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+vOzbYDmfSEg1bA/9e3ezKNv7/gpEmutHNJVpPM+kKDjGEFT+lfBSuPBAhUu2MHkikV7HSUFH5LFga7yTQSgZd4+cPEX74i9+rwFMfxnaxe8gL7rHDViv/LHRFCgn8R5oW4cxZA66WIKpL/xgTRD/FHPDfsr4D7f/uaWGE3PgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1GYBK5t; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1GYBK5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763027774; x=1794563774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=krUX7hqpzRIL/jGpRRFrUeqSxfbxEobmiKcyt6cbc6k=;
  b=H1GYBK5trg8k7QJVZuJK9APMQtLRdR9PuPgosYyvAu0UdSSkclo1ueLk
   SOPBiLEuuhKryhUom27jPNqaAWnANTxwR+w8hxsPRdmw8IcW7DSW14w8k
   ZXhpA2bzf34IguTmKHf92xU6IUt8VFZvLgWM4E7vXXIYlD7qvjox/Br1k
   HjdIUfEPvUGoyHzngaveUzTtDLPGD2pYOQMHtNs79m+3ytCahFlhiNR2C
   sPa9zFIUz2E0AdRQJfvo84OiLvk0N8jV5amcRCc0UPF9OYLo2LwMy8iAi
   c2jAugzQaP/zXsZ89z9NfxTWJUReDvm7Y9woz0xOK2MuUL1lphAh56y/5
   w==;
X-CSE-ConnectionGUID: tUjaYrNeRmWqyGKcjTpm4A==
X-CSE-MsgGUID: ocQOmO8vThGsAZ0az5vOwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="67703480"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="67703480"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 01:55:52 -0800
X-CSE-ConnectionGUID: RFR58RY6QvKrhugcWkAumA==
X-CSE-MsgGUID: 3IOmhhlLTtmwgvPAKfxLrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="194442446"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2025 01:55:50 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJU3Q-00058j-1R;
	Thu, 13 Nov 2025 09:55:48 +0000
Date: Thu, 13 Nov 2025 17:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Masashi Ozaki <masashi.ozaki.te@renesas.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc5-2025-11-12-x5h-ironhide 28/39]
 drivers/mailbox/rcar-mfis-mailbox.c:153:32: warning: converting the result
 of '<<' to a boolean always evaluates to true
Message-ID: <202511131723.vRI1WI6U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc5-2025-11-12-x5h-ironhide
head:   6aecb5521a24ea1461406564f89f4449840421dc
commit: b5e2040ad820fcafdfe92e964efde15f4e8a625a [28/39] mailbox: renesas: Support MFIS mailbox driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251113/202511131723.vRI1WI6U-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131723.vRI1WI6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131723.vRI1WI6U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/rcar-mfis-mailbox.c:153:32: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
     153 |         if (!mfis_info_flag_has(info, MFIS_INFO_FLAGS_IRQ_NO_SUFFIX))
         |                                       ^
   drivers/mailbox/rcar-mfis-mailbox.c:29:42: note: expanded from macro 'MFIS_INFO_FLAGS_IRQ_NO_SUFFIX'
      29 | #define MFIS_INFO_FLAGS_IRQ_NO_SUFFIX   (1 << 0)
         |                                            ^
   1 warning generated.


vim +153 drivers/mailbox/rcar-mfis-mailbox.c

   143	
   144	#define IRQNAME_NUM 8
   145	static int mfis_init_mchan(struct device_node *node, struct device_node *ch,
   146				   const struct mfis_info *info, struct mfis_chan *mchan_top,
   147				   int idx, int n, int chan, const char **dir)
   148	{
   149		struct mfis_chan *mchan = mchan_top + (idx * NUM_DIRECTION) + n;
   150		char irqname[IRQNAME_NUM];
   151		char suffix = 0;
   152	
 > 153		if (!mfis_info_flag_has(info, MFIS_INFO_FLAGS_IRQ_NO_SUFFIX))
   154			suffix = mfis_irq_direction_suffix[n];
   155	
   156		/* ex) "ch0" or "ch0a" */
   157		scnprintf(irqname, IRQNAME_NUM, "ch%d%c", chan, suffix);
   158	
   159		/* use interrupt if it was RX */
   160		if (strncmp(dir[n], "rx", 2) == 0) {
   161			int irq = of_irq_get_byname(node, irqname);
   162	
   163			if (irq < 0)
   164				return irq;
   165	
   166			mchan->irq = irq;
   167		}
   168	
   169		mchan->chan = chan;
   170		mchan->ctrl = n;
   171	
   172		return 0;
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
