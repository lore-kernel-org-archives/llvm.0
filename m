Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8CF23B7
	for <llvm@lists.linux.dev>; Sun, 11 Jun 2023 16:36:34 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-653f9c7b3e4so2688603b3a.2
        for <llvm@lists.linux.dev>; Sun, 11 Jun 2023 09:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686501393; x=1689093393;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUvO2TCYGirAYbGLJLIna0SIwoDnkDAoyWbwoTdhGLA=;
        b=u5YhC6B9aOxD7dIw81nMWhPZJEkCZmzZt29x116VkKUR+oBnRlpTzvemLGS6uE0uW8
         IhXCCR9RIPjqH3NbqmEGNBoqJLRq1mnveOFx/KjOwCsMzE7xhSC693akFzS43gXo6M5H
         16fLepMY31kjrpTOzDm3SSofkkklKfrWXNZfkjhr51H6dSPnE39H1b59cw+PWLIocjMd
         z9Y4W9PPRlVZRwmUrcZf3gGP0fcHadIuX9A8Ohl6GI+dkod02+903Y3C4cWOS0CGHqWt
         d76J2it7ztLNsPmKXo+DX3GLb2wfC/h6ytXQpsl1BUHau93oGhRhI8k8rY9fGiMk2/9u
         uOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686501393; x=1689093393;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUvO2TCYGirAYbGLJLIna0SIwoDnkDAoyWbwoTdhGLA=;
        b=OPyjkdfneEEuGbEfUA4fRMqmzpuGZJdyt+d0zNtWaK193p2Fhd+YFB0EudnFQ3z0qz
         R0Wp16HuIvnEzyDezrL9VNIKFE6IrT7AUTHvwwhqB0MdZ4DyeJ9FDCY1M91ltEgXVGLp
         FcpqdWPhzE42cUOeVByZtyBMCFho2qExCTkc7plO6cCZrmjXfVcTq1KV5HBrJ/oSqmAE
         JDYB9xUlc30fRovf0f3BvkE9925qyLUgCV/IfJLq2F3Bjci9O1uNiDhEMDnq1xl1NJUK
         SzsGwNfMUQIgBHAHaVqKNETcpQ71nKM7dyY1WEbkaK96z4L4dY4yzX9tPErQRBl281mV
         Rq9w==
X-Gm-Message-State: AC+VfDxt0JucQMghF0eHuXlnIqAsu9vj8FbZcMuOz0h3sm1pND9PdHJs
	5F78bPipN2g9JKxgK+6WZkME
X-Google-Smtp-Source: ACHHUZ4OOjy3tStCPSvum+BnHLsRzIrQhFNrUMWjXE014c6JOfVeL23yh/gwzu4jGD7Z80/RG105QA==
X-Received: by 2002:a05:6a21:6811:b0:10f:500b:18a2 with SMTP id wr17-20020a056a21681100b0010f500b18a2mr6960902pzb.48.1686501393418;
        Sun, 11 Jun 2023 09:36:33 -0700 (PDT)
Received: from thinkpad ([103.28.246.116])
        by smtp.gmail.com with ESMTPSA id l6-20020a632506000000b00513973a7014sm5953884pgl.12.2023.06.11.09.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 09:36:32 -0700 (PDT)
Date: Sun, 11 Jun 2023 22:06:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hemant Kumar <hemantk@codeaurora.org>,
	Alex Elder <elder@linaro.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [stable:linux-5.15.y 9400/9999] drivers/bus/mhi/host/pm.c:733:6:
 warning: stack frame size (2768) exceeds limit (2048) in 'mhi_pm_st_worker'
Message-ID: <20230611163626.GA28607@thinkpad>
References: <202306100303.KZViMwBJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202306100303.KZViMwBJ-lkp@intel.com>

