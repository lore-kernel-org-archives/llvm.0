Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909823FB33;
	Wed, 18 Oct 2023 18:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlaSSzhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697652916; x=1729188916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zDMsKs9SB3qXaVR+h19Rc8V0I8Of2Jc9y3YvXK27VTU=;
  b=MlaSSzhm5/R+DkN5Ye/bi1TS0vIbO+x6WaWA42UNzgH0QJVzsJ3zhLtK
   3SG0QKM+whS/8iTQeJGPp56kiPI6AJWGoIA6mG1JR/xQVqAl0h/NVgI+5
   Y5SDoemfF7kjY5SjvWrowAWAmjzOr0Nr1vOE9+mpwugpsiabKsO9Hg0sg
   jGiJd2pZWPOcouVg3cngfwNTPL4Ctw7iQpIbpY/GUH6L+uUHQqbptLFGW
   uPneZlW3v6hLlXyrXwRqb2IlAw1Lf1779MF+FaYkoKWxXrQW64PCNL5EP
   kr2Bh2IrHFQbEQE4GUWL/xKeBLaISg6Rez83S09rJJRCEFsHp54SFWCME
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="472307350"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="472307350"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 11:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="733266191"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="733266191"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Oct 2023 11:15:13 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtB4Z-0000oS-2W;
	Wed, 18 Oct 2023 18:15:11 +0000
Date: Thu, 19 Oct 2023 02:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 20/35] drivers/mfd: sm501 add some properties.
Message-ID: <202310190212.fwQ0lh1o-lkp@intel.com>
References: <b1bedaea12693d256b2513f72bd39630a69d188a.1697199949.git.ysato@users.sourceforge.jp>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1bedaea12693d256b2513f72bd39630a69d188a.1697199949.git.ysato@users.sourceforge.jp>

Hi Yoshinori,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on robh/for-next pci/next pci/for-linus linus/master v6.6-rc6 next-20231018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yoshinori-Sato/arch-sh-boot-compressed-head_32-S-passing-FDT-address-to-initialize-function/20231017-170254
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/b1bedaea12693d256b2513f72bd39630a69d188a.1697199949.git.ysato%40users.sourceforge.jp
patch subject: [RFC PATCH v3 20/35] drivers/mfd: sm501 add some properties.
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231019/202310190212.fwQ0lh1o-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190212.fwQ0lh1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190212.fwQ0lh1o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/sm501.c:1517:9: error: call to undeclared function 'sm501_parse_dt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = sm501_parse_dt(sm, dev->dev.of_node);
                         ^
   1 error generated.


vim +/sm501_parse_dt +1517 drivers/mfd/sm501.c

  1479	
  1480	static int sm501_plat_probe(struct platform_device *dev)
  1481	{
  1482		struct sm501_devdata *sm;
  1483		int ret;
  1484	
  1485		sm = kzalloc(sizeof(*sm), GFP_KERNEL);
  1486		if (!sm) {
  1487			ret = -ENOMEM;
  1488			goto err1;
  1489		}
  1490	
  1491		sm->dev = &dev->dev;
  1492		sm->pdev_id = dev->id;
  1493		sm->platdata = dev_get_platdata(&dev->dev);
  1494	
  1495		ret = platform_get_irq(dev, 0);
  1496		if (ret < 0)
  1497			goto err_res;
  1498		sm->irq = ret;
  1499	
  1500		sm->io_res = platform_get_resource(dev, IORESOURCE_MEM, 1);
  1501		sm->mem_res = platform_get_resource(dev, IORESOURCE_MEM, 0);
  1502		if (!sm->io_res || !sm->mem_res) {
  1503			dev_err(&dev->dev, "failed to get IO resource\n");
  1504			ret = -ENOENT;
  1505			goto err_res;
  1506		}
  1507	
  1508		sm->regs_claim = request_mem_region(sm->io_res->start,
  1509						    0x100, "sm501");
  1510		if (!sm->regs_claim) {
  1511			dev_err(&dev->dev, "cannot claim registers\n");
  1512			ret = -EBUSY;
  1513			goto err_res;
  1514		}
  1515	
  1516		if (IS_ENABLED(CONFIG_OF) && dev->dev.of_node) {
> 1517			ret = sm501_parse_dt(sm, dev->dev.of_node);
  1518			if (ret)
  1519				goto err_res;
  1520		}
  1521	
  1522		platform_set_drvdata(dev, sm);
  1523	
  1524		sm->regs = ioremap(sm->io_res->start, resource_size(sm->io_res));
  1525		if (!sm->regs) {
  1526			dev_err(&dev->dev, "cannot remap registers\n");
  1527			ret = -EIO;
  1528			goto err_claim;
  1529		}
  1530	
  1531		ret = sm501_init_dev(sm);
  1532		if (ret)
  1533			goto err_unmap;
  1534	
  1535		return 0;
  1536	
  1537	 err_unmap:
  1538		iounmap(sm->regs);
  1539	 err_claim:
  1540		release_mem_region(sm->io_res->start, 0x100);
  1541	 err_res:
  1542		kfree(sm);
  1543	 err1:
  1544		return ret;
  1545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
