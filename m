Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E862FE579;
	Wed,  6 May 2026 05:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043691; cv=none; b=EH5Tn7zVhKqWO3IMciVioZ5yhL0JYD5T4iAI1nbXfPuS7/Ki9EoxGZPoO8llWB0hUV2ORtgyD+s7mBTx7AW/0GoaE7NLr0BHRClgldD4Sv2ex34ZXXCsfcQvQT1b04v0cslOxssrt/pBzkdLqK7DcPHzCeG7YGrPlXj0A5nw6TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043691; c=relaxed/simple;
	bh=WnJLn422RIAZ1x1ZtB56qWzkXPCute3biG5DRkXJMBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=inaj+sj7XRYbLnsWyVvWrXdSYBXTzRnRV7m/yfkmHXoVx2QVb+soeqDYm8Hk0yu/UW3W+iNn4wop81ivHQnQX7ZymXGGRUgUnopkqP1+c8heX+0UOjhMScjv1Tw9qbWraRZrWNjUSWM+p3pm1XZUfb66liAKncmmBdUwOj9e2U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOs6ItFs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOs6ItFs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778043687; x=1809579687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WnJLn422RIAZ1x1ZtB56qWzkXPCute3biG5DRkXJMBs=;
  b=VOs6ItFs+VAHUHV/CnVeiRQE9/3R/98mmoxPsilECJvQMAFRYo4AXyM1
   fiXyMLu+wzz/dXOeZtQvukIW3ZeQH+oKxHuYUhfOand/6gSvzc9mZ9h8E
   NZ0Gxp8kAqL1cYnFsPgY7UwDY9oVbyTU/lVkqqc77q2z0il7fbLL+HAll
   ADqo7TzoEtY/U7t4F+cGmY4a+oeoKCiaAgV30nM6w/2hEzqeDoCk/Lpxg
   3itv9Msu8ctG7rmKlnQIBP/awMGHPQCX+gYGoH5EZaNHEQbQjyRF7Rx6q
   wOWWH52glKgqEI8H9PfIyO5LtNyD+xErtgEvh8Qw8S+EkOxQGGCvupOQ+
   w==;
X-CSE-ConnectionGUID: z0rHWVkKTtGlxJXxkkbV5w==
X-CSE-MsgGUID: 1zUxjUpZQE27mlMk1Ztb8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89524031"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="89524031"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 22:01:26 -0700
X-CSE-ConnectionGUID: hN6jGCatShCyyPphSRAdEg==
X-CSE-MsgGUID: WcV0wJJzT1uf57KBGDyiPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="231626922"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2026 22:01:24 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKUNu-000000000iL-1tBM;
	Wed, 06 May 2026 05:01:22 +0000
Date: Wed, 06 May 2026 13:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 =?utf-8?Q?"=D0=94=D0=B0=D0=BC=D1=98=D0=B0=D0=BD?=
 =?utf-8?Q?_=D0=93=D0=B5=D0=BE=D1=80=D0=B3=D0=B8=D0=B5=D0=B2=D1=81=D0?=
 =?utf-8?Q?=BA=D0=B8"?= <gdamjan@gmail.com>
Subject: [gdamjan:v7.1/imx471 2/2] drivers/media/i2c/imx471.c:809:37:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202605061217.i3Ehi8UQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/gdamjan/linux v7.1/imx471
head:   5e4a3f7372c3d9f499239c2476fcda1e8cc005d7
commit: 5e4a3f7372c3d9f499239c2476fcda1e8cc005d7 [2/2] media: i2c: imx471: Add Sony IMX471 image sensor driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260506/202605061217.i3Ehi8UQ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061217.i3Ehi8UQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061217.i3Ehi8UQ-lkp@intel.com/

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
