Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406C5DDBD;
	Wed, 16 Aug 2023 09:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692178988; x=1723714988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eCPEuZdSeEMjfWw8Q9Yz6ZCubhJo1INruSKhvZMrgqA=;
  b=Vy1QTQsQQqYCK+5QezGMYNTqPX16nemfopK7L6GPNjqzw/q5Tkwwvgfx
   zZrQaM8lYZJr2jY4bMeKIqbpvWBATxfsUmvZotmW6ssxEg3Vlyag+id3x
   7guRO6NjqbRq3uzpeT4kdfxiMx+JyQRjBpsv5ckJ99YP/Uj04Q1s60RRZ
   oFj1iNnH6sS81YxK69rnXtC/fyP14Ak1GVk8xOI4D55IAQJtoYzq1asxx
   xQWGOTcwTLdlT5L2nP+8Gc22IrwPDOSIL/vwCihtANFCP171V7DhTSn8A
   N84+vKiSxChrQJE4eFGJ9cg1wmDGZUSt3jiVKkQL3ZZ1wF6tNoP69O5C9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376216907"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="376216907"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 02:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="711056786"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="711056786"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Aug 2023 02:43:06 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWD2V-0000Bn-24;
	Wed, 16 Aug 2023 09:42:39 +0000
Date: Wed, 16 Aug 2023 17:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: Consider vdecsys presence in
 reg range check
Message-ID: <202308161708.NEoSnIHR-lkp@intel.com>
References: <20230725204043.569799-1-nfraprado@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230725204043.569799-1-nfraprado@collabora.com>

Hi Nícolas,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.5-rc6]
[also build test ERROR on linus/master]
[cannot apply to media-tree/master next-20230816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/N-colas-F-R-A-Prado/media-mediatek-vcodec-Consider-vdecsys-presence-in-reg-range-check/20230816-145454
base:   v6.5-rc6
patch link:    https://lore.kernel.org/r/20230725204043.569799-1-nfraprado%40collabora.com
patch subject: [PATCH] media: mediatek: vcodec: Consider vdecsys presence in reg range check
config: arm64-randconfig-r014-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161708.NEoSnIHR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161708.NEoSnIHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161708.NEoSnIHR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:90:8: error: use of undeclared identifier 'has_vdecsys_reg'
      90 |             (!has_vdecsys_reg && reg_num > NUM_MAX_VDEC_REG_BASE - 1)) {
         |               ^
   1 error generated.


vim +/has_vdecsys_reg +90 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c

    80	
    81	static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
    82	{
    83		struct platform_device *pdev = dev->plat_dev;
    84		int reg_num, i;
    85	
    86		/* Sizeof(u32) * 4 bytes for each register base. */
    87		reg_num = of_property_count_elems_of_size(pdev->dev.of_node, "reg",
    88							  sizeof(u32) * 4);
    89		if (reg_num <= 0 || reg_num > NUM_MAX_VDEC_REG_BASE ||
  > 90		    (!has_vdecsys_reg && reg_num > NUM_MAX_VDEC_REG_BASE - 1)) {
    91			dev_err(&pdev->dev, "Invalid register property size: %d\n", reg_num);
    92			return -EINVAL;
    93		}
    94	
    95		for (i = 0; i < reg_num; i++) {
    96			dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
    97			if (IS_ERR(dev->reg_base[i]))
    98				return PTR_ERR(dev->reg_base[i]);
    99	
   100			mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
   101		}
   102	
   103		return 0;
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
