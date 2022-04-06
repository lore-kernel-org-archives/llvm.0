Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31CD17CA
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 04:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649217918; x=1680753918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v1Q/9FY5s8v+kl8d9wmv8zGTJTqZMaJh5qs6/N8Rucs=;
  b=HUagCsj6uPhkjAShOQujdemb1vjJgCEsrm0Q0S1+NKAqQQ8GN/FYXZ/2
   81MoUk9d4psXtRmz9uu5gjkdDNkJG7fdsZnPwMUiTRFh/B7mCZKWm23Tm
   nLo8pj7iM0vw2Fxfh6feJAnRdbX7sPCdZ9nDVV3GL3yIdWy16E5Zq87/h
   bsgRFXs8nUYeIopqDI1hbQ4NPMEdQRvhXV0GG+5pb0hsigz0rrK7jwGVE
   6yXEHm6SzzO+zsLFSp4vatbx3re3BpzsAP5B2cJ4Azv8mdSHR1zfyAtcS
   Y2dtJ68Wf7YmsL01p/EuR2wUMrS9QCGsE/OPvUNd/bXxn6b17vg2EdUlr
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="241528990"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="241528990"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 21:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="722346486"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Apr 2022 21:04:47 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbwuU-00042a-Va;
	Wed, 06 Apr 2022 04:04:46 +0000
Date: Wed, 6 Apr 2022 12:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [krzk-github:n/qcom-ufs-opp-v2 14/15]
 drivers/scsi/ufs/ufshcd-pltfrm.c:373:23: error: use of undeclared identifier
 'clki'
