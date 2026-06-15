Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8880D40629C;
	Mon, 15 Jun 2026 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781537838; cv=none; b=GRZILv7prlQpAzA5eKGStjSrlqciWYUPT0qu5Ehd3RHBg325uKylwP3pvbZakEPW6MFlKrWoneJNCe/As17IkCGI+RdAAOmRWv0J+PU10mJe7D8zXfc9ahDpnXj+FPSHlN7iU9x29nicSQRvGnQF1Y6H8y9Xg3BcrBYdNLqthh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781537838; c=relaxed/simple;
	bh=5foVMfAMzTJVNJq9P18E0WE6nEtuO/PFS+3pNT4PUhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZu6DagmK0cMf2dQel9+kE5Z1oNe/nXGGs/bMNFfO/dDwqvP4/d/mXYC12FDNJwjHR1jNGOQb4CvxO4iZs6VxMM+QPWGikfi3kosgrobv3lCErNz+GjfdbQSe8sRGa+fqKZkX5IJdO1r0XHbAgFkfNcbq2D2YRC7yK4JzaauZvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCTPL8GH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCTPL8GH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781537835; x=1813073835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5foVMfAMzTJVNJq9P18E0WE6nEtuO/PFS+3pNT4PUhk=;
  b=MCTPL8GHFlspZVDfYvNcGFAymTgR92DByqf3QTWXZiu5PHXMhDhHuRNR
   SSDPM/9/f0Pi0DFWa/dnFe+3iKW80C8flMa2YLKwHDITBYYBkCwaJhsh/
   89lrmbnoOkGe14Su4ja/JAk4zs1Fc1/V2ubnaZXKdtvJwxzEhZsBYLEeL
   ftIuFx705NSa4dT+El/mdQfdaF+dfE2WSLAWDz3k9A4SYwkIvhSKl1W8/
   IJZKKEtXd1F40TxiaqKrzf4+fWC+v5SreqEtMrrvVIkmGiEHNZNBnC9KS
   VAnz0qoBdpp2FG7xI9o3KUJPFZ7JF60C3XqKKyxl9FuJQCKIot4/fIXYW
   g==;
X-CSE-ConnectionGUID: 0uRuez4gSDaxFGGLJzGAtw==
X-CSE-MsgGUID: rcXq2D5cT5ymrY0JBfoM0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69824359"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="69824359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 08:37:14 -0700
X-CSE-ConnectionGUID: xgHvAY/mRiKnc4rmDfhV0Q==
X-CSE-MsgGUID: UoljNCW3S/SOQbqkre4JkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="241134830"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jun 2026 08:37:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZ9N7-00000000S0U-3H8i;
	Mon, 15 Jun 2026 15:37:09 +0000
Date: Mon, 15 Jun 2026 23:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	pengpeng@iscas.ac.cn
Subject: Re: [PATCH] misc: ad525x_dpot: fix sysfs cleanup paths
Message-ID: <202606152348.ZvNcZYgS-lkp@intel.com>
References: <20260615065140.77960-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615065140.77960-1-pengpeng@iscas.ac.cn>

Hi Pengpeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v7.1 next-20260612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengpeng-Hou/misc-ad525x_dpot-fix-sysfs-cleanup-paths/20260615-153833
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260615065140.77960-1-pengpeng%40iscas.ac.cn
patch subject: [PATCH] misc: ad525x_dpot: fix sysfs cleanup paths
config: s390-randconfig-002-20260615 (https://download.01.org/0day-ci/archive/20260615/202606152348.ZvNcZYgS-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606152348.ZvNcZYgS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606152348.ZvNcZYgS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/ad525x_dpot.c:735:1: warning: unused label 'exit_free' [-Wunused-label]
     735 | exit_free:
         | ^~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=m] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=m] && HAS_IOMEM [=y]


vim +/exit_free +735 drivers/misc/ad525x_dpot.c

