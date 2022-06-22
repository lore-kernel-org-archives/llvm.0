Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B85136F
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655893725; x=1687429725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lJUPcnq2nrFDvl/18U2dLdLU11sG6S/hZeKoKy5RGGQ=;
  b=Z9UI4WrifDek6npYJFKK19OLrNk291f4t17yuS/S8GAMP6CxwzypqqNP
   mKi82vpIMthogxRgZU/CW4RWlk6n+Ao247wjousDWIGm6uSMPTPTZcL2I
   0FievtLCwtVqExhx53smwkq5BI7189VDU8lQrX9OIa0Hn3tClJtuOwtBW
   8GN7dOToatJ6FmfuBdQa5XrxHz/6Ci+cmUdA6v++CYG5jdwxwV2oJUDfj
   pWo61Ly0ex8mRxEvUUktmXR8jt4pwfgkHKTclK6+Tc2ZAQKawwpCVBQS2
   hErdk+s+SisdvuOh6IN0as8mFDp/ZayOk40i5PPUpUrkFqtVu33WzG40P
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="342064535"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="342064535"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 03:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="834044369"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2022 03:28:43 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3xbG-00018w-GK;
	Wed, 22 Jun 2022 10:28:42 +0000
Date: Wed, 22 Jun 2022 18:27:59 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vfedorenko@novek.ru>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/3] ptp_ocp: implement DPLL ops
Message-ID: <202206221822.9TNJ02fp-lkp@intel.com>
References: <20220622000651.27299-4-vfedorenko@novek.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622000651.27299-4-vfedorenko@novek.ru>

