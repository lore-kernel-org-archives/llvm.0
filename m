Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFBA12B95;
	Fri, 28 Jul 2023 16:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690562668; x=1722098668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mseWZlNtJGRrbvOrNZCSIZzeAppJMxwlXbNI4EI0PqM=;
  b=KG5W1BdsaaYh/j06bUhxvOk24gsxgBYR63oNZFCDp0b//rK9PCh/zQIg
   DGhswExLRKztX4nt+C5hjhrKN1B5w4rnD9t3SFn+moAlI0/enA1rVRYhW
   z/3QiS9aDZcQA63NPE3IwhLG0i02MndYOkbGrfIBt74a7NSdnsY/9YN2Y
   Dz+cyJGQxNRE+1DI8vDtp8rdZfULaQFC5BePnhNdv/8wfD+UCB1483/QR
   sirTNEbJZl6HYlsmvJREcf6XEYnHiqKNV0gctJhNKVt5gbk1TvEr6GYaB
   aT1vdWuwsGQDTbzqRACzaMJmys1vsJTDADw0uPUZEhBbEG3bKlIDNAavD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="372258685"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="372258685"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 09:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="841378018"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="841378018"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2023 09:44:26 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPQZc-0003OF-2b;
	Fri, 28 Jul 2023 16:44:25 +0000
Date: Sat, 29 Jul 2023 00:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [sailus-media-tree:master 10/20] ld.lld: error: undefined symbol:
 devm_cci_regmap_init_i2c
Message-ID: <202307290010.Xjbdp5kg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   78b5f6f940f213e4139b0c8dbd1499a564f1ea89
commit: 1bb2f576bc647eff694047bb03b52998221657a6 [10/20] media: imx290: Convert to new CCI register access helpers
config: i386-randconfig-i012-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290010.Xjbdp5kg-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290010.Xjbdp5kg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290010.Xjbdp5kg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_cci_regmap_init_i2c
   >>> referenced by imx290.c:1526 (drivers/media/i2c/imx290.c:1526)
   >>>               drivers/media/i2c/imx290.o:(imx290_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: cci_multi_reg_write
   >>> referenced by imx290.c:614 (drivers/media/i2c/imx290.c:614)
   >>>               drivers/media/i2c/imx290.o:(imx290_set_stream) in archive vmlinux.a
   >>> referenced by imx290.c:614 (drivers/media/i2c/imx290.c:614)
   >>>               drivers/media/i2c/imx290.o:(imx290_set_stream) in archive vmlinux.a
   >>> referenced by imx290.c:614 (drivers/media/i2c/imx290.c:614)
   >>>               drivers/media/i2c/imx290.o:(imx290_set_stream) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: cci_write
   >>> referenced by imx290.c:634 (drivers/media/i2c/imx290.c:634)
   >>>               drivers/media/i2c/imx290.o:(imx290_set_stream) in archive vmlinux.a
   >>> referenced by imx290.c:635 (drivers/media/i2c/imx290.c:635)
   >>>               drivers/media/i2c/imx290.o:(imx290_set_stream) in archive vmlinux.a
   >>> referenced by imx290.c:636 (drivers/media/i2c/imx290.c:636)
   >>>               drivers/media/i2c/imx290.o:(imx290_set_stream) in archive vmlinux.a
   >>> referenced 24 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