On Sat, Jun 10, 2023 at 03:26:35AM +0800, kernel test robot wrote:
> Hi Manivannan,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
> head:   7349e40704a0209a2af8b37fa876322209de9684
> commit: 9fbf10148f31a63b6d8c2b0e56cb97eb173d600b [9400/9999] bus: mhi: Move host MHI code to "host" directory
> config: riscv-randconfig-r001-20230609 (https://download.01.org/0day-ci/archive/20230610/202306100303.KZViMwBJ-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=9fbf10148f31a63b6d8c2b0e56cb97eb173d600b
>         git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>         git fetch --no-tags stable linux-5.15.y
>         git checkout 9fbf10148f31a63b6d8c2b0e56cb97eb173d600b
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/bus/mhi/host/

I couldn't reproduce the issue with these steps and also with checkstack script.
So ignoring this for now.

- Mani

> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306100303.KZViMwBJ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/bus/mhi/host/pm.c:733:6: warning: stack frame size (2768) exceeds limit (2048) in 'mhi_pm_st_worker' [-Wframe-larger-than]
>    void mhi_pm_st_worker(struct work_struct *work)
>         ^
>    1 warning generated.
> 
> 
> vim +/mhi_pm_st_worker +733 drivers/bus/mhi/host/pm.c
> 
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  731  
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  732  /* Device State Transition worker */
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20 @733  void mhi_pm_st_worker(struct work_struct *work)
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  734  {
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  735  	struct state_transition *itr, *tmp;
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  736  	LIST_HEAD(head);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  737  	struct mhi_controller *mhi_cntrl = container_of(work,
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  738  							struct mhi_controller,
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  739  							st_worker);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  740  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  741  
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  742  	spin_lock_irq(&mhi_cntrl->transition_lock);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  743  	list_splice_tail_init(&mhi_cntrl->transition_list, &head);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  744  	spin_unlock_irq(&mhi_cntrl->transition_lock);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  745  
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  746  	list_for_each_entry_safe(itr, tmp, &head, node) {
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  747  		list_del(&itr->node);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  748  		dev_dbg(dev, "Handling state transition: %s\n",
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  749  			TO_DEV_STATE_TRANS_STR(itr->state));
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  750  
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  751  		switch (itr->state) {
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  752  		case DEV_ST_TRANSITION_PBL:
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  753  			write_lock_irq(&mhi_cntrl->pm_lock);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  754  			if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  755  				mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  756  			write_unlock_irq(&mhi_cntrl->pm_lock);
> 560e3a045961ed drivers/bus/mhi/core/pm.c Bhaumik Bhatt         2020-05-21  757  			mhi_fw_load_handler(mhi_cntrl);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  758  			break;
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  759  		case DEV_ST_TRANSITION_SBL:
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  760  			write_lock_irq(&mhi_cntrl->pm_lock);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  761  			mhi_cntrl->ee = MHI_EE_SBL;
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  762  			write_unlock_irq(&mhi_cntrl->pm_lock);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  763  			/*
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  764  			 * The MHI devices are only created when the client
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  765  			 * device switches its Execution Environment (EE) to
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  766  			 * either SBL or AMSS states
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  767  			 */
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  768  			mhi_create_devices(mhi_cntrl);
> 4884362f6977fc drivers/bus/mhi/core/pm.c Bhaumik Bhatt         2021-02-24  769  			if (mhi_cntrl->fbc_download)
> 4884362f6977fc drivers/bus/mhi/core/pm.c Bhaumik Bhatt         2021-02-24  770  				mhi_download_amss_image(mhi_cntrl);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  771  			break;
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  772  		case DEV_ST_TRANSITION_MISSION_MODE:
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  773  			mhi_pm_mission_mode_transition(mhi_cntrl);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  774  			break;
> 66ac7985b2af31 drivers/bus/mhi/core/pm.c Carl Yin              2021-03-29  775  		case DEV_ST_TRANSITION_FP:
> 66ac7985b2af31 drivers/bus/mhi/core/pm.c Carl Yin              2021-03-29  776  			write_lock_irq(&mhi_cntrl->pm_lock);
> 66ac7985b2af31 drivers/bus/mhi/core/pm.c Carl Yin              2021-03-29  777  			mhi_cntrl->ee = MHI_EE_FP;
> 66ac7985b2af31 drivers/bus/mhi/core/pm.c Carl Yin              2021-03-29  778  			write_unlock_irq(&mhi_cntrl->pm_lock);
> 66ac7985b2af31 drivers/bus/mhi/core/pm.c Carl Yin              2021-03-29  779  			mhi_create_devices(mhi_cntrl);
> 66ac7985b2af31 drivers/bus/mhi/core/pm.c Carl Yin              2021-03-29  780  			break;
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  781  		case DEV_ST_TRANSITION_READY:
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  782  			mhi_ready_state_transition(mhi_cntrl);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  783  			break;
> bc7ccce5a5192c drivers/bus/mhi/core/pm.c Hemant Kumar          2020-05-21  784  		case DEV_ST_TRANSITION_SYS_ERR:
> 556bbb442bbb44 drivers/bus/mhi/core/pm.c Bhaumik Bhatt         2020-11-09  785  			mhi_pm_sys_error_transition(mhi_cntrl);
> bc7ccce5a5192c drivers/bus/mhi/core/pm.c Hemant Kumar          2020-05-21  786  			break;
> 3c1bd0047124f5 drivers/bus/mhi/core/pm.c Hemant Kumar          2020-05-21  787  		case DEV_ST_TRANSITION_DISABLE:
> a03c7a86e12721 drivers/bus/mhi/core/pm.c Bhaumik Bhatt         2020-11-09  788  			mhi_pm_disable_transition(mhi_cntrl);
> 3c1bd0047124f5 drivers/bus/mhi/core/pm.c Hemant Kumar          2020-05-21  789  			break;
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  790  		default:
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  791  			break;
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  792  		}
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  793  		kfree(itr);
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  794  	}
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  795  }
> a6e2e3522f2914 drivers/bus/mhi/core/pm.c Manivannan Sadhasivam 2020-02-20  796  
> 
> :::::: The code at line 733 was first introduced by commit
> :::::: a6e2e3522f29141b95c1ef8580c665a3582b3e66 bus: mhi: core: Add support for PM state transitions
> 
> :::::: TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
மணிவண்ணன் சதாசிவம்
