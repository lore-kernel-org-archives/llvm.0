Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92482585
	for <llvm@lists.linux.dev>; Thu,  4 Aug 2022 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659627747; x=1691163747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/sO3bK65pKVZ1iDdvnWnZimmDSlRaWOseNM6XOn2moM=;
  b=U55y2O+oIJeziz/p4xOm3/DauVD8jlKR6pKVnIgBx1XiTIJp0g/RWzcO
   MsRYqabR/HygutF8dcxz37y2+Y0khxfLxfIvHDEDugvpE24m9VuL420DH
   A2MkXFxWnJpki1FMhQZulalFt78nuW3iQEBbhv7WSSZDdWNwlf29+wa8M
   0D0qOR6zXF4sfVLjlC8rWAZOaA/nwUoEXfjk2owNM/udhVdPCspBmavtQ
   HSciLOokK0Xui2f8QFEkFBlSHcv7XCRy2PEQCZPaKe+GB0O/fKc0zWN+h
   Uo4d8CFyl4L6WlOo1SFZtiGz1Uh2xkJtcGjHBewiQhbUvaBK2PADsyRFw
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="273013086"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="273013086"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 08:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="579119349"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Aug 2022 08:42:26 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJczR-000IaF-1N;
	Thu, 04 Aug 2022 15:42:25 +0000
Date: Thu, 4 Aug 2022 23:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Lindgren <tony@atomide.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: drivers/clocksource/timer-ti-dm.c:1039:34: warning: unused variable
 'omap_timer_match'
Message-ID: <202208042325.gDk2PAQf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tony,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1
commit: ab0bbef3ae0f6b5a3b60671cd0124d0fc4fc2567 clocksource/drivers/timer-ti-dm: Make timer selectable for ARCH_K3
date:   8 days ago
config: hexagon-randconfig-r011-20220804 (https://download.01.org/0day-ci/archive/20220804/202208042325.gDk2PAQf-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ab0bbef3ae0f6b5a3b60671cd0124d0fc4fc2567
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ab0bbef3ae0f6b5a3b60671cd0124d0fc4fc2567
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/clocksource/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clocksource/timer-ti-dm.c:1039:34: warning: unused variable 'omap_timer_match' [-Wunused-const-variable]
   static const struct of_device_id omap_timer_match[] = {
                                    ^
   1 warning generated.


vim +/omap_timer_match +1039 drivers/clocksource/timer-ti-dm.c

d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1038  
9725f4451a9ccd arch/arm/plat-omap/dmtimer.c Jon Hunter     2012-05-14 @1039  static const struct of_device_id omap_timer_match[] = {
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1040  	{
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1041  		.compatible = "ti,omap2420-timer",
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1042  	},
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1043  	{
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1044  		.compatible = "ti,omap3430-timer",
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1045  		.data = &omap3plus_pdata,
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1046  	},
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1047  	{
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1048  		.compatible = "ti,omap4430-timer",
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1049  		.data = &omap3plus_pdata,
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1050  	},
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1051  	{
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1052  		.compatible = "ti,omap5430-timer",
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1053  		.data = &omap3plus_pdata,
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1054  	},
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1055  	{
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1056  		.compatible = "ti,am335x-timer",
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1057  		.data = &omap3plus_pdata,
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1058  	},
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1059  	{
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1060  		.compatible = "ti,am335x-timer-1ms",
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1061  		.data = &omap3plus_pdata,
d1c6ccfe3dbdd2 arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1062  	},
8c0cabd7970c0d arch/arm/plat-omap/dmtimer.c Neil Armstrong 2015-10-22  1063  	{
8c0cabd7970c0d arch/arm/plat-omap/dmtimer.c Neil Armstrong 2015-10-22  1064  		.compatible = "ti,dm816-timer",
8c0cabd7970c0d arch/arm/plat-omap/dmtimer.c Neil Armstrong 2015-10-22  1065  		.data = &omap3plus_pdata,
8c0cabd7970c0d arch/arm/plat-omap/dmtimer.c Neil Armstrong 2015-10-22  1066  	},
9725f4451a9ccd arch/arm/plat-omap/dmtimer.c Jon Hunter     2012-05-14  1067  	{},
9725f4451a9ccd arch/arm/plat-omap/dmtimer.c Jon Hunter     2012-05-14  1068  };
9725f4451a9ccd arch/arm/plat-omap/dmtimer.c Jon Hunter     2012-05-14  1069  MODULE_DEVICE_TABLE(of, omap_timer_match);
9725f4451a9ccd arch/arm/plat-omap/dmtimer.c Jon Hunter     2012-05-14  1070  

:::::: The code at line 1039 was first introduced by commit
:::::: 9725f4451a9ccd159b1d13f63e05896cd9bce07d ARM: OMAP: Add DT support for timer driver

:::::: TO: Jon Hunter <jon-hunter@ti.com>
:::::: CC: Jon Hunter <jon-hunter@ti.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
