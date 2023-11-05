Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285B2B64F;
	Sun,  5 Nov 2023 11:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aikaluv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699184557; x=1730720557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+dX/iZV55q7lbw3VJN/onDUW2tu1/vVyDH86TJCqVz0=;
  b=Aikaluv3rRVrtcnqGrnhQQXC/QHBQfnjtWZ1DBGBVK9FIDuNvgY3pho+
   Y6pRJks5rSoUskRzJlobwS8JsaYArAI563EztCK1Nz8PCjyNx9i7ZSrTv
   AJndrqFLqmBRvD8NwJaTgbGj6NowMr5BOCq4IkzPUf7crsROcxdEY6uer
   oLHGiBYRJnBWJ+bRN+Xd6UiNx+ktT3aZaYV9jSOzQFU1oOUbiRtizxCaf
   y5ibHImxDHGiInnWr3vR4z5scsGr3TIyf/WBmQaRq+/j4uryZAPUoomPc
   F9K/bJTaabRXSVFBSX/+9mFWgRYPJK/B0Ga3afcIF7rutvzoZy7ZYQ/jK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="369347586"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="369347586"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 03:41:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="762047913"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="762047913"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Nov 2023 03:41:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzbVp-0005NI-0o;
	Sun, 05 Nov 2023 11:41:53 +0000
Date: Sun, 5 Nov 2023 19:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:cex7 76/79] drivers/net/phy/qsfp.c:1229:3: warning: misleading
 indentation; statement is not part of the previous 'if'
Message-ID: <202311051950.gd99Mrfa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git cex7
head:   279d4f83510a7ff8fc1b449ff43195057e5429dd
commit: b7915b5f9ae73b600c44ce96346a0c246ea28ae3 [76/79] net: add qsfp support                              [*experimental*]
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231105/202311051950.gd99Mrfa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051950.gd99Mrfa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051950.gd99Mrfa-lkp@intel.com/

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
