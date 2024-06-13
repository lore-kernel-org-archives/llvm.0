Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8449413248E;
	Thu, 13 Jun 2024 03:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718249868; cv=none; b=iUpmUPQPCKnsckq4QkTTkzSWq8EpadgGomQcaCOjnNiLa9mp8HZt5oHDZvenroBadl5j4SboAbHiw+h8BP3w4XrlcSSTF5yOeLsK+s1i7drw5HcaB81bOPU0BWSPKPOdh21UgzO0K6TQUzW6PwQ6sOGPbWE+fsxYfsItEPN6V98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718249868; c=relaxed/simple;
	bh=kPEhkOUcSGVwJfLzdaBpN4bM804cuDKPuTgf/Ztdop8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nBvdoXy8mA+v4j+o/mKmDsv3rffk9nwKooaOCP79fb+zhgZ6VfkhNACxp/oD4f6sKtkPXP9sPY3fmjfGXw9V+620HCCNH1KDRLFl7+XH1V5tHQJhSL30sZYmXMYhtToqTHzPXWBXBvze46wGlDkArBqytR7/AufnQfQf8rEz9kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZA9vI0sU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZA9vI0sU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718249867; x=1749785867;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kPEhkOUcSGVwJfLzdaBpN4bM804cuDKPuTgf/Ztdop8=;
  b=ZA9vI0sUygdwLZF6qQLQhZTfqzjQjb5rcINukMeFlneE1uYwCKVtI4Fc
   ip31ymAzhMZvHKbUVtpq70IGwVjxt8euvhvlDiywI93MOyKMT6Xx1r6Ie
   4gFSaezMVuAvg1AA1RD9aUCsogOr8XDXNFiUgYwOf5opCxt0xtHVboQbr
   E9K6k8PfJv7U5mQ1J1wFKfKpNUtznuZh9O8u7MuGIu28uaIBE0nFL3RQb
   OPLU0oO+eTivYvudb01tWb8MgFY2+70tKpWQ4V7BhxCNE+4mJtWbtKYFw
   saKka6kzSMnhXa/EaI6XQ1xC6M7KqFTIyTJ+QfryDsWn9cYMU7vCvcvY8
   w==;
X-CSE-ConnectionGUID: hG/uZW9pSzCTi5Fq/QuREQ==
X-CSE-MsgGUID: fxsOI/0QTea4EwAZzxjOcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18901594"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="18901594"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 20:37:31 -0700
X-CSE-ConnectionGUID: ef/vEuE+TjGfauXjydOqVw==
X-CSE-MsgGUID: LvP6GHs5TYuAW1anx0RjrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40470097"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2024 20:37:30 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHbHD-0002BG-0r;
	Thu, 13 Jun 2024 03:37:27 +0000
Date: Thu, 13 Jun 2024 11:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 4117/5129]
 drivers/pinctrl/pinctrl-keembay.c:1630:16: error: no member named 'name' in
 'struct function_desc'
Message-ID: <202406131133.WwdetfBL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   03d44168cbd7fc57d5de56a3730427db758fc7f6
commit: 15d34374182a52bcd72c5f4ba7105aed1b0b4558 [4117/5129] pinctrl: pinmux: Remove unused members from struct function_desc
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240613/202406131133.WwdetfBL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131133.WwdetfBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131133.WwdetfBL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-keembay.c:1630:16: error: no member named 'name' in 'struct function_desc'
    1630 |                         if (!fdesc->name) {
         |                              ~~~~~  ^
   1 error generated.


vim +1630 drivers/pinctrl/pinctrl-keembay.c

ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1598  
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1599  static int keembay_build_functions(struct keembay_pinctrl *kpc)
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1600  {
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1601  	struct function_desc *keembay_funcs, *new_funcs;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1602  	int i;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1603  
5d0674999cc5ca Rafał Miłecki      2021-12-16  1604  	/*
5d0674999cc5ca Rafał Miłecki      2021-12-16  1605  	 * Allocate maximum possible number of functions. Assume every pin
5d0674999cc5ca Rafał Miłecki      2021-12-16  1606  	 * being part of 8 (hw maximum) globally unique muxes.
5d0674999cc5ca Rafał Miłecki      2021-12-16  1607  	 */
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1608  	kpc->nfuncs = 0;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1609  	keembay_funcs = kcalloc(kpc->npins * 8, sizeof(*keembay_funcs), GFP_KERNEL);
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1610  	if (!keembay_funcs)
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1611  		return -ENOMEM;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1612  
5d0674999cc5ca Rafał Miłecki      2021-12-16  1613  	/* Setup 1 function for each unique mux */
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1614  	for (i = 0; i < kpc->npins; i++) {
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1615  		const struct pinctrl_pin_desc *pdesc = keembay_pins + i;
5d0674999cc5ca Rafał Miłecki      2021-12-16  1616  		struct keembay_mux_desc *mux;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1617  
5d0674999cc5ca Rafał Miłecki      2021-12-16  1618  		for (mux = pdesc->drv_data; mux->name; mux++) {
5d0674999cc5ca Rafał Miłecki      2021-12-16  1619  			struct function_desc *fdesc;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1620  
5d0674999cc5ca Rafał Miłecki      2021-12-16  1621  			/* Check if we already have function for this mux */
73ee52205e5a06 Andy Shevchenko    2024-05-30  1622  			for (fdesc = keembay_funcs; fdesc->func.name; fdesc++) {
73ee52205e5a06 Andy Shevchenko    2024-05-30  1623  				if (!strcmp(mux->name, fdesc->func.name)) {
73ee52205e5a06 Andy Shevchenko    2024-05-30  1624  					fdesc->func.ngroups++;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1625  					break;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1626  				}
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1627  			}
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1628  
5d0674999cc5ca Rafał Miłecki      2021-12-16  1629  			/* Setup new function for this mux we didn't see before */
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06 @1630  			if (!fdesc->name) {
73ee52205e5a06 Andy Shevchenko    2024-05-30  1631  				fdesc->func.name = mux->name;
73ee52205e5a06 Andy Shevchenko    2024-05-30  1632  				fdesc->func.ngroups = 1;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1633  				fdesc->data = &mux->mode;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1634  				kpc->nfuncs++;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1635  			}
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1636  		}
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1637  	}
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1638  
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1639  	/* Reallocate memory based on actual number of functions */
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1640  	new_funcs = krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_funcs), GFP_KERNEL);
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1641  	if (!new_funcs) {
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1642  		kfree(keembay_funcs);
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1643  		return -ENOMEM;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1644  	}
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1645  
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1646  	return keembay_add_functions(kpc, new_funcs);
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1647  }
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1648  

:::::: The code at line 1630 was first introduced by commit
:::::: ffd4e739358be036377563a0c6c33702c700e3ee pinctrl: Add Intel Keem Bay pinctrl driver

:::::: TO: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
