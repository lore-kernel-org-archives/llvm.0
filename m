Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796CF17CD;
	Sun,  5 May 2024 04:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714881967; cv=none; b=kRt5OXNJE2yHga+W+tXMZ1UPrnDi6+aVgsiFTa/SIF4Ui5xLOuBYqFnGWTbGR+PafR3EvHUK8ucgb+UUS29fUOA+WusbJZewnMtqQ/suyWCWEhqG0++PNLlXyn5YOzne9vFpWtEFHPbqkI815AByEDt0WuabKZzHUPvB8rcxkSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714881967; c=relaxed/simple;
	bh=IZaP/EzgT+M0w0iEpCb0wDjd5Yzz6gqo+7u3Abyz/q8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rkpnuc3evuqzq/VZ1S+YVdBYQiPWkAFUbrEIhTFKygjhk0qAjriJLxA5ln07UVqD0Q5aXZAUikbfR+yK3RdoflrRlMA9gvFnbi9ye5Mqjnem40ArZTubdSmRpWLhZl5U+hwbureDf02GTiqfm8XRQQqEO9Cfm8d8mTMYcuzL/vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3ksSBoy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3ksSBoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714881966; x=1746417966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IZaP/EzgT+M0w0iEpCb0wDjd5Yzz6gqo+7u3Abyz/q8=;
  b=R3ksSBoyZt16z+IM5XpKBk7WqZ3xHpYXTqUYmTRBROe22BhCnx12v94J
   HvjV42fBp+dkerBl7Vodf40tyF/uj6gVGqK/hZHCLI3/DU+WBG2y0R/DU
   FZNHeQaJzeoeoHkCfELax2K6pxdBukUCHostEsMagFKJfHPCqXnPvsb/u
   BdJNS6iGyWawVK+5Jo98e9gdLQKjfBvqYFJ0rHKrx0VCAPhxA2vfX1Vs3
   JeizaqQbtSrKsISaYvGk476HEk/kudDjfEQ6mYUAUIF71r9FC0QECTpLc
   CH+mgiKyW7BaGDVvlgjPGIbD5psv86Oc83VTvR8tJaVMqpgi5wworT4rC
   A==;
X-CSE-ConnectionGUID: hY7cizh8TsWXeBvzHvI30Q==
X-CSE-MsgGUID: BpEZ1txRT1C+EDHH4YEpJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10777668"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="10777668"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 21:06:05 -0700
X-CSE-ConnectionGUID: VNNyuvW4TtyWhnOXlkm8UA==
X-CSE-MsgGUID: 9rHv1Na0Tsego51I8uPDBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="28240810"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 May 2024 21:06:03 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3T8T-000DPY-02;
	Sun, 05 May 2024 04:06:01 +0000
Date: Sun, 5 May 2024 12:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Stephen Boyd <sboyd@kernel.org>
Subject: [rmk:for-next 35/36] drivers/clk/clkdev.c:195:9: error: incompatible
 pointer types assigning to 'va_list *' (aka '__builtin_va_list *') from
 '__va_list_tag **' (aka 'struct __va_list_tag **')
Message-ID: <202405051144.MvurG5wM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git for-next
head:   15b7967c1ef112c0f4179ed4e9a537e84388210b
commit: 5d998425e37b10e05393941e7a8fbefd3d1d4101 [35/36] clkdev: report over-sized strings when creating clkdev entries
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240505/202405051144.MvurG5wM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405051144.MvurG5wM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405051144.MvurG5wM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/clkdev.c:195:9: error: incompatible pointer types assigning to 'va_list *' (aka '__builtin_va_list *') from '__va_list_tag **' (aka 'struct __va_list_tag **') [-Werror,-Wincompatible-pointer-types]
     195 |         fmt.va = &ap;
         |                ^ ~~~
   1 error generated.


vim +195 drivers/clk/clkdev.c

   155	
   156	static struct clk_lookup * __ref
   157	vclkdev_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
   158		va_list ap)
   159	{
   160		struct clk_lookup_alloc *cla;
   161		struct va_format fmt;
   162		const char *failure;
   163		size_t max_size;
   164		ssize_t res;
   165	
   166		cla = kzalloc(sizeof(*cla), GFP_KERNEL);
   167		if (!cla)
   168			return NULL;
   169	
   170		cla->cl.clk_hw = hw;
   171		if (con_id) {
   172			res = strscpy(cla->con_id, con_id, sizeof(cla->con_id));
   173			if (res < 0) {
   174				max_size = sizeof(cla->con_id);
   175				failure = "connection";
   176				goto fail;
   177			}
   178			cla->cl.con_id = cla->con_id;
   179		}
   180	
   181		if (dev_fmt) {
   182			res = vsnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
   183			if (res >= sizeof(cla->dev_id)) {
   184				max_size = sizeof(cla->dev_id);
   185				failure = "device";
   186				goto fail;
   187			}
   188			cla->cl.dev_id = cla->dev_id;
   189		}
   190	
   191		return &cla->cl;
   192	
   193	fail:
   194		fmt.fmt = dev_fmt;
 > 195		fmt.va = &ap;
   196		pr_err("%pV:%s: %s ID is greater than %zu\n",
   197		       &fmt, con_id, failure, max_size);
   198		kfree(cla);
   199		return NULL;
   200	}
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
