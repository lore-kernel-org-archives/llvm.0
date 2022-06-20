Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABA72562
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 15:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655739891; x=1687275891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eU5f8V8IVf3St/lk2sCJeRVDhT/ui1JT1APj129p+yc=;
  b=LrzKeN5uyboC/PwHe9GdM01Sp/ibE0efMBiiehkuTtZZB+nzaGntuWDp
   4SZH05X3EvIVG3xw4Zp29oWBzJg1vk0FJaExE+iy/M5sGJI0is3Z0RZZC
   51Jtw3cyZqKwYSalrlOYEr63WRQqNsFbxrXE42bUr9kzI32tOfUmYxAjj
   ZhpmaxcevxnbVHdUQRYl8lUHUUMWwIfp/C3CUoCPPQejo0xbj30V9cNHb
   LXIJlkT8OS2ASXRQwuUO+keRlvcCoTu5EmfMB1I2yv78vPzisRTgP3fYY
   bF9Zy1hVkhL83pzx2AQCjQq8cXrYIw8zeoAf/NTBcTqt3N+y6nLg6ub/q
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="343918012"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="343918012"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 08:44:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="620154124"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Jun 2022 08:44:48 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3Ja4-000U0u-5q;
	Mon, 20 Jun 2022 15:44:48 +0000
Date: Mon, 20 Jun 2022 23:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 794/1181]
 drivers/media/i2c/ap1302.c:1829:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202206202317.ugyVbIJa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   59523b5c4aca0174f1f8cba2a07d3b3328b7c80e
commit: b0d8c0539b1bde057e9dafa153ffc0e98d7631e8 [794/1181] media: i2c: Add ON Semiconductor AP1302 ISP driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220620/202206202317.ugyVbIJa-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/b0d8c0539b1bde057e9dafa153ffc0e98d7631e8
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout b0d8c0539b1bde057e9dafa153ffc0e98d7631e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/i2c/ drivers/phy/xilinx/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ap1302.c:1829:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (enable == ap1302->streaming)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ap1302.c:1845:6: note: uninitialized use occurs here
           if (ret < 0)
               ^~~
   drivers/media/i2c/ap1302.c:1829:2: note: remove the 'if' if its condition is always false
           if (enable == ap1302->streaming)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ap1302.c:1825:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +1829 drivers/media/i2c/ap1302.c

  1821	
  1822	static int ap1302_s_stream(struct v4l2_subdev *sd, int enable)
  1823	{
  1824		struct ap1302_device *ap1302 = to_ap1302(sd);
  1825		int ret;
  1826	
  1827		mutex_lock(&ap1302->lock);
  1828	
> 1829		if (enable == ap1302->streaming)
  1830			goto done;
  1831	
  1832		if (enable) {
  1833			ret = ap1302_configure(ap1302);
  1834			if (ret < 0)
  1835				goto done;
  1836	
  1837			ret = ap1302_stall(ap1302, false);
  1838		} else {
  1839			ret = ap1302_stall(ap1302, true);
  1840		}
  1841	
  1842	done:
  1843		mutex_unlock(&ap1302->lock);
  1844	
  1845		if (ret < 0)
  1846			dev_err(ap1302->dev, "Failed to %s stream: %d\n",
  1847				enable ? "start" : "stop", ret);
  1848	
  1849		return ret;
  1850	}
  1851	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
