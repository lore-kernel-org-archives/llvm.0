Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD06620
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 04:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651811021; x=1683347021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v+i2IletFePxmKijVaZP3oTrecBFtf6TNq0LWvXH4qI=;
  b=OSkhwoCSNqd/SXAlVLqFP3c4tlBnV5weY49pRxWgbNbl+W0M0PGbJoVW
   I2PlnnUBiM1DjT7q1eTd9WLNfpdUa2N592AxDIbl56jkHf3fnZq5BBQYd
   fd0INmA5YByCHqan/rAIqguj6vFsOAvc1PJIdGb+2lDGJ+IbyLa22nB4V
   P0Fv5axHjyLdORTBxkwvmK7KUocbu4wF3LkboTbcCzQvEm+5c4fqnkrJ4
   3Fu+SmucHVhm0GXZYfft7n6gQnRdEebZe0ao0B2lAHQd1zjT5MDPdR0Sg
   LXU6U6RcDbsr253DB5IxrZ98FO/YzQ7zIXgb0sVum8sY223/rpQbNJHAg
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="331333337"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="331333337"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 21:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="537697199"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 May 2022 21:23:39 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmpVC-000D5o-8o;
	Fri, 06 May 2022 04:23:38 +0000
Date: Fri, 6 May 2022 12:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Patch v4 9/9] soc: tegra: cbb: Add support for tegra-grace SOC
Message-ID: <202205061255.rw9iNJAz-lkp@intel.com>
References: <20220505170637.26538-10-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505170637.26538-10-sumitg@nvidia.com>

Hi Sumit,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on robh/for-next v5.18-rc5 next-20220505]
[cannot apply to tegra-drm/drm/tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sumit-Gupta/CBB-driver-for-Tegra194-Tegra234-Tegra-Grace/20220506-010937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
config: arm64-randconfig-r033-20220505 (https://download.01.org/0day-ci/archive/20220506/202205061255.rw9iNJAz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/ba92bd64d05fc7383dce973c2428eca5b4c65805
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sumit-Gupta/CBB-driver-for-Tegra194-Tegra234-Tegra-Grace/20220506-010937
        git checkout ba92bd64d05fc7383dce973c2428eca5b4c65805
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/soc/tegra/cbb/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/soc/tegra/cbb/tegra234-cbb.c:726:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = &pdev->dev;
                          ^
>> drivers/soc/tegra/cbb/tegra234-cbb.c:664:36: warning: unused variable 'tegra_grace_cbb_acpi_ids' [-Wunused-const-variable]
   static const struct acpi_device_id tegra_grace_cbb_acpi_ids[] = {
                                      ^
   2 warnings generated.


vim +/tegra_grace_cbb_acpi_ids +664 drivers/soc/tegra/cbb/tegra234-cbb.c

   663	
 > 664	static const struct acpi_device_id tegra_grace_cbb_acpi_ids[] = {
   665		{ "NVDA1070" },
   666		{ },
   667	};
   668	MODULE_DEVICE_TABLE(acpi, tegra_grace_cbb_acpi_ids);
   669	
   670	static const struct
   671	tegra_cbb_fabric_data *cbb_acpi_get_fab_data(struct acpi_device *adev)
   672	{
   673		const struct cbb_acpi_uid_noc *u;
   674	
   675		for (u = cbb_acpi_uids; u->hid; u++) {
   676			if (acpi_dev_hid_uid_match(adev, u->hid, u->uid))
   677				return u->fab;
   678		}
   679		return NULL;
   680	}
   681	
   682	static int
   683	tegra234_cbb_errmon_init(const struct tegra_cbb_fabric_data *pdata,
   684				 struct tegra_cbb *cbb, struct resource *res_base)
   685	{
   686		struct platform_device *pdev = cbb->pdev;
   687		struct tegra_cbb_errmon_record *errmon;
   688		unsigned long flags = 0;
   689		int err = 0;
   690	
   691		errmon = (struct tegra_cbb_errmon_record *)cbb->err_rec;
   692		errmon->vaddr = devm_ioremap_resource(&pdev->dev, res_base);
   693		if (IS_ERR(errmon->vaddr))
   694			return -EINVAL;
   695	
   696		errmon->name = pdata->name;
   697		errmon->start = res_base->start;
   698		errmon->tegra_cbb_master_id = pdata->tegra_cbb_master_id;
   699		errmon->err_notifier_base = pdata->err_notifier_base;
   700		errmon->off_mask_erd = pdata->off_mask_erd;
   701		errmon->sn_addr_map = pdata->sn_addr_map;
   702		errmon->noc_errors = pdata->noc_errors;
   703		errmon->cbb = cbb;
   704	
   705		if (errmon->off_mask_erd)
   706			errmon->erd_mask_inband_err = 1;
   707	
   708		err = tegra_cbb_err_getirq(pdev, NULL, &errmon->sec_irq);
   709		if (err)
   710			return err;
   711	
   712		cbb->ops = &tegra234_cbb_errmon_ops;
   713	
   714		spin_lock_irqsave(&cbb_errmon_lock, flags);
   715		list_add(&errmon->node, &cbb_errmon_list);
   716		spin_unlock_irqrestore(&cbb_errmon_lock, flags);
   717	
   718		return 0;
   719	};
   720	
   721	static int tegra234_cbb_probe(struct platform_device *pdev)
   722	{
   723		struct tegra_cbb_errmon_record *errmon = NULL;
   724		const struct tegra_cbb_fabric_data *pdata = NULL;
   725		struct resource *res_base = NULL;
 > 726		struct device *dev = &pdev->dev;
   727		struct acpi_device *device;
   728		struct tegra_cbb *cbb;
   729		int err = 0;
   730	
   731		if (of_machine_is_compatible("nvidia,tegra23x") ||
   732		    of_machine_is_compatible("nvidia,tegra234")) {
   733			pdata = of_device_get_match_data(&pdev->dev);
   734		} else {
   735			device = ACPI_COMPANION(dev);
   736			if (!device)
   737				return -ENODEV;
   738			pdata = cbb_acpi_get_fab_data(device);
   739		}
   740		if (!pdata) {
   741			dev_err(&pdev->dev, "No device match found\n");
   742			return -EINVAL;
   743		}
   744	
   745		res_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   746		if (!res_base) {
   747			dev_err(&pdev->dev, "Could not find base address");
   748			return -ENOENT;
   749		}
   750	
   751		cbb = devm_kzalloc(&pdev->dev, sizeof(*cbb), GFP_KERNEL);
   752		if (!cbb)
   753			return -ENOMEM;
   754	
   755		errmon = devm_kzalloc(&pdev->dev, sizeof(*errmon), GFP_KERNEL);
   756		if (!errmon)
   757			return -ENOMEM;
   758	
   759		cbb->err_rec = errmon;
   760		cbb->pdev = pdev;
   761		err = tegra234_cbb_errmon_init(pdata, cbb, res_base);
   762		if (err) {
   763			dev_err(&pdev->dev, "cbberr init for soc failing\n");
   764			return err;
   765		}
   766	
   767		/* set ERD bit to mask SError and generate interrupt to report error */
   768		if (errmon->erd_mask_inband_err)
   769			tegra234_cbb_mn_mask_serror(cbb);
   770	
   771		platform_set_drvdata(pdev, cbb);
   772	
   773		return tegra_cbb_register_isr_enaberr(cbb);
   774	}
   775	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