Hi Vadim,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc3 next-20220622]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/Create-common-DPLL-clock-configuration-API/20220622-080746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ca1fdab7fd27eb069df1384b2850dcd0c2bebe8d
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220622/202206221822.9TNJ02fp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8b8d126598ce7bd5243da7f94f69fa1104288bee)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/bb2b52ab297193cfb419e71db72823a36b11e031
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/Create-common-DPLL-clock-configuration-API/20220622-080746
        git checkout bb2b52ab297193cfb419e71db72823a36b11e031
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/ptp/ptp_ocp.c:3721:45: error: incomplete definition of type 'struct dpll_device'
           struct ptp_ocp *bp = (struct ptp_ocp *)dpll->priv;
                                                  ~~~~^
   drivers/ptp/ptp_ocp.c:339:9: note: forward declaration of 'struct dpll_device'
           struct dpll_device *dpll;
                  ^
   drivers/ptp/ptp_ocp.c:3730:45: error: incomplete definition of type 'struct dpll_device'
           struct ptp_ocp *bp = (struct ptp_ocp *)dpll->priv;
                                                  ~~~~^
   drivers/ptp/ptp_ocp.c:339:9: note: forward declaration of 'struct dpll_device'
           struct dpll_device *dpll;
                  ^
   drivers/ptp/ptp_ocp.c:3739:45: error: incomplete definition of type 'struct dpll_device'
           struct ptp_ocp *bp = (struct ptp_ocp *)dpll->priv;
                                                  ~~~~^
   drivers/ptp/ptp_ocp.c:339:9: note: forward declaration of 'struct dpll_device'
           struct dpll_device *dpll;
                  ^
   drivers/ptp/ptp_ocp.c:3763:45: error: incomplete definition of type 'struct dpll_device'
           struct ptp_ocp *bp = (struct ptp_ocp *)dpll->priv;
                                                  ~~~~^
   drivers/ptp/ptp_ocp.c:339:9: note: forward declaration of 'struct dpll_device'
           struct dpll_device *dpll;
                  ^
   drivers/ptp/ptp_ocp.c:3787:31: warning: tentative definition of variable with internal linkage has incomplete non-array type 'struct dpll_device_ops' [-Wtentative-definition-incomplete-type]
   static struct dpll_device_ops ptp_ocp_dpll_ops {
                                 ^
   drivers/ptp/ptp_ocp.c:3787:15: note: forward declaration of 'struct dpll_device_ops'
   static struct dpll_device_ops ptp_ocp_dpll_ops {
                 ^
>> drivers/ptp/ptp_ocp.c:3787:47: error: expected ';' after top level declarator
   static struct dpll_device_ops ptp_ocp_dpll_ops {
                                                 ^
                                                 ;
>> drivers/ptp/ptp_ocp.c:3850:13: error: call to undeclared function 'dpll_device_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           bp->dpll = dpll_device_alloc(&dpll_ops, ARRAY_SIZE(bp->sma), ARRAY_SIZE(bp->sma));
                      ^
>> drivers/ptp/ptp_ocp.c:3850:32: error: use of undeclared identifier 'dpll_ops'
           bp->dpll = dpll_device_alloc(&dpll_ops, ARRAY_SIZE(bp->sma), ARRAY_SIZE(bp->sma));
                                         ^
>> drivers/ptp/ptp_ocp.c:3855:2: error: call to undeclared function 'dpll_device_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           dpll_device_register(bp->dpll);
           ^
   drivers/ptp/ptp_ocp.c:3855:2: note: did you mean 'device_register'?
   include/linux/device.h:895:18: note: 'device_register' declared here
   int __must_check device_register(struct device *dev);
                    ^
>> drivers/ptp/ptp_ocp.c:3787:31: error: tentative definition has type 'struct dpll_device_ops' that is never completed
   static struct dpll_device_ops ptp_ocp_dpll_ops {
                                 ^
   drivers/ptp/ptp_ocp.c:3787:15: note: forward declaration of 'struct dpll_device_ops'
   static struct dpll_device_ops ptp_ocp_dpll_ops {
                 ^
   1 warning and 9 errors generated.
--
   drivers/dpll/dpll_core.c:19:28: error: redefinition of 'dpll_device_xa'
   static DEFINE_XARRAY_FLAGS(dpll_device_xa, XA_FLAGS_ALLOC);
                              ^
   drivers/dpll/dpll_core.c:18:28: note: previous definition is here
   static DEFINE_XARRAY_ALLOC(dpll_device_xa);
                              ^
>> drivers/dpll/dpll_core.c:37:4: error: expected ')'
                           continue;
                           ^
   drivers/dpll/dpll_core.c:36:6: note: to match this '('
                   if (!xa_get_mark(&dpll_device_xa, index, DPLL_REGISTERED)
                      ^
>> drivers/dpll/dpll_core.c:73:21: error: conflicting types for 'dpll_device_alloc'
   struct dpll_device *dpll_device_alloc(struct dpll_device_ops *ops, int sources_count,
                       ^
   include/linux/dpll.h:21:21: note: previous declaration is here
   struct dpll_device *dpll_device_alloc(struct dpll_device_ops *ops, int sources_count,
                       ^
   3 errors generated.
--
>> drivers/dpll/dpll_netlink.c:227:28: error: use of undeclared identifier 'id'
           dpll_notify_source_change(id, src_id, type);
                                     ^
   drivers/dpll/dpll_netlink.c:252:28: error: use of undeclared identifier 'id'
           dpll_notify_source_change(id, out_id, type);
                                     ^
   drivers/dpll/dpll_netlink.c:580:13: warning: no previous prototype for function 'dpll_netlink_fini' [-Wmissing-prototypes]
   void __exit dpll_netlink_fini(void)
               ^
   drivers/dpll/dpll_netlink.c:580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __exit dpll_netlink_fini(void)
   ^
   static 
   1 warning and 2 errors generated.


vim +3721 drivers/ptp/ptp_ocp.c

  3718	
  3719	static int ptp_ocp_dpll_get_status(struct dpll_device *dpll)
  3720	{
> 3721		struct ptp_ocp *bp = (struct ptp_ocp *)dpll->priv;
  3722		int sync;
  3723	
  3724		sync = ioread32(&bp->reg->status) & OCP_STATUS_IN_SYNC;
  3725		return sync;
  3726	}
  3727	
  3728	static int ptp_ocp_dpll_get_lock_status(struct dpll_device *dpll)
  3729	{
  3730		struct ptp_ocp *bp = (struct ptp_ocp *)dpll->priv;
  3731		int sync;
  3732	
  3733		sync = ioread32(&bp->reg->status) & OCP_STATUS_IN_SYNC;
  3734		return sync;
  3735	}
  3736	
  3737	static int ptp_ocp_dpll_get_source_type(struct dpll_device *dpll, int sma)
  3738	{
  3739		struct ptp_ocp *bp = (struct ptp_ocp *)dpll->priv;
  3740		int ret;
  3741	
  3742		if (bp->sma[sma].mode != SMA_MODE_IN)
  3743			return -1;
  3744	
  3745		switch (ptp_ocp_sma_get(bp, sma)) {
  3746		case 0:
  3747			ret = DPLL_TYPE_EXT_10MHZ;
  3748			break;
  3749		case 1:
  3750		case 2:
  3751			ret = DPLL_TYPE_EXT_1PPS;
  3752			break;
  3753		default:
  3754			ret = DPLL_TYPE_INT_OSCILLATOR;
  3755		}
  3756	
  3757		return ret;
  3758	}
  3759	
  3760	
  3761	static int ptp_ocp_dpll_get_output_type(struct dpll_device *dpll, int sma)
  3762	{
  3763		struct ptp_ocp *bp = (struct ptp_ocp *)dpll->priv;
  3764		int ret;
  3765	
  3766		if (bp->sma[sma].mode != SMA_MODE_IN)
  3767			return -1;
  3768	
  3769		switch (ptp_ocp_sma_get(bp, sma)) {
  3770		case 0:
  3771			ret = DPLL_TYPE_EXT_10MHZ;
  3772			break;
  3773		case 1:
  3774		case 2:
  3775			ret = DPLL_TYPE_INT_OSCILLATOR;
  3776		case 4:
  3777		case 8:
  3778			ret = DPLL_TYPE_GNSS;
  3779			break;
  3780		default:
  3781			ret = DPLL_TYPE_INT_OSCILLATOR;
  3782		}
  3783	
  3784		return ret;
  3785	}
  3786	
> 3787	static struct dpll_device_ops ptp_ocp_dpll_ops {
  3788		.get_status			= ptp_ocp_dpll_get_status;
  3789		.get_lock_status	= ptp_ocp_dpll_get_lock_status;
  3790		.get_source_type	= ptp_ocp_dpll_get_source_type;
  3791		.get_output_type	= ptp_ocp_dpll_get_output_type;
  3792	};
  3793	
  3794	static int
  3795	ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
  3796	{
  3797		struct devlink *devlink;
  3798		struct ptp_ocp *bp;
  3799		int err;
  3800	
  3801		devlink = devlink_alloc(&ptp_ocp_devlink_ops, sizeof(*bp), &pdev->dev);
  3802		if (!devlink) {
  3803			dev_err(&pdev->dev, "devlink_alloc failed\n");
  3804			return -ENOMEM;
  3805		}
  3806	
  3807		err = pci_enable_device(pdev);
  3808		if (err) {
  3809			dev_err(&pdev->dev, "pci_enable_device\n");
  3810			goto out_free;
  3811		}
  3812	
  3813		bp = devlink_priv(devlink);
  3814		err = ptp_ocp_device_init(bp, pdev);
  3815		if (err)
  3816			goto out_disable;
  3817	
  3818		/* compat mode.
  3819		 * Older FPGA firmware only returns 2 irq's.
  3820		 * allow this - if not all of the IRQ's are returned, skip the
  3821		 * extra devices and just register the clock.
  3822		 */
  3823		err = pci_alloc_irq_vectors(pdev, 1, 17, PCI_IRQ_MSI | PCI_IRQ_MSIX);
  3824		if (err < 0) {
  3825			dev_err(&pdev->dev, "alloc_irq_vectors err: %d\n", err);
  3826			goto out;
  3827		}
  3828		bp->n_irqs = err;
  3829		pci_set_master(pdev);
  3830	
  3831		err = ptp_ocp_register_resources(bp, id->driver_data);
  3832		if (err)
  3833			goto out;
  3834	
  3835		bp->ptp = ptp_clock_register(&bp->ptp_info, &pdev->dev);
  3836		if (IS_ERR(bp->ptp)) {
  3837			err = PTR_ERR(bp->ptp);
  3838			dev_err(&pdev->dev, "ptp_clock_register: %d\n", err);
  3839			bp->ptp = NULL;
  3840			goto out;
  3841		}
  3842	
  3843		err = ptp_ocp_complete(bp);
  3844		if (err)
  3845			goto out;
  3846	
  3847		ptp_ocp_info(bp);
  3848		devlink_register(devlink);
  3849	
> 3850		bp->dpll = dpll_device_alloc(&dpll_ops, ARRAY_SIZE(bp->sma), ARRAY_SIZE(bp->sma));
  3851		if (!bp->dpll) {
  3852			dev_err(&pdev->dev, "dpll_device_alloc failed\n");
  3853			return 0;
  3854		}
> 3855		dpll_device_register(bp->dpll);
  3856	
  3857		return 0;
  3858	
  3859	out:
  3860		ptp_ocp_detach(bp);
  3861		pci_set_drvdata(pdev, NULL);
  3862	out_disable:
  3863		pci_disable_device(pdev);
  3864	out_free:
  3865		devlink_free(devlink);
  3866		return err;
  3867	}
  3868	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
