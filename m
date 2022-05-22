Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6B420E8
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 03:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653191522; x=1684727522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ncg3fenhMzANpwBzc+ZzrWqpjCh41aOSHl7zLZUGcQw=;
  b=K/GRUYm8QRDy9r10oR+gr9vG3McIUWhW5q6Gc7/MLiNycWF762voPmvB
   uKugczsbhC+i1sQ2WdX8ZpoQn4+adwsfAw/XP5R7RBT5szgVW1nzOePcE
   Epx3+S9oIryvUnzdx3DDJC76wfgtxNyRei04J8pBpCID0RQZ0QRsJrWaj
   +SUeajKnv3ndbNQJs9NFOL3PMysamLxa+hN/8qaaju2eUe9EVaCwQyZrj
   iVsI1iW6q7hbEwmfKMdw8lVEDdb1aiyJREuQFjwb30D9xdDwFWncoSXMj
   WSbUMVhzSaRq4i0RKWhFwWPiABj2NSX02iGBvdeqZctaFLfweIGw/6NfT
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="359343319"
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="359343319"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 20:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="525307183"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 May 2022 20:52:00 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nscdL-0006ts-AZ;
	Sun, 22 May 2022 03:51:59 +0000
Date: Sun, 22 May 2022 11:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [linux-next:master 12283/13468] drivers/rtc/rtc-rzn1.c:291:3:
 warning: variable 'val' is uninitialized when used here
Message-ID: <202205221120.Tt6UxePI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: be4a11cf98aff5d456eae947a49b6163393d9420 [12283/13468] rtc: rzn1: Add oscillator offset support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220522/202205221120.Tt6UxePI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1443dbaba6f0e57be066995db9164f89fb57b413)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=be4a11cf98aff5d456eae947a49b6163393d9420
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout be4a11cf98aff5d456eae947a49b6163393d9420
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/rtc/ net/sched/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-rzn1.c:291:3: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
                   val |= RZN1_RTC_SUBU_DEV;
                   ^~~
   drivers/rtc/rtc-rzn1.c:275:9: note: initialize the variable 'val' to silence this warning
           u32 val;
                  ^
                   = 0
   1 warning generated.


vim +/val +291 drivers/rtc/rtc-rzn1.c

   269	
   270	static int rzn1_rtc_set_offset(struct device *dev, long offset)
   271	{
   272		struct rzn1_rtc *rtc = dev_get_drvdata(dev);
   273		unsigned int steps;
   274		int stepsh, stepsl;
   275		u32 val;
   276		int ret;
   277	
   278		/*
   279		 * Check which resolution mode (every 20 or 60s) can be used.
   280		 * Between 2 and 124 clock pulses can be added or substracted.
   281		 *
   282		 * In 20s mode, the minimum resolution is 2 / (32768 * 20) which is
   283		 * close to 3051 ppb. In 60s mode, the resolution is closer to 1017.
   284		 */
   285		stepsh = DIV_ROUND_CLOSEST(offset, 1017);
   286		stepsl = DIV_ROUND_CLOSEST(offset, 3051);
   287	
   288		if (stepsh >= -0x3E && stepsh <= 0x3E) {
   289			/* 1017 ppb per step */
   290			steps = stepsh;
 > 291			val |= RZN1_RTC_SUBU_DEV;
   292		} else if (stepsl >= -0x3E && stepsl <= 0x3E) {
   293			/* 3051 ppb per step */
   294			steps = stepsl;
   295		} else {
   296			return -ERANGE;
   297		}
   298	
   299		if (!steps)
   300			return 0;
   301	
   302		if (steps > 0) {
   303			val |= steps + 1;
   304		} else {
   305			val |= RZN1_RTC_SUBU_DECR;
   306			val |= (~(-steps - 1)) & 0x3F;
   307		}
   308	
   309		ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
   310					 !(val & RZN1_RTC_CTL2_WUST), 100, 2000000);
   311		if (ret)
   312			return ret;
   313	
   314		writel(val, rtc->base + RZN1_RTC_SUBU);
   315	
   316		return 0;
   317	}
   318	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
