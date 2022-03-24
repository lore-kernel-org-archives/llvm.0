Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D987E
	for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 11:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648121400; x=1679657400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jILFcAeNU83ER7svcSNKgH8mEMnuD6CHOGe5PAAcvkQ=;
  b=U1zcf5BROo+tnGppoek6gnwslFvCHjpDwR0GJGO4CbkS17+/ujlaTnyQ
   1ljwr/DCafFD+wDtlW/Y/VIMHfBulZU/801PjyGLyi2121UBSkYrbjwPP
   cbbqym4xq9G4gm+xi48kCtDOVdFgcaWM8Gje3YJF7iKjjmpxhXjCh9ntm
   NNbhVy5vLdQmfVPR60PAUlmcgqcqyNw5hR1UmaR1NJmH69ZyARkXZvzhi
   3T7OQhwxCyldhZBPR5ZSlp+YYj5KTPmO3X5EZDTT5wEoxXPFgY7+eKNfq
   jfEm+9xTncu/LIjBLTO7equhiHTj51tSoufxf+lCUbq3HLmmn2k+/mXGM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="258305422"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; 
   d="scan'208";a="258305422"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2022 04:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; 
   d="scan'208";a="519746154"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Mar 2022 04:29:58 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nXLfB-000L1h-KD; Thu, 24 Mar 2022 11:29:57 +0000
Date: Thu, 24 Mar 2022 19:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hemant Kumar <hemantk@codeaurora.org>,
	Alex Elder <elder@linaro.org>
Subject: [linux-next:master 9467/14268] drivers/bus/mhi/host/main.c:794:13:
 warning: parameter 'event_quota' set but not used
Message-ID: <202203241958.Uw9bWfMD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b61581ae229d8eb9f21f8753be3f4011f7692384
commit: 31e763fd7be65e3cc1cbe326d5a6b1a8c05fa3b9 [9467/14268] bus: mhi: Move host MHI code to "host" directory
config: arm-randconfig-r001-20220324 (https://download.01.org/0day-ci/archive/20220324/202203241958.Uw9bWfMD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=31e763fd7be65e3cc1cbe326d5a6b1a8c05fa3b9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 31e763fd7be65e3cc1cbe326d5a6b1a8c05fa3b9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/bus/mhi/host/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/main.c:794:13: warning: parameter 'event_quota' set but not used [-Wunused-but-set-parameter]
                                u32 event_quota)
                                    ^
   1 warning generated.


vim +/event_quota +794 drivers/bus/mhi/host/main.c

