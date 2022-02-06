Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A732F28
	for <llvm@lists.linux.dev>; Sun,  6 Feb 2022 23:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644188569; x=1675724569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WGazTIXEomqk1RyEUKJYfY6+ACkvGBsLJawzaRKjKUo=;
  b=D/8M8epkvscqckD1cj1h3r681NNGZE5uBe33PuJeldM186KcxFKga5k1
   S3zjoty+2vNvJTIOOh4r8LH04fI120d6WULBrN5jjqJO6WprP7Rwa6Fr3
   LTtB+W+sBnqsoUpWa0YC5YgOAmnQNuEVH4DlRiy0ddxTRzYJKxOYTd+Q5
   HxzrlVMDPoHCpDXAgzuqNuCYuxAyE/BItfxsl6PkFdqT/sF1h3G8gchGV
   jRI7RIrRGxbsj4dsGKB1MuMZnkwLNajAj2MubmnRckGdmYRJ+A+GTwjLW
   kvUbW6tVGiFt4VGvok89FGs7eujNr6tSk8DKq5UGg7VnGf5eddK82shne
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="228583581"
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; 
   d="scan'208";a="228583581"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2022 15:02:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; 
   d="scan'208";a="621362815"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2022 15:02:48 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nGqYR-000apS-CD; Sun, 06 Feb 2022 23:02:47 +0000
Date: Mon, 7 Feb 2022 07:01:56 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] [RFC] drm: mxsfb: Implement LCDIF scanout CRC32 support
Message-ID: <202202070617.cZxa0dIi-lkp@intel.com>
References: <20220206185643.275811-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220206185643.275811-1-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Marek,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc2 next-20220204]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Vasut/drm-mxsfb-Implement-LCDIF-scanout-CRC32-support/20220207-025808
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: riscv-randconfig-r031-20220207 (https://download.01.org/0day-ci/archive/20220207/202202070617.cZxa0dIi-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5a44925592c764c59219b0024ee06317028)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/75b77e11a90d2a041b405a10dce7e1be6aab61a0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marek-Vasut/drm-mxsfb-Implement-LCDIF-scanout-CRC32-support/20220207-025808
        git checkout 75b77e11a90d2a041b405a10dce7e1be6aab61a0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/mxsfb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mxsfb/mxsfb_drv.c:324:33: error: too many arguments provided to function-like macro invocation
           u32 hwcrc = readl(mxsfb->base, LCDC_V4_CRC_STAT);
                                          ^
   arch/riscv/include/asm/mmio.h:140:9: note: macro 'readl' defined here
   #define readl(c)        ({ u32 __v; __io_br(); __v = readl_cpu(c); __io_ar(__v); __v; })
           ^
>> drivers/gpu/drm/mxsfb/mxsfb_drv.c:324:14: error: use of undeclared identifier 'readl'; did you mean 'vread'?
           u32 hwcrc = readl(mxsfb->base, LCDC_V4_CRC_STAT);
                       ^~~~~
                       vread
   include/linux/vmalloc.h:251:13: note: 'vread' declared here
   extern long vread(char *buf, char *addr, unsigned long count);
               ^
>> drivers/gpu/drm/mxsfb/mxsfb_drv.c:324:6: warning: incompatible pointer to integer conversion initializing 'u32' (aka 'unsigned int') with an expression of type 'long (char *, char *, unsigned long)' [-Wint-conversion]
           u32 hwcrc = readl(mxsfb->base, LCDC_V4_CRC_STAT);
               ^       ~~~~~
   1 warning and 2 errors generated.


vim +324 drivers/gpu/drm/mxsfb/mxsfb_drv.c

   317	
   318	static ssize_t mxsfb_frame_checksum_show(struct device *dev,
   319						     struct device_attribute *attr,
   320						     char *buf)
   321	{
   322		struct drm_device *drm = dev_get_drvdata(dev);
   323		struct mxsfb_drm_private *mxsfb = drm->dev_private;
 > 324		u32 hwcrc = readl(mxsfb->base, LCDC_V4_CRC_STAT);
   325		u32 swcrc = 0xffffffff;
   326		int i;
   327	
   328		if (mxsfb->gem_vaddr) {
   329			for (i = 0; i < mxsfb->gem_size / 4; i++) {
   330				u32 data = bitrev32(((u32 *)mxsfb->gem_vaddr)[i]);
   331				swcrc = crc32(swcrc, &data, 4);
   332			}
   333			swcrc = bitrev32(swcrc);
   334		}
   335	
   336		return sysfs_emit(buf, "HW:%08x,SW:%08x,OK:%d\n", hwcrc, swcrc, hwcrc == swcrc);
   337	}
   338	static DEVICE_ATTR(frame_checksum, 0444, mxsfb_frame_checksum_show, NULL);
   339	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
