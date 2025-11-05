Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4202D8783;
	Wed,  5 Nov 2025 20:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762376212; cv=none; b=C6FPpFIPuPi3rp70vFrq3cyuYDEk34bpXSP6kB8ZtKN9DOC05VGedYkguEOjseGsYOfcwmFt4TD7vun9EOIvuiQt+u6xS4JWSEYOpevHKoWV79AYAiyABA+/ojGyX7X6EkKiCSZQkj767Tlm/6axhtKlnBnEaKSKq+BDHwZMXSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762376212; c=relaxed/simple;
	bh=icLJr+c9Ou8t6mfrlf9E2yy34tCJAvTdwGzY+3zd2vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bj+p88Nk5kjCWdMjRLu+mBmZoDaxur1o3uE7fJYMvP8JJp7ua5GHmU0WMhHVfAdjzK6R545KAgAE35eInXwyouFTq36K6mr683SLRfJpqCKzy7agD4rI40roj+wxcdLUaO4XSkTAmf4CqQZKhUqAw/Y7U84f/kVAf5aL9uiAMNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZn2pTZt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZn2pTZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762376211; x=1793912211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=icLJr+c9Ou8t6mfrlf9E2yy34tCJAvTdwGzY+3zd2vw=;
  b=VZn2pTZtqqqF+8ivqDDU2pJxCwt3BIM4qupxOBZ5Kj7E5QclO7LbSVcg
   4he9wyZ1zUzklS6UNPbd3RS8nPFpCfEXL/VJtB0TaRiHUMSo1Q/2QtH+L
   ZrTV/6jG4H/h/mJlXfL29XLvdyhSCI/nWeS+Cfr6WlxyxNbH0rhzzhqj6
   hEA9Pvg5e0y6Jd3CRXBnFSqkyp+zC6TKWjnafOhCOO9epxKb930mAVKQ2
   RQm+LfePJ4CtmAw1HhV6lUow3kBUfCGudxYOQeAWfpp4JAYRgyWSRBb0I
   OufswJ9wC0APj/wMaKLzecLLCt/jMkMc0hfm1pFCsT8AOPC8o8Wciccgh
   A==;
X-CSE-ConnectionGUID: Hq+jzkHRQWGZhE238/VZrA==
X-CSE-MsgGUID: OF4pRDMRSLinQ4l9jlS+tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75185446"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="75185446"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 12:56:51 -0800
X-CSE-ConnectionGUID: GzZhOu1sS12N0qDVZkIlfg==
X-CSE-MsgGUID: wfCPU+KKSxul5WNhWWDhjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="191850902"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2025 12:56:49 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGkYh-000T7q-14;
	Wed, 05 Nov 2025 20:56:47 +0000
Date: Thu, 6 Nov 2025 04:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] EDAC/ie31200: Fix error handling in
 ie31200_register_mci
Message-ID: <202511060427.k5gEuYdp-lkp@intel.com>
References: <20251105022146.22105-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105022146.22105-1-make24@iscas.ac.cn>

