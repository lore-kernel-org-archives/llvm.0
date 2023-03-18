Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63A5EC1;
	Sat, 18 Mar 2023 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679133225; x=1710669225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T3NJrP8ip9ZvG1SFkeZjmXqQW7/RnZzlvX8z/EVRNag=;
  b=b/LtaEYNUp8JrEGyC8jctJNsww5PIjIlgUmkQtt68RDqD/nSeHfv5vMD
   T/09CSUilnfkA4xmY5XqYztRiOLCl9kG3gWNwsYWpvPveBJjt7X+Y0nvK
   0o45nPjkXKSrCXaT288642yBnBx/RhFcutm+RyUtGlsrmeesa1/XOYLgk
   rFOXwsizMqWjWUiHq6uRD4oOidCzA/ZC/nXsyTaTtbNur7GYBVOqO/WWy
   jblwJbswgHeW28JpuHDX9IDdbe76hzYKL8Wl6/hlVeo1ZruXmm2d/l+na
   H6sXPFqGU+APqGplV3VB1st/2sW3WSmxOETjTC3BE5VTGhoif7JBJDcBf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="322270138"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="322270138"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 02:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="791033739"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="791033739"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2023 02:53:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdTFs-0009yy-1Z;
	Sat, 18 Mar 2023 09:53:40 +0000
Date: Sat, 18 Mar 2023 17:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Wang <zyytlz.wz@163.com>, arnd@arndb.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	hackerzheng666@gmail.com, 1395428693sheep@gmail.com,
	alex000young@gmail.com, Zheng Wang <zyytlz.wz@163.com>
Subject: Re: [PATCH RESEND] misc: ti-st: st_kim: Fix use after free bug in
 kim_remove due to race condition
Message-ID: <202303181724.0bgWKpe9-lkp@intel.com>
References: <20230318081743.797531-1-zyytlz.wz@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230318081743.797531-1-zyytlz.wz@163.com>

Hi Zheng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.3-rc2 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zheng-Wang/misc-ti-st-st_kim-Fix-use-after-free-bug-in-kim_remove-due-to-race-condition/20230318-161853
patch link:    https://lore.kernel.org/r/20230318081743.797531-1-zyytlz.wz%40163.com
patch subject: [PATCH RESEND] misc: ti-st: st_kim: Fix use after free bug in kim_remove due to race condition
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230318/202303181724.0bgWKpe9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ecbe190b970112b4b10e2a1766da933168ae5fdd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zheng-Wang/misc-ti-st-st_kim-Fix-use-after-free-bug-in-kim_remove-due-to-race-condition/20230318-161853
        git checkout ecbe190b970112b4b10e2a1766da933168ae5fdd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/misc/ti-st/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181724.0bgWKpe9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/ti-st/st_kim.c:788:31: warning: variable 'kim_gdata' is uninitialized when used here [-Wuninitialized]
           struct st_data_s *st_gdata = kim_gdata->core_data;
                                        ^~~~~~~~~
   drivers/misc/ti-st/st_kim.c:787:30: note: initialize the variable 'kim_gdata' to silence this warning
           struct kim_data_s       *kim_gdata;
                                             ^
                                              = NULL
   1 warning generated.


vim +/kim_gdata +788 drivers/misc/ti-st/st_kim.c

   782	
   783	static int kim_remove(struct platform_device *pdev)
   784	{
   785		/* free the GPIOs requested */
   786		struct ti_st_plat_data	*pdata = pdev->dev.platform_data;
   787		struct kim_data_s	*kim_gdata;
 > 788		struct st_data_s *st_gdata = kim_gdata->core_data;
   789	
   790		kim_gdata = platform_get_drvdata(pdev);
   791	
   792		cancel_work_sync(&st_gdata->work_write_wakeup);
   793	
   794		/*
   795		 * Free the Bluetooth/FM/GPIO
   796		 * nShutdown gpio from the system
   797		 */
   798		gpio_free(pdata->nshutdown_gpio);
   799		pr_info("nshutdown GPIO Freed");
   800	
   801		debugfs_remove_recursive(kim_debugfs_dir);
   802		sysfs_remove_group(&pdev->dev.kobj, &uim_attr_grp);
   803		pr_info("sysfs entries removed");
   804	
   805		kim_gdata->kim_pdev = NULL;
   806		st_core_exit(st_gdata);
   807	
   808		kfree(kim_gdata);
   809		kim_gdata = NULL;
   810		return 0;
   811	}
   812	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
