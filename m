Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEF61846;
	Sat, 13 May 2023 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683979992; x=1715515992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gAQhb9mzpbMYwi5NcArK3mdl8GclsbYhzOu4c26BJZA=;
  b=jMA8knvjP29YNJpaSbxtVm3Ulf0PQo2yadx+kM4fzHHAwB73U+JCIjdE
   pDRkfCI4TfqmdN/IvpEECx2piF6+VtNWvgNxVp3F1sgrkdlscFbfhi4TX
   hI0ufF27eZsrF4PYCuFVOEumXydtuhumXxXkOa4e8Xq8CH0hK2QQdCOTw
   iXPgXQbWkpUHhSi7YoBMWQFVSiBo0cxUP4Ddj4fM9pNx7mDAjQhYeTHhi
   P11temhc7bp1dSUMsGPGQ4D/25zP3Z4Ly4ErXgzk7eobZVVbVjaiz40K7
   o3xxwXT+W8Ty9vGllBKfKV/RhKlzHcNC2peToU4OjnI/psPY6mgdb3sm+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="353216871"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="353216871"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 05:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="700451204"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="700451204"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 May 2023 05:13:10 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxo7Z-0005U4-1X;
	Sat, 13 May 2023 12:13:09 +0000
Date: Sat, 13 May 2023 20:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/6.1 154/183]
 drivers/gpu/drm/msm/msm_drv.c:567:1: warning: unused label 'err_put_dev'
Message-ID: <202305132013.OTjUZVR5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/6.1
head:   b35b1f6de36bba692669bc17cc73a8c04ab72347
commit: 33b0190e2d33a31066ff655c30500bd4fb6dbd91 [154/183] drm/msm: fix workqueue leak on bind errors
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230513/202305132013.OTjUZVR5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=33b0190e2d33a31066ff655c30500bd4fb6dbd91
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/6.1
        git checkout 33b0190e2d33a31066ff655c30500bd4fb6dbd91
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305132013.OTjUZVR5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_drv.c:567:1: warning: unused label 'err_put_dev' [-Wunused-label]
   err_put_dev:
   ^~~~~~~~~~~~
   1 warning generated.


vim +/err_put_dev +567 drivers/gpu/drm/msm/msm_drv.c

c8afe684c95cd1 Rob Clark         2013-06-26  548  
2b669875332fbd Archit Taneja     2016-05-02  549  	ret = msm_debugfs_late_init(ddev);
a7d3c9509b2fec Rob Clark         2014-05-30  550  	if (ret)
77050c3febb180 Jeykumar Sankaran 2018-06-27  551  		goto err_msm_uninit;
a7d3c9509b2fec Rob Clark         2014-05-30  552  
2b669875332fbd Archit Taneja     2016-05-02  553  	drm_kms_helper_poll_init(ddev);
c8afe684c95cd1 Rob Clark         2013-06-26  554  
c8afe684c95cd1 Rob Clark         2013-06-26  555  	return 0;
c8afe684c95cd1 Rob Clark         2013-06-26  556  
77050c3febb180 Jeykumar Sankaran 2018-06-27  557  err_msm_uninit:
2b669875332fbd Archit Taneja     2016-05-02  558  	msm_drm_uninit(dev);
005811446f06d8 Johan Hovold      2023-03-06  559  
005811446f06d8 Johan Hovold      2023-03-06  560  	return ret;
005811446f06d8 Johan Hovold      2023-03-06  561  
c91b75f465d975 Johan Hovold      2023-03-06  562  err_deinit_vram:
c91b75f465d975 Johan Hovold      2023-03-06  563  	msm_deinit_vram(ddev);
33b0190e2d33a3 Johan Hovold      2023-03-06  564  err_cleanup_mode_config:
33b0190e2d33a3 Johan Hovold      2023-03-06  565  	drm_mode_config_cleanup(ddev);
33b0190e2d33a3 Johan Hovold      2023-03-06  566  	destroy_workqueue(priv->wq);
005811446f06d8 Johan Hovold      2023-03-06 @567  err_put_dev:
005811446f06d8 Johan Hovold      2023-03-06  568  	drm_dev_put(ddev);
005811446f06d8 Johan Hovold      2023-03-06  569  
c8afe684c95cd1 Rob Clark         2013-06-26  570  	return ret;
c8afe684c95cd1 Rob Clark         2013-06-26  571  }
c8afe684c95cd1 Rob Clark         2013-06-26  572  

:::::: The code at line 567 was first introduced by commit
:::::: 005811446f06d8b939b0c0ef55ade26cb655391c drm/msm: fix drm device leak on bind errors

:::::: TO: Johan Hovold <johan+linaro@kernel.org>
:::::: CC: Sasha Levin <sashal@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