Hi Ma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ras/edac-for-next]
[also build test WARNING on linus/master v6.18-rc4 next-20251105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/EDAC-ie31200-Fix-error-handling-in-ie31200_register_mci/20251105-102435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
patch link:    https://lore.kernel.org/r/20251105022146.22105-1-make24%40iscas.ac.cn
patch subject: [PATCH v2] EDAC/ie31200: Fix error handling in ie31200_register_mci
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251106/202511060427.k5gEuYdp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060427.k5gEuYdp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511060427.k5gEuYdp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/ie31200_edac.c:483:6: warning: variable 'priv' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     483 |         if (!window) {
         |             ^~~~~~~
   drivers/edac/ie31200_edac.c:531:14: note: uninitialized use occurs here
     531 |         put_device(&priv->dev);
         |                     ^~~~
   drivers/edac/ie31200_edac.c:483:2: note: remove the 'if' if its condition is always false
     483 |         if (!window) {
         |         ^~~~~~~~~~~~~~
     484 |                 ret = -ENODEV;
         |                 ~~~~~~~~~~~~~~
     485 |                 goto fail_free;
         |                 ~~~~~~~~~~~~~~~
     486 |         }
         |         ~
   drivers/edac/ie31200_edac.c:465:27: note: initialize the variable 'priv' to silence this warning
     465 |         struct ie31200_priv *priv;
         |                                  ^
         |                                   = NULL
   1 warning generated.


vim +483 drivers/edac/ie31200_edac.c

7ee40b897d18ab Jason Baron 2014-07-04  461  
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  462  static int ie31200_register_mci(struct pci_dev *pdev, struct res_config *cfg, int mc)
498550e1fa7c1c Qiuxu Zhuo  2025-03-10  463  {
498550e1fa7c1c Qiuxu Zhuo  2025-03-10  464  	struct edac_mc_layer layers[2];
498550e1fa7c1c Qiuxu Zhuo  2025-03-10  465  	struct ie31200_priv *priv;
498550e1fa7c1c Qiuxu Zhuo  2025-03-10  466  	struct mem_ctl_info *mci;
498550e1fa7c1c Qiuxu Zhuo  2025-03-10  467  	void __iomem *window;
498550e1fa7c1c Qiuxu Zhuo  2025-03-10  468  	int ret;
498550e1fa7c1c Qiuxu Zhuo  2025-03-10  469  
7ee40b897d18ab Jason Baron 2014-07-04  470  	nr_channels = how_many_channels(pdev);
7ee40b897d18ab Jason Baron 2014-07-04  471  	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
d59d844e319d97 Qiuxu Zhuo  2025-03-10  472  	layers[0].size = IE31200_RANKS_PER_CHANNEL;
7ee40b897d18ab Jason Baron 2014-07-04  473  	layers[0].is_virt_csrow = true;
7ee40b897d18ab Jason Baron 2014-07-04  474  	layers[1].type = EDAC_MC_LAYER_CHANNEL;
7ee40b897d18ab Jason Baron 2014-07-04  475  	layers[1].size = nr_channels;
7ee40b897d18ab Jason Baron 2014-07-04  476  	layers[1].is_virt_csrow = false;
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  477  	mci = edac_mc_alloc(mc, ARRAY_SIZE(layers), layers,
7ee40b897d18ab Jason Baron 2014-07-04  478  			    sizeof(struct ie31200_priv));
7ee40b897d18ab Jason Baron 2014-07-04  479  	if (!mci)
78fd4d1242e88f Jason Baron 2014-07-09  480  		return -ENOMEM;
7ee40b897d18ab Jason Baron 2014-07-04  481  
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  482  	window = ie31200_map_mchbar(pdev, cfg, mc);
78fd4d1242e88f Jason Baron 2014-07-09 @483  	if (!window) {
78fd4d1242e88f Jason Baron 2014-07-09  484  		ret = -ENODEV;
78fd4d1242e88f Jason Baron 2014-07-09  485  		goto fail_free;
78fd4d1242e88f Jason Baron 2014-07-09  486  	}
7ee40b897d18ab Jason Baron 2014-07-04  487  
78fd4d1242e88f Jason Baron 2014-07-09  488  	edac_dbg(3, "MC: init mci\n");
2a52cce6486171 Qiuxu Zhuo  2025-03-10  489  	mci->mtype_cap = BIT(cfg->mtype);
7ee40b897d18ab Jason Baron 2014-07-04  490  	mci->edac_ctl_cap = EDAC_FLAG_SECDED;
7ee40b897d18ab Jason Baron 2014-07-04  491  	mci->edac_cap = EDAC_FLAG_SECDED;
7ee40b897d18ab Jason Baron 2014-07-04  492  	mci->mod_name = EDAC_MOD_STR;
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  493  	mci->ctl_name = ie31200_devs[mc].ctl_name;
7ee40b897d18ab Jason Baron 2014-07-04  494  	mci->dev_name = pci_name(pdev);
a5db1b296b181c Qiuxu Zhuo  2025-03-10  495  	mci->edac_check = cfg->cmci ? NULL : ie31200_check;
7ee40b897d18ab Jason Baron 2014-07-04  496  	mci->ctl_page_to_phys = NULL;
7ee40b897d18ab Jason Baron 2014-07-04  497  	priv = mci->pvt_info;
7ee40b897d18ab Jason Baron 2014-07-04  498  	priv->window = window;
2a52cce6486171 Qiuxu Zhuo  2025-03-10  499  	priv->c0errlog = window + cfg->reg_eccerrlog_offset[0];
2a52cce6486171 Qiuxu Zhuo  2025-03-10  500  	priv->c1errlog = window + cfg->reg_eccerrlog_offset[1];
2a52cce6486171 Qiuxu Zhuo  2025-03-10  501  	priv->cfg = cfg;
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  502  	priv->mci = mci;
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  503  	priv->pdev = pdev;
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  504  	device_initialize(&priv->dev);
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  505  	/*
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  506  	 * The EDAC core uses mci->pdev (pointer to the structure device)
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  507  	 * as the memory controller ID. The SoCs attach one or more memory
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  508  	 * controllers to a single pci_dev (a single pci_dev->dev can
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  509  	 * correspond to multiple memory controllers).
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  510  	 *
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  511  	 * To make mci->pdev unique, assign pci_dev->dev to mci->pdev
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  512  	 * for the first memory controller and assign a unique priv->dev
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  513  	 * to mci->pdev for each additional memory controller.
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  514  	 */
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  515  	mci->pdev = mc ? &priv->dev : &pdev->dev;
7ee40b897d18ab Jason Baron 2014-07-04  516  
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  517  	ie31200_get_dimm_config(mci, window, cfg, mc);
7ee40b897d18ab Jason Baron 2014-07-04  518  	ie31200_clear_error_info(mci);
7ee40b897d18ab Jason Baron 2014-07-04  519  
7ee40b897d18ab Jason Baron 2014-07-04  520  	if (edac_mc_add_mc(mci)) {
7ee40b897d18ab Jason Baron 2014-07-04  521  		edac_dbg(3, "MC: failed edac_mc_add_mc()\n");
78fd4d1242e88f Jason Baron 2014-07-09  522  		ret = -ENODEV;
78fd4d1242e88f Jason Baron 2014-07-09  523  		goto fail_unmap;
7ee40b897d18ab Jason Baron 2014-07-04  524  	}
7ee40b897d18ab Jason Baron 2014-07-04  525  
d0742284ec6da1 Qiuxu Zhuo  2025-03-10  526  	ie31200_pvt.priv[mc] = priv;
7ee40b897d18ab Jason Baron 2014-07-04  527  	return 0;
7ee40b897d18ab Jason Baron 2014-07-04  528  fail_unmap:
7ee40b897d18ab Jason Baron 2014-07-04  529  	iounmap(window);
78fd4d1242e88f Jason Baron 2014-07-09  530  fail_free:
329c40e0a4c7b0 Ma Ke       2025-11-05  531  	put_device(&priv->dev);
78fd4d1242e88f Jason Baron 2014-07-09  532  	edac_mc_free(mci);
498550e1fa7c1c Qiuxu Zhuo  2025-03-10  533  	return ret;
498550e1fa7c1c Qiuxu Zhuo  2025-03-10  534  }
78fd4d1242e88f Jason Baron 2014-07-09  535  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
