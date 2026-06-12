Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE237EFE3;
	Fri, 12 Jun 2026 04:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781236891; cv=none; b=IwebPwiJZNwVi8WM21wSkgTbnBFKcCosKXtDnmLrbaBmooPjAFMs0rpT5Emh0+jXwVwZ+qniQErl256wxAL9xPMtrscBwOhM9a82De8ENNa5meFHwcv285rPMDaOK3gsYgHe+dm+x3kx7yM1AMSByp2sA+YMQ/2NwfTUAU48d/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781236891; c=relaxed/simple;
	bh=F4it6wIFAu0vkuw7hmz39NKWcOvWEc2p6Cxq/EfSsew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HtRfN9R746nFP5CODVppDz95KBhjBda9MzOHupu7c8Hn5/9OoRKCeTX8jguIkHRToctmfq/tBtQn7Hner1JO9B8xZS3tRB8+DocX+kffLygioQjhRHd4w5Dh5z+9n4aGnhIXx8P1GJhsHLz6yy3Nw53xVkv7J4g5XveQxCQ2Rjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nW7jKWjT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nW7jKWjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781236889; x=1812772889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F4it6wIFAu0vkuw7hmz39NKWcOvWEc2p6Cxq/EfSsew=;
  b=nW7jKWjT3q/V4biczxYuHHOfHAfSKSROBwXdNEQ4KNrbYEkaFlxdeL/5
   gtFzakUUZHEQEx+0OZ5YzHuTLYNdXJzWEiPub1JToSlWjhbNKGYGQi168
   OftB57j49JCY7RujZWgZXPq+PEnVV8pFQPHU1SNk5fqXAglgUQjZTyOs3
   saej20snRLdgrtPqRnXPNjPn4wht0xczkYqH23htOJP1U7RVjscUJ3/kJ
   6o3y8169iO6Gg0bktaWDWdCv5dKDD7C1q/7e8B0lKokdy0/CJAdm0+hUH
   b9DiH+aINa49wjC4ZaalnKG9fBlkpRa4xNdMWmtDG94x5l+rDY/0gijru
   w==;
X-CSE-ConnectionGUID: VNgI6XasTqeexlOK3eQlWg==
X-CSE-MsgGUID: GHR+9hULQf60QbM7wODEcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81200956"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="81200956"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 21:01:28 -0700
X-CSE-ConnectionGUID: YcE56+8hS9+Hic2Al2peDA==
X-CSE-MsgGUID: LHm1TQHjSoSLakJg31zOmw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 21:01:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXt59-00000000OHl-1nl5;
	Fri, 12 Jun 2026 04:01:23 +0000
Date: Fri, 12 Jun 2026 12:00:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 =?utf-8?Q?"=D0=94=D0=B0=D0=BC=D1=98=D0=B0=D0=BD?=
 =?utf-8?Q?_=D0=93=D0=B5=D0=BE=D1=80=D0=B3=D0=B8=D0=B5=D0=B2=D1=81=D0?=
 =?utf-8?Q?=BA=D0=B8"?= <gdamjan@gmail.com>
Subject: [gdamjan:v7.1/imx471 2/2] drivers/media/i2c/imx471.c:809:37:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202606121107.YCBtHjdw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/gdamjan/linux v7.1/imx471
head:   6deed8dc0c1a824fc0ee6e2cef953c0747b0fbfe
commit: 6deed8dc0c1a824fc0ee6e2cef953c0747b0fbfe [2/2] media: i2c: imx471: Add Sony IMX471 image sensor driver
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260612/202606121107.YCBtHjdw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c8ad049db78ae52052722b6f42b54cd2a666072b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121107.YCBtHjdw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121107.YCBtHjdw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx471.c:809:37: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     809 |                 return dev_err_probe(sensor->dev, ret,
         |                                                   ^~~
   drivers/media/i2c/imx471.c:805:9: note: initialize the variable 'ret' to silence this warning
     805 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +809 drivers/media/i2c/imx471.c

   796	
   797	static int imx471_check_hwcfg(struct imx471_data *sensor)
   798	{
   799		struct v4l2_fwnode_endpoint bus_cfg = {
   800			.bus_type = V4L2_MBUS_CSI2_DPHY,
   801		};
   802		struct fwnode_handle *ep, *fwnode = dev_fwnode(sensor->dev);
   803		struct clk *clk;
   804		unsigned long link_freq_bitmap;
   805		int ret;
   806	
   807		clk = devm_v4l2_sensor_clk_get(sensor->dev, NULL);
   808		if (IS_ERR(clk))
 > 809			return dev_err_probe(sensor->dev, ret,
   810					     "can't get clock frequency\n");
   811	
   812		if (clk_get_rate(clk) != IMX471_EXT_CLK)
   813			return dev_err_probe(sensor->dev, -EINVAL,
   814					     "external clock %lu is not supported\n",
   815					     clk_get_rate(clk));
   816	
   817		ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
   818		ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
   819		fwnode_handle_put(ep);
   820		if (ret)
   821			return dev_err_probe(sensor->dev, ret,
   822					     "parsing endpoint failed");
   823	
   824		ret = v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_frequencies,
   825					       bus_cfg.nr_of_link_frequencies,
   826					       link_freq_menu_items,
   827					       ARRAY_SIZE(link_freq_menu_items),
   828					       &link_freq_bitmap);
   829	
   830		if (ret == -ENOENT)
   831			goto error_endpoint_free;
   832	
   833		if (ret == -ENODATA)
   834			goto error_endpoint_free;
   835	
   836	error_endpoint_free:
   837		v4l2_fwnode_endpoint_free(&bus_cfg);
   838	
   839		return ret;
   840	}
   841	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
