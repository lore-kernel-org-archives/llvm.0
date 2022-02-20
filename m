Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03355EA4
	for <llvm@lists.linux.dev>; Sun, 20 Feb 2022 18:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645381008; x=1676917008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z9UooB4AuoijZpBXdZh7lxfX0TIsDb+pcXIFAnn94B8=;
  b=G2Ihgo2/Qa6lpg89UpopmxVXSw00tQq3q+M2BObcWP/uSGB/XzpWaeYM
   ks6fEYLN/qOHX4gJ3cPRwddZK+EOencPiooXKFxsVtj6FxBLZQVaS1bDZ
   5y8HX2rp3feErcDVYXpTiuajOthkKXwUkwH25/Q+C0Q9BJEu1d/ANYgyU
   o3MNtZJa5Z+GzAiCQbuuDkng5l+axVZVNY2Mxyh1DKkv6Q6wotLPNkyGI
   bHT5Sis7l5m4N/KXLHM6wascG1TjzjjUB0FJIyOOEx0cZjGryrGO7zej1
   hRbEYaCD7haqihNrNGHDVpNfdWyZOBtyPXEM7fF66Ls75ZpyMlcczJSKQ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="234932993"
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="234932993"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 10:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="531582801"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Feb 2022 10:16:46 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nLqlJ-0000ZI-JP; Sun, 20 Feb 2022 18:16:45 +0000
Date: Mon, 21 Feb 2022 02:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [linux-next:master 5320/6564] drivers/edac/ghes_edac.c:503:43:
 error: array has incomplete element type 'struct acpi_platform_list'
