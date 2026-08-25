Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20032C11D9;
	Tue, 25 Aug 2026 05:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787635347; cv=none; b=Hv0RPpcyxdKehS+I/1F+iP/naxyNrLOcQk7XLZX0fXxT+x+K3YMJddZdaLvTfHCDsIxdw7zFplW1PnUN4MiIPjV210/Hpt7VdN1e01lvfsu/p/1XcB3LQWLsvRMwGknr3Aao3+FfQUPteSZd/A13xz61asaJtAzv5wSkw5MSdhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787635347; c=relaxed/simple;
	bh=sMDE4lBFlF7cb2OuWanRnclvqhT/MVLWElxZHRbI60w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XZJr862It5hsy3w7Zmg3xPrT9WfKmncYLNbHrhWlW/1i7KHf8UzACfMeobrFppcxFSukiuKgxV8j3yiEn5DdlKB3Y4SG/3iaZyA6prF5lAt7hr4RW27PyxU3c4GCwIeG+pNpfgE9MJ0BPjS2J5MvMTDZsBPdXx8F5elNtlMUZzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuYJZup5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuYJZup5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787635345; x=1819171345;
  h=date:from:to:cc:subject:message-id;
  bh=sMDE4lBFlF7cb2OuWanRnclvqhT/MVLWElxZHRbI60w=;
  b=CuYJZup5lXHHADaA38JUckUCisgQUCF1Jonb9PEVHf0xUbRjt5h5Akl0
   aSNa9tjDV+ppnS2vmiJVkkWmOxiWXTZ8Xc8HC2EeI2EKuupJLDG9F3XOV
   E6S9O39/LLO3Mh+ml/FPSSnGD5fQhyx5+gdbRGo8kpqeTA86OleA6NPZd
   2rIaBPIinRKVBw7Ss8bNVvkOprOwbrhLDABAAe/JInWGiLpAa+s12zpWK
   /ax3JVcvh43QbYLe/UMTWnOop2MtAe7brRN+xs3t3572a+kW4S5qoIBaA
   8seOVXVD5LcsNyykun1ZOTLg93AwazH1DqZ4ydWPGnKI2d5ECmtvimw5r
   Q==;
X-CSE-ConnectionGUID: dvJsw32TRu6V5g8FZoAE7Q==
X-CSE-MsgGUID: gIP1FtggRlWKV2AtP/EQVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88109101"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88109101"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 22:22:25 -0700
X-CSE-ConnectionGUID: kOdTLFxzTPWHDMpqhSmmQQ==
X-CSE-MsgGUID: hG/+fHktQn2JbTC0oSNPpA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Aug 2026 22:22:23 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyjc4-00000000520-27nU;
	Tue, 25 Aug 2026 05:22:20 +0000
Date: Tue, 25 Aug 2026 13:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:frame-desc 31/38]
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:110:24: warning: format
 specifies type 'void *' but the argument has type 'long'
Message-ID: <202608251350.1jKfLPih-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git frame-desc
head:   7c1e8e3f907ccd6c51f2c23e1a4ac09b6d4b1f04
commit: 212ff03f220ab9cdff207d0ff3c6a459e1f1e1d5 [31/38] media: rkisp1: Use v4l2_subdev_get_frame_desc()
config: i386-buildonly-randconfig-004-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251350.1jKfLPih-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251350.1jKfLPih-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251350.1jKfLPih-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:110:24: warning: format specifies type 'void *' but the argument has type 'long' [-Wformat]
     109 |                         "failed to get frame descriptor from '%s':%u: %pe\n",
         |                                                                       ~~
         |                                                                       %ld
     110 |                         source_sd->name, 0, PTR_ERR(fd));
         |                                             ^~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +110 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c

    86	
    87	static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
    88					struct media_pad *source)
    89	{
    90		struct v4l2_subdev *source_sd;
    91		unsigned int dt;
    92		u32 mask;
    93		u32 val;
    94	
    95		/*
    96		 * Configure and enable the gasket with the CSI-2 data type. Set the
    97		 * vsync polarity as active high, as that is what the ISP is configured
    98		 * to expect in ISP_ACQ_PROP. Enable left justification, as the i.MX8MP
    99		 * ISP has a 16-bit wide input and expects data to be left-aligned.
   100		 */
   101	
   102		source_sd = media_entity_to_v4l2_subdev(source->entity);
   103	
   104		struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
   105			v4l2_subdev_get_frame_desc(source_sd, source->index,
   106						   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
   107		if (IS_ERR(fd)) {
   108			dev_err(rkisp1->dev,
   109				"failed to get frame descriptor from '%s':%u: %pe\n",
 > 110				source_sd->name, 0, PTR_ERR(fd));
   111			return PTR_ERR(fd);
   112		}
   113	
   114		if (fd->num_entries != 1) {
   115			dev_err(rkisp1->dev, "invalid frame descriptor for '%s':%u\n",
   116				source_sd->name, 0);
   117			return -EINVAL;
   118		}
   119	
   120		dt = fd->entry[0].bus.csi2.dt;
   121	
   122		if (rkisp1->gasket_id == 0) {
   123			mask = ISP_DEWARP_CONTROL_MIPI_CSI1_HS_POLARITY
   124			     | ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_MASK
   125			     | ISP_DEWARP_CONTROL_MIPI_ISP1_LEFT_JUST_MODE
   126			     | ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE_MASK
   127			     | ISP_DEWARP_CONTROL_GPR_ISP_0_DISABLE;
   128			val = ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_POSITIVE
   129			    | ISP_DEWARP_CONTROL_MIPI_ISP1_LEFT_JUST_MODE
   130			    | ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE(dt);
   131		} else {
   132			mask = ISP_DEWARP_CONTROL_MIPI_CSI2_HS_POLARITY
   133			     | ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_MASK
   134			     | ISP_DEWARP_CONTROL_MIPI_ISP2_LEFT_JUST_MODE
   135			     | ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE_MASK
   136			     | ISP_DEWARP_CONTROL_GPR_ISP_1_DISABLE;
   137			val = ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_POSITIVE
   138			    | ISP_DEWARP_CONTROL_MIPI_ISP2_LEFT_JUST_MODE
   139			    | ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE(dt);
   140		}
   141	
   142		regmap_update_bits(rkisp1->gasket, ISP_DEWARP_CONTROL, mask, val);
   143	
   144		return 0;
   145	}
   146	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