Message-ID: <202204061241.LQDOaiaI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/krzk/linux n/qcom-ufs-opp-v2
head:   fff8a3e9335a828deb502bbcf983c4316d27c74e
commit: ae883f49d1137ae5f4997c5287dbf35f9bdd0272 [14/15] ufs wip
config: hexagon-randconfig-r045-20220405 (https://download.01.org/0day-ci/archive/20220406/202204061241.LQDOaiaI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/ae883f49d1137ae5f4997c5287dbf35f9bdd0272
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/qcom-ufs-opp-v2
        git checkout ae883f49d1137ae5f4997c5287dbf35f9bdd0272
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/scsi/ufs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/scsi/ufs/ufshcd-pltfrm.c:373:23: error: use of undeclared identifier 'clki'
                   list_for_each_entry(clki, head, list) {
                                       ^
>> drivers/scsi/ufs/ufshcd-pltfrm.c:373:23: error: use of undeclared identifier 'clki'
>> drivers/scsi/ufs/ufshcd-pltfrm.c:373:23: error: use of undeclared identifier 'clki'
>> drivers/scsi/ufs/ufshcd-pltfrm.c:373:23: error: use of undeclared identifier 'clki'
>> drivers/scsi/ufs/ufshcd-pltfrm.c:373:23: error: use of undeclared identifier 'clki'
>> drivers/scsi/ufs/ufshcd-pltfrm.c:373:23: error: use of undeclared identifier 'clki'
>> drivers/scsi/ufs/ufshcd-pltfrm.c:373:23: error: use of undeclared identifier 'clki'
>> drivers/scsi/ufs/ufshcd-pltfrm.c:373:23: error: use of undeclared identifier 'clki'
>> drivers/scsi/ufs/ufshcd-pltfrm.c:373:23: error: use of undeclared identifier 'clki'
   drivers/scsi/ufs/ufshcd-pltfrm.c:374:24: error: use of undeclared identifier 'clki'
                           if (!IS_ERR_OR_NULL(clki->clk)) {
                                               ^
   drivers/scsi/ufs/ufshcd-pltfrm.c:379:18: error: use of undeclared identifier 'clki'
                                   names[i++] = clki->name;
                                                ^
   drivers/scsi/ufs/ufshcd-pltfrm.c:383:15: error: implicit declaration of function 'dev_pm_opp_set_clknames' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   opp_table = dev_pm_opp_set_clknames(dev, names, i);
                               ^
   drivers/scsi/ufs/ufshcd-pltfrm.c:383:15: note: did you mean 'dev_pm_opp_set_clkname'?
   include/linux/pm_opp.h:158:19: note: 'dev_pm_opp_set_clkname' declared here
   struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const char *name);
                     ^
   drivers/scsi/ufs/ufshcd-pltfrm.c:383:13: warning: incompatible integer to pointer conversion assigning to 'struct opp_table *' from 'int' [-Wint-conversion]
                   opp_table = dev_pm_opp_set_clknames(dev, names, i);
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/ufs/ufshcd-pltfrm.c:385:4: error: use of undeclared identifier 'ret'
                           ret = PTR_ERR(opp_table);
                           ^
   1 warning and 13 errors generated.


vim +/clki +373 drivers/scsi/ufs/ufshcd-pltfrm.c

   314	
   315	/**
   316	 * ufshcd_pltfrm_init - probe routine of the driver
   317	 * @pdev: pointer to Platform device handle
   318	 * @vops: pointer to variant ops
   319	 *
   320	 * Returns 0 on success, non-zero value on failure
   321	 */
   322	int ufshcd_pltfrm_init(struct platform_device *pdev,
   323			       const struct ufs_hba_variant_ops *vops)
   324	{
   325		struct ufs_hba *hba;
   326		void __iomem *mmio_base;
   327		int irq, err;
   328		struct device *dev = &pdev->dev;
   329	
   330		mmio_base = devm_platform_ioremap_resource(pdev, 0);
   331		if (IS_ERR(mmio_base)) {
   332			err = PTR_ERR(mmio_base);
   333			goto out;
   334		}
   335	
   336		irq = platform_get_irq(pdev, 0);
   337		if (irq < 0) {
   338			err = irq;
   339			goto out;
   340		}
   341	
   342		err = ufshcd_alloc_host(dev, &hba);
   343		if (err) {
   344			dev_err(dev, "Allocation failed\n");
   345			goto out;
   346		}
   347	
   348		hba->vops = vops;
   349	
   350		err = ufshcd_parse_clock_info(hba);
   351		if (err) {
   352			dev_err(dev, "%s: clock parse failed %d\n",
   353					__func__, err);
   354			goto dealloc_host;
   355		}
   356		err = ufshcd_parse_regulator_info(hba);
   357		if (err) {
   358			dev_err(dev, "%s: regulator init failed %d\n",
   359					__func__, err);
   360			goto dealloc_host;
   361		}
   362	
   363		if (devm_pm_opp_of_add_table(dev)) {
   364			dev_dbg(dev, "no OPP table (%d), no performance state control\n",
   365				err);
   366		} else {
   367			struct list_head *head = &hba->clk_list_head;
   368			char *names[32];
   369			unsigned int i = 0;
   370			struct opp_table *opp_table;
   371	
   372			pr_err("AAA USING OPP\n");
 > 373			list_for_each_entry(clki, head, list) {
   374				if (!IS_ERR_OR_NULL(clki->clk)) {
   375					if (i == ARRAY_SIZE(names)) {
   376						pr_err("AAA BBBB too many\n");
   377						goto dealloc_host;
   378					}
   379					names[i++] = clki->name;
   380				}
   381			}
   382			hba->use_pm_opp = true;
   383			opp_table = dev_pm_opp_set_clknames(dev, names, i);
   384			if (IS_ERR(opp_table)) {
 > 385				ret = PTR_ERR(opp_table);
   386				goto dealloc_host;
   387			}
   388			// FIXME: put table
   389		}
   390	
   391		ufshcd_init_lanes_per_dir(hba);
   392	
   393		err = ufshcd_init(hba, mmio_base, irq);
   394		if (err) {
   395			dev_err(dev, "Initialization failed\n");
   396			goto dealloc_host;
   397		}
   398	
   399		pm_runtime_set_active(dev);
   400		pm_runtime_enable(dev);
   401	
   402		return 0;
   403	
   404	dealloc_host:
   405		ufshcd_dealloc_host(hba);
   406	out:
   407		return err;
   408	}
   409	EXPORT_SYMBOL_GPL(ufshcd_pltfrm_init);
   410	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
