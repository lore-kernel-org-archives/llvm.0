Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A2E1E102E;
	Mon, 18 Nov 2024 18:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731956116; cv=none; b=UkeqaOt+XapgisqPwigK3GuQgKqh4/vJwlsPUH6aL5tvq5Rn+47pNXrvzuhNORm/yBpJuIg/OEUzWy5HAb6MzhQblWsjUSQmb6Yit3KyA8cV/gbYu8PDbZWi/1VoT0wCfgZpH9qsRR2klOClg6pZDsFY2IBwauWsPwLQufRn2F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731956116; c=relaxed/simple;
	bh=EvRhSBNYc55EKAxT72wNHpNHuSnYhb1S5kCwu92RAMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dUyVnewsQRYzn7d3Y2K682/xw3QpClltiFhTgEvIPKoDQKVzCapmY/1jalNHvX7/sJ0yUE8k/Dp2qsdfD3KXYpd01z5RRKETEYyINFvtXZbcn+v8RyM8D2G74dTI3y2CgMZkvmFBK3UbpFp0W+Fm1mvOjzJhSTIEh6IBc3b2UA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQ74UD6X; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQ74UD6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731956115; x=1763492115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EvRhSBNYc55EKAxT72wNHpNHuSnYhb1S5kCwu92RAMI=;
  b=gQ74UD6XCC33tPm5EZ2hZ7Sdhe3AA/M//hQ4FFkB1kyj2g1rUsZRrPHU
   m/lvf12SjMDr1uSUXOZzbg5KOVSI0F8QxeZvsbZBzn2qeHrnL19idYubD
   hPm0rK56VcOjy5EtKPuIxioSnNCzymO/0KhuxvkzoblDbGzkx+BLIroWZ
   z+jF5XtntcKaidb/y82NOHSWcg/d6UjxEPRq0MsaLInHoFWrmOTWXOdAp
   66c5MaT0Q+In73RqecxCLA4YKCNOWvDq+YXb4UtnLrr5z3aeZKBdTwCCs
   ABPgu5G8r64j0v75gWIMEuCIphPfe2Od2uQR2Py1FH3MQE2iuXKaI4D1c
   Q==;
X-CSE-ConnectionGUID: sbI2X2DFS/aVLiSZuf884g==
X-CSE-MsgGUID: fZLnAyA0R+68XEikEtE1/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31303536"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="31303536"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 10:55:14 -0800
X-CSE-ConnectionGUID: cvk7YwdkQQGWRYJkRNO6Bw==
X-CSE-MsgGUID: zC6UJiB4SW+zX9Sku3pzvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="126851312"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2024 10:55:13 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD6tx-0002bF-2R;
	Mon, 18 Nov 2024 18:55:09 +0000
Date: Tue, 19 Nov 2024 02:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Stephen Boyd <sboyd@kernel.org>,
	David Lechner <david@lechnology.com>
Subject: [linux-next:master 11416/12140] drivers/clk/davinci/psc.c:281:10:
 error: incompatible integer to pointer conversion returning 'int' from a
 function with result type 'struct davinci_lpsc_clk *'
Message-ID: <202411190217.UaeAgJnO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae58226b89ac0cffa05ba7357733776542e40216
commit: 48ce11b9099800eee6fb6dc386374096f2e6564b [11416/12140] clk: davinci: Add NULL check in davinci_lpsc_clk_register
config: arm-randconfig-003-20241119 (https://download.01.org/0day-ci/archive/20241119/202411190217.UaeAgJnO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190217.UaeAgJnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190217.UaeAgJnO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/davinci/psc.c:281:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct davinci_lpsc_clk *' [-Wint-conversion]
     281 |                 return -ENOMEM;
         |                        ^~~~~~~
   1 error generated.


vim +281 drivers/clk/davinci/psc.c

   221	
   222	/**
   223	 * davinci_lpsc_clk_register - register LPSC clock
   224	 * @dev: the clocks's device or NULL
   225	 * @name: name of this clock
   226	 * @parent_name: name of clock's parent
   227	 * @regmap: PSC MMIO region
   228	 * @md: local PSC number
   229	 * @pd: power domain
   230	 * @flags: LPSC_* flags
   231	 */
   232	static struct davinci_lpsc_clk *
   233	davinci_lpsc_clk_register(struct device *dev, const char *name,
   234				  const char *parent_name, struct regmap *regmap,
   235				  u32 md, u32 pd, u32 flags)
   236	{
   237		struct clk_init_data init;
   238		struct davinci_lpsc_clk *lpsc;
   239		int ret;
   240		bool is_on;
   241	
   242		lpsc = kzalloc(sizeof(*lpsc), GFP_KERNEL);
   243		if (!lpsc)
   244			return ERR_PTR(-ENOMEM);
   245	
   246		init.name = name;
   247		init.ops = &davinci_lpsc_clk_ops;
   248		init.parent_names = (parent_name ? &parent_name : NULL);
   249		init.num_parents = (parent_name ? 1 : 0);
   250		init.flags = 0;
   251	
   252		if (flags & LPSC_ALWAYS_ENABLED)
   253			init.flags |= CLK_IS_CRITICAL;
   254	
   255		if (flags & LPSC_SET_RATE_PARENT)
   256			init.flags |= CLK_SET_RATE_PARENT;
   257	
   258		lpsc->dev = dev;
   259		lpsc->regmap = regmap;
   260		lpsc->hw.init = &init;
   261		lpsc->md = md;
   262		lpsc->pd = pd;
   263		lpsc->flags = flags;
   264	
   265		ret = clk_hw_register(dev, &lpsc->hw);
   266		if (ret < 0) {
   267			kfree(lpsc);
   268			return ERR_PTR(ret);
   269		}
   270	
   271		/* for now, genpd is only registered when using device-tree */
   272		if (!dev || !dev->of_node)
   273			return lpsc;
   274	
   275		/* genpd attach needs a way to look up this clock */
   276		ret = clk_hw_register_clkdev(&lpsc->hw, name, best_dev_name(dev));
   277	
   278		lpsc->pm_domain.name = devm_kasprintf(dev, GFP_KERNEL, "%s: %s",
   279						      best_dev_name(dev), name);
   280		if (!lpsc->pm_domain.name)
 > 281			return -ENOMEM;
   282	
   283		lpsc->pm_domain.attach_dev = davinci_psc_genpd_attach_dev;
   284		lpsc->pm_domain.detach_dev = davinci_psc_genpd_detach_dev;
   285		lpsc->pm_domain.flags = GENPD_FLAG_PM_CLK;
   286	
   287		is_on = davinci_lpsc_clk_is_enabled(&lpsc->hw);
   288		pm_genpd_init(&lpsc->pm_domain, NULL, is_on);
   289	
   290		return lpsc;
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
