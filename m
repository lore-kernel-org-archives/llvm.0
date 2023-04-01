Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF0D199;
	Sat,  1 Apr 2023 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680353191; x=1711889191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bc/9wjX009TLkMWBZIjUN1BUEB7xRsZJXr60NxT9jR4=;
  b=jN8UMENYENRvgMbcWdmcpdsaPsCp0SNSV3i8mJUZxVuomqNkMbucGs5X
   GBw0TWgWxszEr8lmtNcA8zOrguFmeJkeP3+a/tiYVhDgOkF7zwvIGEgek
   2foB6BiVrAW3yktbO8QfLME/wxqtzAWOPFBvM0M62TfiCKA5mBzKgzm4y
   wy/x2+MSsgAMKa8dOld9c4gKviroKaWwSnmK1LsHlv6mTTtbU7vnUxzBG
   1BW2SDBMi51sfgj8N/CE526Tq/LWTmdM3N4frMTl1MUI7WeI0TnF1AfF2
   y7w7Qxi48wpt/bPNY/8fmFn+zp39n6BnxQo2d2sbjgH0H8kuh4nLLpIHD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="339145479"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="339145479"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 05:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="635592974"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="635592974"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Apr 2023 05:46:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piack-000Mlt-1S;
	Sat, 01 Apr 2023 12:46:26 +0000
Date: Sat, 1 Apr 2023 20:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:tmp 16/25]
 drivers/media/platform/ti/omap3isp/isp.c:1968:2: error: call to undeclared
 function 'v4l2_async_notifier_cleanup'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202304012004.FvPBBgmU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git tmp
head:   42249987f00786a33526b973c650743bc49681c2
commit: d53fa8dcae176a268e39d8d14f778268d8d22d0a [16/25] omap3isp: Release the isp device struct by media device callback
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20230401/202304012004.FvPBBgmU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree tmp
        git checkout d53fa8dcae176a268e39d8d14f778268d8d22d0a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/platform/ti/omap3isp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304012004.FvPBBgmU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/ti/omap3isp/isp.c:46:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/media/platform/ti/omap3isp/isp.c:46:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/media/platform/ti/omap3isp/isp.c:46:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/media/platform/ti/omap3isp/isp.c:1968:2: error: call to undeclared function 'v4l2_async_notifier_cleanup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           v4l2_async_notifier_cleanup(&isp->notifier);
           ^
   drivers/media/platform/ti/omap3isp/isp.c:1968:2: note: did you mean 'v4l2_async_nf_cleanup'?
   include/media/v4l2-async.h:277:6: note: 'v4l2_async_nf_cleanup' declared here
   void v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier);
        ^
   6 warnings and 1 error generated.


vim +/v4l2_async_notifier_cleanup +1968 drivers/media/platform/ti/omap3isp/isp.c

  1959	
  1960	static void isp_release(struct media_device *mdev)
  1961	{
  1962		struct isp_device *isp =
  1963			container_of(mdev, struct isp_device, media_dev);
  1964	
  1965		isp_cleanup_modules(isp);
  1966	
  1967		media_entity_enum_cleanup(&isp->crashed);
> 1968		v4l2_async_notifier_cleanup(&isp->notifier);
  1969	
  1970		kfree(isp);
  1971	}
  1972	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
