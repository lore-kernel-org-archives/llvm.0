Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4149379980;
	Mon, 22 Jun 2026 22:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782166191; cv=none; b=fPPjarRMi1V/3IhjhJVCB0++AI+L+Lf6/uA/3xPsMA1hDwNR/c0+Hhe3hG5EUNHsrR8c/U/RtBc3f8Ue5Ad2cp2RUDzP/XYn6VdwmA9OTUGz6WCYL/qiJIRfwhMIGKGEEeFR02v8vsfHR6pixR9rQGM5T1dTUGhwp13bCCrXeJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782166191; c=relaxed/simple;
	bh=ruOoIhIpbvhL/4HHlso/YJXqQhGkIEu0qtAbPaz0h3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hfeyDreR3Fjn16aCRhAWq7EyYizzFk9elj5AcG9Cy25p8fSktyDCDJDxCwD9sEGM+LqgAkw76ht2UAF2TAeNpTg3S+RJh8tJxZpG0SEcoCEAor6oaQWn34ONhQFUwLdybGRze9XKDWTC5VtEkrMVrscrARmddNB4It9g+Q9BkWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCsSjG4d; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCsSjG4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782166191; x=1813702191;
  h=date:from:to:cc:subject:message-id;
  bh=ruOoIhIpbvhL/4HHlso/YJXqQhGkIEu0qtAbPaz0h3A=;
  b=MCsSjG4dPx21PH54nxX3SGvo5dM/BYJONggyKSJb1bcDuyJKCHXQm0ef
   C8i2NLVjlTGieJqTXlrpDXi/WZzrexmrz7W7DURb8Li1CFhJDuGY7grw2
   Ucou4TJKBXtEY38oPY+nqtWpxjC1GK5UjS+XPgQXYJliOq+BmvgiL8R9M
   yQUmxtSXf3x3aChyCWxvjijNCAkakX72YDgdqFIPV7+Vaf0Zly/VVw/Rc
   B0sJbVe02K2kx6inMF5CEJxavGd5uaidLWrfiLY33+L7ray+lKKx49fBx
   v33Il44lV8pTv4110NsGeXMfkFWp5ekVOIN5YIMVBVyYdkT/iswbI48s1
   g==;
X-CSE-ConnectionGUID: i3f6yGk3QdOureAg6WyErQ==
X-CSE-MsgGUID: bCAVwkTNQOmW+PnZ0G9hig==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94021331"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="94021331"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 15:09:51 -0700
X-CSE-ConnectionGUID: LD9pa/G8TcyP8tu3TZwcKQ==
X-CSE-MsgGUID: LfO6b7O2RhiBW3KIBhc0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="253679148"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Jun 2026 15:09:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbmpt-0000000020F-2wqK;
	Mon, 22 Jun 2026 22:09:45 +0000
Date: Tue, 23 Jun 2026 06:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Sebastian Reichel <sre@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [sre-misc:thinkpad-t14s-x1e 15/86]
 drivers/media/platform/qcom/camss/camss-csiphy.c:815:59: warning: variable
 'ret' is uninitialized when used here
Message-ID: <202606230610.qXDc0dlZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   e56dd62df7d34f2d009ad860978cdcd913d63722
commit: 0af43991f850a9752165155fd4d0d9944906e131 [15/86] media: qcom: camss: Add support for PHY API devices
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230610.qXDc0dlZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230610.qXDc0dlZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230610.qXDc0dlZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss-csiphy.c:815:59: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     815 |                 dev_err(dev, "failed to get phy %s %d\n", csiphy->name, ret);
         |                                                                         ^~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:802:9: note: initialize the variable 'ret' to silence this warning
     802 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +815 drivers/media/platform/qcom/camss/camss-csiphy.c

   788	
   789	/*
   790	 * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
   791	 * @csiphy: CSIPHY device
   792	 * @res: CSIPHY module resources table
   793	 * @id: CSIPHY module id
   794	 *
   795	 * Return 0 on success or a negative error code otherwise
   796	 */
   797	int msm_csiphy_subdev_init(struct camss *camss,
   798				   struct csiphy_device *csiphy,
   799				   const struct camss_subdev_resources *res, u8 id)
   800	{
   801		struct device *dev = camss->dev;
   802		int ret;
   803	
   804		csiphy->camss = camss;
   805		csiphy->id = id;
   806		csiphy->cfg.combo_mode = 0;
   807		csiphy->res = &res->csiphy;
   808	
   809		snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d",
   810			 csiphy->id);
   811	
   812		csiphy->phy = devm_phy_get(dev, csiphy->name);
   813	
   814		if (IS_ERR(csiphy->phy)) {
 > 815			dev_err(dev, "failed to get phy %s %d\n", csiphy->name, ret);
   816			return PTR_ERR(csiphy->phy);
   817		}
   818	
   819		ret = phy_init(csiphy->phy);
   820		if (ret)
   821			dev_err(dev, "phy %s init fail %d\n", csiphy->name, ret);
   822	
   823		return ret;
   824	}
   825	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
