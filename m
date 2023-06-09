Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FAF408FD;
	Fri,  9 Jun 2023 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686338805; x=1717874805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T3G1dKhXZoZ0L+fduIGltxF4o4BVMOKjo0mz8e9pY0A=;
  b=ffqYC2a5h78TGn5JL7JwnXKuZszlx5MK5MbSjeTFTEigJnQ2+bNZgZsu
   O91a78+VcnIYhALR1WzYGsG+lVdFE2AE6xFm0IZLABwshEljHpFt002K3
   ZMtba6cSeNKBGlfaddno4Yz+ArAbg74u5lwuPQc8pF5ilSCIeSzprqi/g
   KS1uK+qht0iGQk9Hg95y5eTovOp78IJ/2plCwSYC5P1hcsFoS8SZRxmS4
   nuJSTxgWGEVUo4bcNjQqJ81QQXMkLjD8UKzAcp98nSw4FNFSTFxthyHmp
   /hkUJgMbECGzFh5vt/xjtCZiqqJ12/vG7gsckNLx7yOn3JzB16RzxXixe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="355161996"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="355161996"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 12:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="800318730"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="800318730"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2023 12:26:42 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7hkv-0009KW-0t;
	Fri, 09 Jun 2023 19:26:41 +0000
Date: Sat, 10 Jun 2023 03:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hemant Kumar <hemantk@codeaurora.org>,
	Alex Elder <elder@linaro.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 9400/9999] drivers/bus/mhi/host/pm.c:733:6:
 warning: stack frame size (2768) exceeds limit (2048) in 'mhi_pm_st_worker'
Message-ID: <202306100303.KZViMwBJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Manivannan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   7349e40704a0209a2af8b37fa876322209de9684
commit: 9fbf10148f31a63b6d8c2b0e56cb97eb173d600b [9400/9999] bus: mhi: Move host MHI code to "host" directory
config: riscv-randconfig-r001-20230609 (https://download.01.org/0day-ci/archive/20230610/202306100303.KZViMwBJ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=9fbf10148f31a63b6d8c2b0e56cb97eb173d600b
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 9fbf10148f31a63b6d8c2b0e56cb97eb173d600b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/bus/mhi/host/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100303.KZViMwBJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/pm.c:733:6: warning: stack frame size (2768) exceeds limit (2048) in 'mhi_pm_st_worker' [-Wframe-larger-than]
   void mhi_pm_st_worker(struct work_struct *work)
        ^
   1 warning generated.


vim +/mhi_pm_st_worker +733 drivers/bus/mhi/host/pm.c

a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  731  
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  732  /* Device State Transition worker */
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 @733  void mhi_pm_st_worker(struct work_struct *work)
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  734  {
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  735  	struct state_transition *itr, *tmp;
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  736  	LIST_HEAD(head);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  737  	struct mhi_controller *mhi_cntrl = container_of(work,
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  738  							struct mhi_controller,
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  739  							st_worker);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  740  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  741  
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  742  	spin_lock_irq(&mhi_cntrl->transition_lock);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  743  	list_splice_tail_init(&mhi_cntrl->transition_list, &head);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  744  	spin_unlock_irq(&mhi_cntrl->transition_lock);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  745  
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  746  	list_for_each_entry_safe(itr, tmp, &head, node) {
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  747  		list_del(&itr->node);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  748  		dev_dbg(dev, "Handling state transition: %s\n",
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  749  			TO_DEV_STATE_TRANS_STR(itr->state));
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  750  
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  751  		switch (itr->state) {
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  752  		case DEV_ST_TRANSITION_PBL:
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  753  			write_lock_irq(&mhi_cntrl->pm_lock);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  754  			if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  755  				mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  756  			write_unlock_irq(&mhi_cntrl->pm_lock);
560e3a045961ed drivers/bus/mhi/core/pm.c Bhaumik Bhatt         2020-05-21  757  			mhi_fw_load_handler(mhi_cntrl);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  758  			break;
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  759  		case DEV_ST_TRANSITION_SBL:
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  760  			write_lock_irq(&mhi_cntrl->pm_lock);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  761  			mhi_cntrl->ee = MHI_EE_SBL;
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  762  			write_unlock_irq(&mhi_cntrl->pm_lock);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  763  			/*
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  764  			 * The MHI devices are only created when the client
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  765  			 * device switches its Execution Environment (EE) to
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  766  			 * either SBL or AMSS states
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  767  			 */
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  768  			mhi_create_devices(mhi_cntrl);
4884362f6977fc drivers/bus/mhi/core/pm.c Bhaumik Bhatt         2021-02-24  769  			if (mhi_cntrl->fbc_download)
4884362f6977fc drivers/bus/mhi/core/pm.c Bhaumik Bhatt         2021-02-24  770  				mhi_download_amss_image(mhi_cntrl);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  771  			break;
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  772  		case DEV_ST_TRANSITION_MISSION_MODE:
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  773  			mhi_pm_mission_mode_transition(mhi_cntrl);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  774  			break;
66ac7985b2af31 drivers/bus/mhi/core/pm.c Carl Yin              2021-03-29  775  		case DEV_ST_TRANSITION_FP:
66ac7985b2af31 drivers/bus/mhi/core/pm.c Carl Yin              2021-03-29  776  			write_lock_irq(&mhi_cntrl->pm_lock);
66ac7985b2af31 drivers/bus/mhi/core/pm.c Carl Yin              2021-03-29  777  			mhi_cntrl->ee = MHI_EE_FP;
66ac7985b2af31 drivers/bus/mhi/core/pm.c Carl Yin              2021-03-29  778  			write_unlock_irq(&mhi_cntrl->pm_lock);
66ac7985b2af31 drivers/bus/mhi/core/pm.c Carl Yin              2021-03-29  779  			mhi_create_devices(mhi_cntrl);
66ac7985b2af31 drivers/bus/mhi/core/pm.c Carl Yin              2021-03-29  780  			break;
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  781  		case DEV_ST_TRANSITION_READY:
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  782  			mhi_ready_state_transition(mhi_cntrl);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  783  			break;
bc7ccce5a5192c drivers/bus/mhi/core/pm.c Hemant Kumar          2020-05-21  784  		case DEV_ST_TRANSITION_SYS_ERR:
556bbb442bbb44 drivers/bus/mhi/core/pm.c Bhaumik Bhatt         2020-11-09  785  			mhi_pm_sys_error_transition(mhi_cntrl);
bc7ccce5a5192c drivers/bus/mhi/core/pm.c Hemant Kumar          2020-05-21  786  			break;
3c1bd0047124f5 drivers/bus/mhi/core/pm.c Hemant Kumar          2020-05-21  787  		case DEV_ST_TRANSITION_DISABLE:
a03c7a86e12721 drivers/bus/mhi/core/pm.c Bhaumik Bhatt         2020-11-09  788  			mhi_pm_disable_transition(mhi_cntrl);
3c1bd0047124f5 drivers/bus/mhi/core/pm.c Hemant Kumar          2020-05-21  789  			break;
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  790  		default:
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  791  			break;
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  792  		}
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  793  		kfree(itr);
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  794  	}
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  795  }
a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  796  

:::::: The code at line 733 was first introduced by commit
:::::: a6e2e3522f29141b95c1ef8580c665a3582b3e66 bus: mhi: core: Add support for PM state transitions

:::::: TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
