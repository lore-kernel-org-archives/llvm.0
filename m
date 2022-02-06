Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B52F21
	for <llvm@lists.linux.dev>; Sun,  6 Feb 2022 21:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644184248; x=1675720248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XsOC8Zy4l1C2+Y5YhwrFf7GUgQArRfqPMOFG5LuKxqA=;
  b=cK5HwZo6RXn2Vg9i6ivJD6xpC9/J8833BazNl6tEcFTM0wMEAwyccwJ+
   AoojYCiZx2sPpoWUWTVcwxxoOKHGcup28wMKtBQjYUuzjjhYkBY+9hjXv
   SUB3rdE3HNCvSyX+EZXtGNTc/s8U/py4BUheRVhiTHmzmO9RNU487NKIo
   NxwKgFpiYwoXgO0NlpRdKRWmxvAFT8rSiTQEjsa+yGI7NHFNLP9tUzzEk
   mUyAVG98+pIzlDo5S31BPXzEM+zpfFzr+nR2Yf2M2QAAsJRUxraqeeQMD
   /6pY9XRzkgbXFNcgMg3OX5Jz20xPcyjPbr5s2DiSqyg+8R6JOAkn9H9//
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10249"; a="248373355"
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; 
   d="scan'208";a="248373355"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2022 13:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; 
   d="scan'208";a="632253767"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Feb 2022 13:50:46 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nGpQk-000amG-3F; Sun, 06 Feb 2022 21:50:46 +0000
Date: Mon, 7 Feb 2022 05:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] [RFC] drm: mxsfb: Implement LCDIF scanout CRC32 support
Message-ID: <202202070546.PJcFF726-lkp@intel.com>
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
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220207/202202070546.PJcFF726-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5a44925592c764c59219b0024ee06317028)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/75b77e11a90d2a041b405a10dce7e1be6aab61a0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marek-Vasut/drm-mxsfb-Implement-LCDIF-scanout-CRC32-support/20220207-025808
        git checkout 75b77e11a90d2a041b405a10dce7e1be6aab61a0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/mxsfb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/mxsfb/mxsfb_drv.c:324:33: error: too many arguments to function call, expected single argument 'addr', have 2 arguments
           u32 hwcrc = readl(mxsfb->base, LCDC_V4_CRC_STAT);
                       ~~~~~              ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_regs.h:29:27: note: expanded from macro 'LCDC_V4_CRC_STAT'
   #define LCDC_V4_CRC_STAT                0x1a0
                                           ^~~~~
   arch/x86/include/asm/io.h:60:17: note: 'readl' declared here
   build_mmio_read(readl, "l", unsigned int, "=r", :"memory")
                   ^
   1 error generated.


vim +/addr +324 drivers/gpu/drm/mxsfb/mxsfb_drv.c

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
