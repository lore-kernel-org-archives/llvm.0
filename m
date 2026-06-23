Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3968E379C2F;
	Tue, 23 Jun 2026 01:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179644; cv=none; b=L1dDSbEu2fD8kj63xz6pJe1f9pxHxIh168hUHOGuhKXGobY4bvs18QyVFvojIzSzImVDPQVdZ8Une7CA3UAf+C4pANF4Y48ZD+FYYRkWezKDvNBoIvLWHklvALfby3GnmywYj0yrVh7mOk7FyAHS6g6JkNghe7GAr+X2HQ0B+MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179644; c=relaxed/simple;
	bh=SB4F6Bc2XnC4HIXzL0L4Kkoh+SgCoipOwPExzEasRv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RCldfhnZoDU2ZeRUXBl+q2DL+fZvG+IPvwJeNzoLGu4brRwgcqYypP6b1AMAiLtJ7YYmrT634WSd1dFEaOI/hMl7qTQ1dwmKCHJplRBY4WJ2ppSih2j0RlWkRN5NhzWNl2h/o+GFkfmaXKTHH8hhSoZF4CAcLOf8pH5DA9Wcsv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gw+QcDjs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gw+QcDjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782179643; x=1813715643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SB4F6Bc2XnC4HIXzL0L4Kkoh+SgCoipOwPExzEasRv0=;
  b=Gw+QcDjs6Uhp4FxvDut9UTflhcffvG8MQGcrTxkJY55td2B0Wc6O6FbF
   WlPPeZlXCxpFjjCTzTxRYFmz8zfqV7afJL6FDs1yyBT3oGIgBuUIX89UP
   U82qtKsCm/XgniEQEIJNKJeOPPTHzZbZEy6yfM9BMwfxkwkC9sBnAT/Jp
   gpTrjHcKjE6U9LqJ3zX784J4bHoPtUd+zJbob9RPVJXA/poqD49vbgYJp
   PeMzeWzFWgLT61HSKeNRTiGCw46imIYq/2VHiCPm0AU/zl2R8nvXmVv+y
   PH9ZrmfvekmM2/+opEXhhEDdJvonr6LRer4kE2P05ZjZ2emTiU29Mj4AY
   g==;
X-CSE-ConnectionGUID: P/WxgQf5Sg27lfil3ubjOg==
X-CSE-MsgGUID: pLCdIz+iTZibHH/x9qX6LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108459526"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="108459526"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 18:54:02 -0700
X-CSE-ConnectionGUID: M7eyI3erSraDHYSTbN6sNw==
X-CSE-MsgGUID: +r++EK5LSFCgV4Xu2vhCTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="273442297"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 18:54:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbqKs-0000000029J-3ZUR;
	Tue, 23 Jun 2026 01:53:58 +0000
Date: Tue, 23 Jun 2026 09:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:mfd 123/124]
 drivers/reset/reset-zte-zx297520v3.c:204:46: warning: cast to smaller integer
 type 'unsigned int' from 'struct device_node *'
Message-ID: <202606230924.t2fbL1ve-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel mfd
head:   c94d760b3ed42a18ecbae9e63d7010c770a8c042
commit: 64dd9c56a2aaf035cb2702b7d20cf6bf7901466b [123/124] mfd 2
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230924.t2fbL1ve-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230924.t2fbL1ve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230924.t2fbL1ve-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/reset-zte-zx297520v3.c:204:46: warning: cast to smaller integer type 'unsigned int' from 'struct device_node *' [-Wpointer-to-int-cast]
     204 |         dev_err(&pdev->dev, "my of node: 0x%08x\n", (unsigned int)pdev->dev.of_node);
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/reset/reset-zte-zx297520v3.c:205:50: warning: cast to smaller integer type 'unsigned int' from 'struct device_node *' [-Wpointer-to-int-cast]
     205 |         dev_err(&pdev->dev, "parent of node: 0x%08x\n", (unsigned int)pdev->dev.parent->of_node);
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/reset/reset-zte-zx297520v3.c:219:46: warning: cast to smaller integer type 'unsigned int' from 'struct device_node *' [-Wpointer-to-int-cast]
     219 |         dev_err(&pdev->dev, "my of node: 0x%08x\n", (unsigned int)pdev->dev.of_node);
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/reset/reset-zte-zx297520v3.c:220:50: warning: cast to smaller integer type 'unsigned int' from 'struct device_node *' [-Wpointer-to-int-cast]
     220 |         dev_err(&pdev->dev, "parent of node: 0x%08x\n", (unsigned int)pdev->dev.parent->of_node);
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   4 warnings generated.


vim +204 drivers/reset/reset-zte-zx297520v3.c

   201	
   202	static int reset_zx297520v3_top_probe(struct platform_device *pdev)
   203	{
 > 204		dev_err(&pdev->dev, "my of node: 0x%08x\n", (unsigned int)pdev->dev.of_node);
   205		dev_err(&pdev->dev, "parent of node: 0x%08x\n", (unsigned int)pdev->dev.parent->of_node);
   206		return reset_zx297520v3_common_probe(&pdev->dev, pdev->dev.parent->of_node,
   207						     &zx297520v3_top_info);
   208	}
   209	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