4eb174bee6f862 Michael Hennerich 2009-12-14  685  
6c536e4ce8edd6 Michael Hennerich 2010-05-24  686  	struct dpot_data *data;
6c536e4ce8edd6 Michael Hennerich 2010-05-24  687  	int i, err = 0;
4eb174bee6f862 Michael Hennerich 2009-12-14  688  
bf4afc53b77aea Linus Torvalds    2026-02-21  689  	data = kzalloc_obj(struct dpot_data);
4eb174bee6f862 Michael Hennerich 2009-12-14  690  	if (!data) {
4eb174bee6f862 Michael Hennerich 2009-12-14  691  		err = -ENOMEM;
4eb174bee6f862 Michael Hennerich 2009-12-14  692  		goto exit;
4eb174bee6f862 Michael Hennerich 2009-12-14  693  	}
4eb174bee6f862 Michael Hennerich 2009-12-14  694  
6c536e4ce8edd6 Michael Hennerich 2010-05-24  695  	dev_set_drvdata(dev, data);
4eb174bee6f862 Michael Hennerich 2009-12-14  696  	mutex_init(&data->update_lock);
4eb174bee6f862 Michael Hennerich 2009-12-14  697  
6c536e4ce8edd6 Michael Hennerich 2010-05-24  698  	data->bdata = *bdata;
7f3379de9cd91e Michael Hennerich 2011-11-18  699  	data->devid = devid;
6c536e4ce8edd6 Michael Hennerich 2010-05-24  700  
7f3379de9cd91e Michael Hennerich 2011-11-18  701  	data->max_pos = 1 << DPOT_MAX_POS(devid);
6c536e4ce8edd6 Michael Hennerich 2010-05-24  702  	data->rdac_mask = data->max_pos - 1;
7f3379de9cd91e Michael Hennerich 2011-11-18  703  	data->feat = DPOT_FEAT(devid);
7f3379de9cd91e Michael Hennerich 2011-11-18  704  	data->uid = DPOT_UID(devid);
7f3379de9cd91e Michael Hennerich 2011-11-18  705  	data->wipers = DPOT_WIPERS(devid);
6c536e4ce8edd6 Michael Hennerich 2010-05-24  706  
59592d0ccc0000 Michael Hennerich 2010-05-24  707  	for (i = DPOT_RDAC0; i < MAX_RDACS; i++)
6c536e4ce8edd6 Michael Hennerich 2010-05-24  708  		if (data->wipers & (1 << i)) {
6c536e4ce8edd6 Michael Hennerich 2010-05-24  709  			err = ad_dpot_add_files(dev, data->feat, i);
6c536e4ce8edd6 Michael Hennerich 2010-05-24  710  			if (err)
6c536e4ce8edd6 Michael Hennerich 2010-05-24  711  				goto exit_remove_files;
6c536e4ce8edd6 Michael Hennerich 2010-05-24  712  			/* power-up midscale */
6c536e4ce8edd6 Michael Hennerich 2010-05-24  713  			if (data->feat & F_RDACS_WONLY)
6c536e4ce8edd6 Michael Hennerich 2010-05-24  714  				data->rdac_cache[i] = data->max_pos / 2;
4eb174bee6f862 Michael Hennerich 2009-12-14  715  		}
4eb174bee6f862 Michael Hennerich 2009-12-14  716  
6c536e4ce8edd6 Michael Hennerich 2010-05-24  717  	if (data->feat & F_CMD_INC)
6c536e4ce8edd6 Michael Hennerich 2010-05-24  718  		err = sysfs_create_group(&dev->kobj, &ad525x_group_commands);
6c536e4ce8edd6 Michael Hennerich 2010-05-24  719  
4eb174bee6f862 Michael Hennerich 2009-12-14  720  	if (err) {
4eb174bee6f862 Michael Hennerich 2009-12-14  721  		dev_err(dev, "failed to register sysfs hooks\n");
45f33069c7f509 Pengpeng Hou      2026-06-15  722  		goto exit_remove_files;
4eb174bee6f862 Michael Hennerich 2009-12-14  723  	}
4eb174bee6f862 Michael Hennerich 2009-12-14  724  
4eb174bee6f862 Michael Hennerich 2009-12-14  725  	dev_info(dev, "%s %d-Position Digital Potentiometer registered\n",
7f3379de9cd91e Michael Hennerich 2011-11-18  726  		 name, data->max_pos);
4eb174bee6f862 Michael Hennerich 2009-12-14  727  
4eb174bee6f862 Michael Hennerich 2009-12-14  728  	return 0;
4eb174bee6f862 Michael Hennerich 2009-12-14  729  
6c536e4ce8edd6 Michael Hennerich 2010-05-24  730  exit_remove_files:
59592d0ccc0000 Michael Hennerich 2010-05-24  731  	for (i = DPOT_RDAC0; i < MAX_RDACS; i++)
6c536e4ce8edd6 Michael Hennerich 2010-05-24  732  		if (data->wipers & (1 << i))
6c536e4ce8edd6 Michael Hennerich 2010-05-24  733  			ad_dpot_remove_files(dev, data->feat, i);
6c536e4ce8edd6 Michael Hennerich 2010-05-24  734  
4eb174bee6f862 Michael Hennerich 2009-12-14 @735  exit_free:
4eb174bee6f862 Michael Hennerich 2009-12-14  736  	kfree(data);
6c536e4ce8edd6 Michael Hennerich 2010-05-24  737  	dev_set_drvdata(dev, NULL);
4eb174bee6f862 Michael Hennerich 2009-12-14  738  exit:
6c536e4ce8edd6 Michael Hennerich 2010-05-24  739  	dev_err(dev, "failed to create client for %s ID 0x%lX\n",
7f3379de9cd91e Michael Hennerich 2011-11-18  740  		name, devid);
4eb174bee6f862 Michael Hennerich 2009-12-14  741  	return err;
4eb174bee6f862 Michael Hennerich 2009-12-14  742  }
6c536e4ce8edd6 Michael Hennerich 2010-05-24  743  EXPORT_SYMBOL(ad_dpot_probe);
4eb174bee6f862 Michael Hennerich 2009-12-14  744  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