Message-ID: <202202210219.Xaif78Zq-lkp@intel.com>
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
head:   3c30cf91b5ecc7272b3d2942ae0505dd8320b81c
commit: f521a6e687d139e5d33a3d92f5ba4cd0a825cc66 [5320/6564] ACPI: APEI: explicit init HEST and GHES in apci_init()
config: arm64-randconfig-r006-20220220 (https://download.01.org/0day-ci/archive/20220221/202202210219.Xaif78Zq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f521a6e687d139e5d33a3d92f5ba4cd0a825cc66
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f521a6e687d139e5d33a3d92f5ba4cd0a825cc66
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/edac/ghes_edac.c:503:43: error: array has incomplete element type 'struct acpi_platform_list'
   static struct acpi_platform_list plat_list[] = {
                                             ^
   drivers/edac/ghes_edac.c:503:15: note: forward declaration of 'struct acpi_platform_list'
   static struct acpi_platform_list plat_list[] = {
                 ^
>> drivers/edac/ghes_edac.c:504:43: error: use of undeclared identifier 'all_versions'
           {"HPE   ", "Server  ", 0, ACPI_SIG_FADT, all_versions},
                                                    ^
>> drivers/edac/ghes_edac.c:520:9: error: implicit declaration of function 'acpi_match_platform_list' [-Werror,-Wimplicit-function-declaration]
                   idx = acpi_match_platform_list(plat_list);
                         ^
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_APEI_GHES
   Depends on ACPI && ACPI_APEI
   Selected by
   - ARM_SDE_INTERFACE && ARM64


vim +503 drivers/edac/ghes_edac.c

77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  499  
5deed6b6a479ad Toshi Kani            2017-08-23  500  /*
5deed6b6a479ad Toshi Kani            2017-08-23  501   * Known systems that are safe to enable this module.
5deed6b6a479ad Toshi Kani            2017-08-23  502   */
5deed6b6a479ad Toshi Kani            2017-08-23 @503  static struct acpi_platform_list plat_list[] = {
5deed6b6a479ad Toshi Kani            2017-08-23 @504  	{"HPE   ", "Server  ", 0, ACPI_SIG_FADT, all_versions},
5deed6b6a479ad Toshi Kani            2017-08-23  505  	{ } /* End */
5deed6b6a479ad Toshi Kani            2017-08-23  506  };
5deed6b6a479ad Toshi Kani            2017-08-23  507  
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  508  int ghes_edac_register(struct ghes *ghes, struct device *dev)
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  509  {
32fa1f53c2daf9 Mauro Carvalho Chehab 2013-02-14  510  	bool fake = false;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  511  	struct mem_ctl_info *mci;
b001694d60fe4d Robert Richter        2020-05-19  512  	struct ghes_pvt *pvt;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  513  	struct edac_mc_layer layers[1];
23f61b9fc5cc10 Robert Richter        2019-11-05  514  	unsigned long flags;
eaa3a1d46cfdbf Borislav Petkov       2018-05-18  515  	int idx = -1;
b9cae27728d1f9 Borislav Petkov       2020-06-03  516  	int rc = 0;
5deed6b6a479ad Toshi Kani            2017-08-23  517  
eaa3a1d46cfdbf Borislav Petkov       2018-05-18  518  	if (IS_ENABLED(CONFIG_X86)) {
5deed6b6a479ad Toshi Kani            2017-08-23  519  		/* Check if safe to enable on this system */
5deed6b6a479ad Toshi Kani            2017-08-23 @520  		idx = acpi_match_platform_list(plat_list);
5deed6b6a479ad Toshi Kani            2017-08-23  521  		if (!force_load && idx < 0)
cc7f3f13265828 Borislav Petkov       2018-04-23  522  			return -ENODEV;
eaa3a1d46cfdbf Borislav Petkov       2018-05-18  523  	} else {
251c54ea26fa60 Borislav Petkov       2020-09-11  524  		force_load = true;
eaa3a1d46cfdbf Borislav Petkov       2018-05-18  525  		idx = 0;
eaa3a1d46cfdbf Borislav Petkov       2018-05-18  526  	}
32fa1f53c2daf9 Mauro Carvalho Chehab 2013-02-14  527  
23f61b9fc5cc10 Robert Richter        2019-11-05  528  	/* finish another registration/unregistration instance first */
23f61b9fc5cc10 Robert Richter        2019-11-05  529  	mutex_lock(&ghes_reg_mutex);
23f61b9fc5cc10 Robert Richter        2019-11-05  530  
0fe5f281f749f1 Borislav Petkov       2017-08-16  531  	/*
0fe5f281f749f1 Borislav Petkov       2017-08-16  532  	 * We have only one logical memory controller to which all DIMMs belong.
0fe5f281f749f1 Borislav Petkov       2017-08-16  533  	 */
23f61b9fc5cc10 Robert Richter        2019-11-05  534  	if (refcount_inc_not_zero(&ghes_refcount))
23f61b9fc5cc10 Robert Richter        2019-11-05  535  		goto unlock;
0fe5f281f749f1 Borislav Petkov       2017-08-16  536  
b9cae27728d1f9 Borislav Petkov       2020-06-03  537  	ghes_scan_system();
32fa1f53c2daf9 Mauro Carvalho Chehab 2013-02-14  538  
32fa1f53c2daf9 Mauro Carvalho Chehab 2013-02-14  539  	/* Check if we've got a bogus BIOS */
b9cae27728d1f9 Borislav Petkov       2020-06-03  540  	if (!ghes_hw.num_dimms) {
32fa1f53c2daf9 Mauro Carvalho Chehab 2013-02-14  541  		fake = true;
b9cae27728d1f9 Borislav Petkov       2020-06-03  542  		ghes_hw.num_dimms = 1;
32fa1f53c2daf9 Mauro Carvalho Chehab 2013-02-14  543  	}
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  544  
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  545  	layers[0].type = EDAC_MC_LAYER_ALL_MEM;
b9cae27728d1f9 Borislav Petkov       2020-06-03  546  	layers[0].size = ghes_hw.num_dimms;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  547  	layers[0].is_virt_csrow = true;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  548  
b001694d60fe4d Robert Richter        2020-05-19  549  	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers, sizeof(struct ghes_pvt));
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  550  	if (!mci) {
d2a6856614fd34 Mauro Carvalho Chehab 2013-02-15  551  		pr_info("Can't allocate memory for EDAC data\n");
23f61b9fc5cc10 Robert Richter        2019-11-05  552  		rc = -ENOMEM;
23f61b9fc5cc10 Robert Richter        2019-11-05  553  		goto unlock;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  554  	}
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  555  
23f61b9fc5cc10 Robert Richter        2019-11-05  556  	pvt		= mci->pvt_info;
23f61b9fc5cc10 Robert Richter        2019-11-05  557  	pvt->mci	= mci;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  558  
0fe5f281f749f1 Borislav Petkov       2017-08-16  559  	mci->pdev = dev;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  560  	mci->mtype_cap = MEM_FLAG_EMPTY;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  561  	mci->edac_ctl_cap = EDAC_FLAG_NONE;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  562  	mci->edac_cap = EDAC_FLAG_NONE;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  563  	mci->mod_name = "ghes_edac.c";
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  564  	mci->ctl_name = "ghes_edac";
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  565  	mci->dev_name = "ghes";
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  566  
5deed6b6a479ad Toshi Kani            2017-08-23  567  	if (fake) {
5deed6b6a479ad Toshi Kani            2017-08-23  568  		pr_info("This system has a very crappy BIOS: It doesn't even list the DIMMS.\n");
5deed6b6a479ad Toshi Kani            2017-08-23  569  		pr_info("Its SMBIOS info is wrong. It is doubtful that the error report would\n");
5deed6b6a479ad Toshi Kani            2017-08-23  570  		pr_info("work on such system. Use this driver with caution\n");
5deed6b6a479ad Toshi Kani            2017-08-23  571  	} else if (idx < 0) {
d2a6856614fd34 Mauro Carvalho Chehab 2013-02-15  572  		pr_info("This EDAC driver relies on BIOS to enumerate memory and get error reports.\n");
d2a6856614fd34 Mauro Carvalho Chehab 2013-02-15  573  		pr_info("Unfortunately, not all BIOSes reflect the memory layout correctly.\n");
d2a6856614fd34 Mauro Carvalho Chehab 2013-02-15  574  		pr_info("So, the end result of using this driver varies from vendor to vendor.\n");
d2a6856614fd34 Mauro Carvalho Chehab 2013-02-15  575  		pr_info("If you find incorrect reports, please contact your hardware vendor\n");
d2a6856614fd34 Mauro Carvalho Chehab 2013-02-15  576  		pr_info("to correct its BIOS.\n");
b9cae27728d1f9 Borislav Petkov       2020-06-03  577  		pr_info("This system has %d DIMM sockets.\n", ghes_hw.num_dimms);
d2a6856614fd34 Mauro Carvalho Chehab 2013-02-15  578  	}
d2a6856614fd34 Mauro Carvalho Chehab 2013-02-15  579  
32fa1f53c2daf9 Mauro Carvalho Chehab 2013-02-14  580  	if (!fake) {
b9cae27728d1f9 Borislav Petkov       2020-06-03  581  		struct dimm_info *src, *dst;
b9cae27728d1f9 Borislav Petkov       2020-06-03  582  		int i = 0;
b9cae27728d1f9 Borislav Petkov       2020-06-03  583  
b9cae27728d1f9 Borislav Petkov       2020-06-03  584  		mci_for_each_dimm(mci, dst) {
b9cae27728d1f9 Borislav Petkov       2020-06-03  585  			src = &ghes_hw.dimms[i];
b9cae27728d1f9 Borislav Petkov       2020-06-03  586  
b9cae27728d1f9 Borislav Petkov       2020-06-03  587  			dst->idx	   = src->idx;
b9cae27728d1f9 Borislav Petkov       2020-06-03  588  			dst->smbios_handle = src->smbios_handle;
b9cae27728d1f9 Borislav Petkov       2020-06-03  589  			dst->nr_pages	   = src->nr_pages;
b9cae27728d1f9 Borislav Petkov       2020-06-03  590  			dst->mtype	   = src->mtype;
b9cae27728d1f9 Borislav Petkov       2020-06-03  591  			dst->edac_mode	   = src->edac_mode;
b9cae27728d1f9 Borislav Petkov       2020-06-03  592  			dst->dtype	   = src->dtype;
b9cae27728d1f9 Borislav Petkov       2020-06-03  593  			dst->grain	   = src->grain;
b9cae27728d1f9 Borislav Petkov       2020-06-03  594  
b9cae27728d1f9 Borislav Petkov       2020-06-03  595  			/*
b9cae27728d1f9 Borislav Petkov       2020-06-03  596  			 * If no src->label, preserve default label assigned
b9cae27728d1f9 Borislav Petkov       2020-06-03  597  			 * from EDAC core.
b9cae27728d1f9 Borislav Petkov       2020-06-03  598  			 */
b9cae27728d1f9 Borislav Petkov       2020-06-03  599  			if (strlen(src->label))
b9cae27728d1f9 Borislav Petkov       2020-06-03  600  				memcpy(dst->label, src->label, sizeof(src->label));
b9cae27728d1f9 Borislav Petkov       2020-06-03  601  
b9cae27728d1f9 Borislav Petkov       2020-06-03  602  			i++;
b9cae27728d1f9 Borislav Petkov       2020-06-03  603  		}
b9cae27728d1f9 Borislav Petkov       2020-06-03  604  
32fa1f53c2daf9 Mauro Carvalho Chehab 2013-02-14  605  	} else {
bc9ad9e40dbc4c Robert Richter        2019-11-06  606  		struct dimm_info *dimm = edac_get_dimm(mci, 0, 0, 0);
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  607  
d2a6856614fd34 Mauro Carvalho Chehab 2013-02-15  608  		dimm->nr_pages = 1;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  609  		dimm->grain = 128;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  610  		dimm->mtype = MEM_UNKNOWN;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  611  		dimm->dtype = DEV_UNKNOWN;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  612  		dimm->edac_mode = EDAC_SECDED;
32fa1f53c2daf9 Mauro Carvalho Chehab 2013-02-14  613  	}
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  614  
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  615  	rc = edac_mc_add_mc(mci);
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  616  	if (rc < 0) {
b9cae27728d1f9 Borislav Petkov       2020-06-03  617  		pr_info("Can't register with the EDAC core\n");
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  618  		edac_mc_free(mci);
23f61b9fc5cc10 Robert Richter        2019-11-05  619  		rc = -ENODEV;
23f61b9fc5cc10 Robert Richter        2019-11-05  620  		goto unlock;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  621  	}
23f61b9fc5cc10 Robert Richter        2019-11-05  622  
23f61b9fc5cc10 Robert Richter        2019-11-05  623  	spin_lock_irqsave(&ghes_lock, flags);
23f61b9fc5cc10 Robert Richter        2019-11-05  624  	ghes_pvt = pvt;
23f61b9fc5cc10 Robert Richter        2019-11-05  625  	spin_unlock_irqrestore(&ghes_lock, flags);
23f61b9fc5cc10 Robert Richter        2019-11-05  626  
16214bd9e43a31 Robert Richter        2019-11-21  627  	/* only set on success */
16214bd9e43a31 Robert Richter        2019-11-21  628  	refcount_set(&ghes_refcount, 1);
23f61b9fc5cc10 Robert Richter        2019-11-05  629  
23f61b9fc5cc10 Robert Richter        2019-11-05  630  unlock:
b9cae27728d1f9 Borislav Petkov       2020-06-03  631  
b9cae27728d1f9 Borislav Petkov       2020-06-03  632  	/* Not needed anymore */
b9cae27728d1f9 Borislav Petkov       2020-06-03  633  	kfree(ghes_hw.dimms);
b9cae27728d1f9 Borislav Petkov       2020-06-03  634  	ghes_hw.dimms = NULL;
b9cae27728d1f9 Borislav Petkov       2020-06-03  635  
23f61b9fc5cc10 Robert Richter        2019-11-05  636  	mutex_unlock(&ghes_reg_mutex);
23f61b9fc5cc10 Robert Richter        2019-11-05  637  
23f61b9fc5cc10 Robert Richter        2019-11-05  638  	return rc;
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  639  }
77c5f5d2f212e1 Mauro Carvalho Chehab 2013-02-15  640  

:::::: The code at line 503 was first introduced by commit
:::::: 5deed6b6a479ad5851d7ead6412dc6faa84a694e EDAC, ghes: Add platform check

:::::: TO: Toshi Kani <toshi.kani@hpe.com>
:::::: CC: Borislav Petkov <bp@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