1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  791  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  792  int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  793  			     struct mhi_event *mhi_event,
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20 @794  			     u32 event_quota)
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  795  {
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  796  	struct mhi_tre *dev_rp, *local_rp;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  797  	struct mhi_ring *ev_ring = &mhi_event->ring;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  798  	struct mhi_event_ctxt *er_ctxt =
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  799  		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  800  	struct mhi_chan *mhi_chan;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  801  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  802  	u32 chan;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  803  	int count = 0;
022eed2fcfac9f drivers/bus/mhi/core/main.c Paul Davey            2021-08-12  804  	dma_addr_t ptr = le64_to_cpu(er_ctxt->rp);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  805  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  806  	/*
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  807  	 * This is a quick check to avoid unnecessary event processing
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  808  	 * in case MHI is already in error state, but it's still possible
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  809  	 * to transition to error state while processing events
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  810  	 */
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  811  	if (unlikely(MHI_EVENT_ACCESS_INVALID(mhi_cntrl->pm_state)))
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  812  		return -EIO;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  813  
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  814  	if (!is_valid_ring_ptr(ev_ring, ptr)) {
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  815  		dev_err(&mhi_cntrl->mhi_dev->dev,
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  816  			"Event ring rp points outside of the event ring\n");
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  817  		return -EIO;
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  818  	}
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  819  
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  820  	dev_rp = mhi_to_virtual(ev_ring, ptr);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  821  	local_rp = ev_ring->rp;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  822  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  823  	while (dev_rp != local_rp) {
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  824  		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  825  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  826  		switch (type) {
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  827  		case MHI_PKT_TYPE_BW_REQ_EVENT:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  828  		{
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  829  			struct mhi_link_info *link_info;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  830  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  831  			link_info = &mhi_cntrl->mhi_link_info;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  832  			write_lock_irq(&mhi_cntrl->pm_lock);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  833  			link_info->target_link_speed =
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  834  				MHI_TRE_GET_EV_LINKSPEED(local_rp);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  835  			link_info->target_link_width =
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  836  				MHI_TRE_GET_EV_LINKWIDTH(local_rp);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  837  			write_unlock_irq(&mhi_cntrl->pm_lock);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  838  			dev_dbg(dev, "Received BW_REQ event\n");
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  839  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_BW_REQ);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  840  			break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  841  		}
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  842  		case MHI_PKT_TYPE_STATE_CHANGE_EVENT:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  843  		{
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  844  			enum mhi_state new_state;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  845  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  846  			new_state = MHI_TRE_GET_EV_STATE(local_rp);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  847  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  848  			dev_dbg(dev, "State change event to state: %s\n",
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  849  				TO_MHI_STATE_STR(new_state));
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  850  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  851  			switch (new_state) {
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  852  			case MHI_STATE_M0:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  853  				mhi_pm_m0_transition(mhi_cntrl);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  854  				break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  855  			case MHI_STATE_M1:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  856  				mhi_pm_m1_transition(mhi_cntrl);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  857  				break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  858  			case MHI_STATE_M3:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  859  				mhi_pm_m3_transition(mhi_cntrl);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  860  				break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  861  			case MHI_STATE_SYS_ERR:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  862  			{
683e77cadc839b drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2021-04-09  863  				enum mhi_pm_state pm_state;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  864  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  865  				dev_dbg(dev, "System error detected\n");
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  866  				write_lock_irq(&mhi_cntrl->pm_lock);
683e77cadc839b drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2021-04-09  867  				pm_state = mhi_tryset_pm_state(mhi_cntrl,
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  868  							MHI_PM_SYS_ERR_DETECT);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  869  				write_unlock_irq(&mhi_cntrl->pm_lock);
683e77cadc839b drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2021-04-09  870  				if (pm_state == MHI_PM_SYS_ERR_DETECT)
bc7ccce5a5192c drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  871  					mhi_pm_sys_err_handler(mhi_cntrl);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  872  				break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  873  			}
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  874  			default:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  875  				dev_err(dev, "Invalid state: %s\n",
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  876  					TO_MHI_STATE_STR(new_state));
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  877  			}
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  878  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  879  			break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  880  		}
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  881  		case MHI_PKT_TYPE_CMD_COMPLETION_EVENT:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  882  			mhi_process_cmd_completion(mhi_cntrl, local_rp);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  883  			break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  884  		case MHI_PKT_TYPE_EE_EVENT:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  885  		{
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  886  			enum dev_st_transition st = DEV_ST_TRANSITION_MAX;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  887  			enum mhi_ee_type event = MHI_TRE_GET_EV_EXECENV(local_rp);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  888  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  889  			dev_dbg(dev, "Received EE event: %s\n",
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  890  				TO_MHI_EXEC_STR(event));
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  891  			switch (event) {
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  892  			case MHI_EE_SBL:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  893  				st = DEV_ST_TRANSITION_SBL;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  894  				break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  895  			case MHI_EE_WFW:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  896  			case MHI_EE_AMSS:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  897  				st = DEV_ST_TRANSITION_MISSION_MODE;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  898  				break;
66ac7985b2af31 drivers/bus/mhi/core/main.c Carl Yin              2021-03-29  899  			case MHI_EE_FP:
66ac7985b2af31 drivers/bus/mhi/core/main.c Carl Yin              2021-03-29  900  				st = DEV_ST_TRANSITION_FP;
66ac7985b2af31 drivers/bus/mhi/core/main.c Carl Yin              2021-03-29  901  				break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  902  			case MHI_EE_RDDM:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  903  				mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  904  				write_lock_irq(&mhi_cntrl->pm_lock);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  905  				mhi_cntrl->ee = event;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  906  				write_unlock_irq(&mhi_cntrl->pm_lock);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  907  				wake_up_all(&mhi_cntrl->state_event);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  908  				break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  909  			default:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  910  				dev_err(dev,
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  911  					"Unhandled EE event: 0x%x\n", type);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  912  			}
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  913  			if (st != DEV_ST_TRANSITION_MAX)
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  914  				mhi_queue_state_transition(mhi_cntrl, st);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  915  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  916  			break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  917  		}
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  918  		case MHI_PKT_TYPE_TX_EVENT:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  919  			chan = MHI_TRE_GET_EV_CHID(local_rp);
020960685041fc drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  920  
020960685041fc drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  921  			WARN_ON(chan >= mhi_cntrl->max_chan);
020960685041fc drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  922  
020960685041fc drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  923  			/*
020960685041fc drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  924  			 * Only process the event ring elements whose channel
020960685041fc drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  925  			 * ID is within the maximum supported range.
020960685041fc drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  926  			 */
020960685041fc drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  927  			if (chan < mhi_cntrl->max_chan) {
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  928  				mhi_chan = &mhi_cntrl->mhi_chan[chan];
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  929  				if (!mhi_chan->configured)
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  930  					break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  931  				parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  932  				event_quota--;
020960685041fc drivers/bus/mhi/core/main.c Hemant Kumar          2020-05-21  933  			}
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  934  			break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  935  		default:
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  936  			dev_err(dev, "Unhandled event type: %d\n", type);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  937  			break;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  938  		}
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  939  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  940  		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  941  		local_rp = ev_ring->rp;
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  942  
022eed2fcfac9f drivers/bus/mhi/core/main.c Paul Davey            2021-08-12  943  		ptr = le64_to_cpu(er_ctxt->rp);
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  944  		if (!is_valid_ring_ptr(ev_ring, ptr)) {
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  945  			dev_err(&mhi_cntrl->mhi_dev->dev,
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  946  				"Event ring rp points outside of the event ring\n");
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  947  			return -EIO;
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  948  		}
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  949  
ec32332df7645e drivers/bus/mhi/core/main.c Jeffrey Hugo          2021-03-10  950  		dev_rp = mhi_to_virtual(ev_ring, ptr);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  951  		count++;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  952  	}
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  953  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  954  	read_lock_bh(&mhi_cntrl->pm_lock);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  955  	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  956  		mhi_ring_er_db(mhi_event);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  957  	read_unlock_bh(&mhi_cntrl->pm_lock);
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  958  
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  959  	return count;
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  960  }
1d3173a3bae703 drivers/bus/mhi/core/main.c Manivannan Sadhasivam 2020-02-20  961  

:::::: The code at line 794 was first introduced by commit
:::::: 1d3173a3bae7039b765a0956e3e4bf846dbaacb8 bus: mhi: core: Add support for processing events from client device

:::::: TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
