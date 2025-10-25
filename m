Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EE22F49E4;
	Sat, 25 Oct 2025 11:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761392341; cv=none; b=TKVYiZq8bWfAx1CEofAy0phKSaUgON6D9b8bLEHm8G12bWREdDSjq2HNsZSZkx/aA3YMIctsEfrvphgXCT7jFgnEU2iUkL2xIpSuEAuo+Clt57Vqsk/D3eCfz9QLr19adlxnKpgS2qu1cW90NlDYEFnNn4C6Sd8i6C4qxQB1AlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761392341; c=relaxed/simple;
	bh=51cgBOlVttvu8BBasQzxGX6S4hZd7Wp/4lDeD+RggkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1Xoa5A36E2aaR4u2Y7QVn0Ju2SSNmfhWNlUtmtK2rJFQmeqDGm0lQ8+xULsiW6OWh5tmut3kl+KFNsxyxxJSUzL1mSmxXxt14q81kcdRw67B1hi9KRwkdsihgeqlbK+zs1+epird3esiJk36nY7vITUkPwxcq7cDI2EPk5KWPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NF/0k8VD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NF/0k8VD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761392339; x=1792928339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=51cgBOlVttvu8BBasQzxGX6S4hZd7Wp/4lDeD+RggkQ=;
  b=NF/0k8VDzHlEBb/Thnq775DaFVtS8G8cV8atdJS7Bu6LzN84sNMLaZTw
   fN/vjLkLOmhGg6FN0pQd/Dq59k0P+8RcUVrJVTv6GAOlIOdJGdQKGzGuu
   D3uzdkN72KJc5asghrdOLZ1bozEGrBcthoyb/r8yQrS9sjTWsp/lN3Wpj
   aKYkAeEQEfpc/kWogB0pW8ictP1g7QhGXZ7KVGVXL2/LSutnyihSVnVeW
   qKXYF9N95VUeRgxfr4v7fiDA3NQCy/Fo+usOrObQn183NNy/RPU0xTtLD
   fnoyXZQG+rCG8HMs3e+KXVd0/B/FVJOL7C0cH9r0N29kHFS8im7F8PbYC
   g==;
X-CSE-ConnectionGUID: 00FLxFhJTOKcr4K6MXSabQ==
X-CSE-MsgGUID: Ha/NekPIQ1OWoWExqeJVvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67414630"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="67414630"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 04:38:58 -0700
X-CSE-ConnectionGUID: cDkymQBgR+6hiAQ8hU8pUA==
X-CSE-MsgGUID: R8zJzG5QTHq+vv5D3rejkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="188944479"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Oct 2025 04:38:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCcbm-000FHx-0X;
	Sat, 25 Oct 2025 11:38:54 +0000
Date: Sat, 25 Oct 2025 19:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Masashi Ozaki <masashi.ozaki.te@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc2-2025-10-24-x5h-ironhide 7/21]
 drivers/mailbox/rcar-mfis-mailbox.c:96:45: warning: variable 'i' is
 uninitialized when used here
Message-ID: <202510251914.LDVp1dub-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc2-2025-10-24-x5h-ironhide
head:   fe21d488fba0b6bcb0416fab7cf246e35592ce10
commit: 2a60dfb617c1f4f3055ffca329bbb1185e95cd5b [7/21] mailbox: renesas: Support MFIS mailbox driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251025/202510251914.LDVp1dub-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251914.LDVp1dub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251914.LDVp1dub-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/rcar-mfis-mailbox.c:96:45: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
      96 |         reg = devm_platform_ioremap_resource(pdev, i);
         |                                                    ^
   drivers/mailbox/rcar-mfis-mailbox.c:86:23: note: initialize the variable 'i' to silence this warning
      86 |         int ret, count = 2, i;
         |                              ^
         |                               = 0
   1 warning generated.


vim +/i +96 drivers/mailbox/rcar-mfis-mailbox.c

    80	
    81	static int mfis_mbox_probe(struct platform_device *pdev)
    82	{
    83		struct device *dev = &pdev->dev;
    84		struct mbox_controller *mbox;
    85		void __iomem *reg;
    86		int ret, count = 2, i;
    87	
    88		mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
    89		if (!mbox)
    90			return -ENOMEM;
    91	
    92		mbox->chans = devm_kcalloc(dev, count, sizeof(*mbox->chans), GFP_KERNEL);
    93		if (!mbox->chans)
    94			return -ENOMEM;
    95	
  > 96		reg = devm_platform_ioremap_resource(pdev, i);
    97		if (IS_ERR(reg))
    98			return PTR_ERR(reg);
    99	
   100		for (i = 0; i < count; i++) {
   101			mbox->chans[i].mbox	= mbox;
   102			mbox->chans[i].con_priv	= reg + ((1 - i) * 4);
   103		}
   104	
   105		mbox->txdone_poll	= true;
   106		mbox->txdone_irq	= false;
   107		mbox->txpoll_period	= 1;
   108		mbox->num_chans		= count;
   109		mbox->ops		= &mfis_chan_ops;
   110		mbox->dev		= dev;
   111	
   112		ret = mbox_controller_register(mbox);
   113		if (ret)
   114			return ret;
   115	
   116		platform_set_drvdata(pdev, mbox);
   117		dev_info(dev, "MFIS mailbox is probed\n");
   118	
   119		return 0;
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
