Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993A23B27E1;
	Fri, 10 Apr 2026 21:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856557; cv=none; b=UbV8IaTSsT62nGcuW4xjtBvpid6INS3DxFLiVtdnTI4V2w2hxOv61/7OL8DSqiHXRqtk1hvLWUDvujbGGgJb4ZxKolYqt4EVcoEOfRNC8E4yZI1GUwAS3moM3BtO009vQGdm4ZypejprA2/cU8HFkmTHG39Tf+/H0qhBXZUisAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856557; c=relaxed/simple;
	bh=xEZATec8+bsHc79DZUhWwmNCvaecxvgNHKRpG+2y+oo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RHAmxMZ10aC/zzCty8ti+i0AueTFsuFvDD+ZH3O5+YmtOtwPAtf7YBspefx88pGS7GqOpW8i+nGPLOck4VmHdnEHqWBYmYUSVPMgRCPYWCU/EaTwc5e0SEoIuCGEp8a5OxoK5XYwaazulHR1u44tDvW6oeVwFyv21XhdYAQnMkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDiGR8n7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDiGR8n7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775856556; x=1807392556;
  h=date:from:to:cc:subject:message-id;
  bh=xEZATec8+bsHc79DZUhWwmNCvaecxvgNHKRpG+2y+oo=;
  b=NDiGR8n7TVThdvuvElQytEzX4H6E63GF7PGtAao86AGfXNCWKqyTvQ8D
   Qt8DbGGIcQq5UP3ejNQcXWrli3LtBC7zWIyNiGg2bBDJmGJ9LeSpVM4Lx
   rcY0q/tMR05HjY86ew9U/+0K7Qt/YlKS7BnO3KaNRlJ2hLQj3kYQ2P99G
   Xj71NdD9pbzh/Kmc7yc6SKExpEnOmBsqDED7TOVim//2zOi+8wf2C6dMo
   Vxo+D88mtfBekfHJ6QYnUlUfBWL4ZM64Vo0CZGDEpUZopbIwo8jjjNY8X
   H+lt7t0d9WdHJCZK0/9KVxm25GqpmQV9+/QRrNrESYb+1dr/E8EX7eu0+
   w==;
X-CSE-ConnectionGUID: BL9aG0Q8QUaFo/2q8WYulg==
X-CSE-MsgGUID: jNTNvZFyRXamHPc9Ifl0ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76955413"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76955413"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 14:29:15 -0700
X-CSE-ConnectionGUID: rUPhxoknTiCVsfUJFXEBlw==
X-CSE-MsgGUID: Mm8hyOhlR0aByiC8Ok3O2Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2026 14:29:13 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBJPa-000000000DX-3oQJ;
	Fri, 10 Apr 2026 21:29:10 +0000
Date: Sat, 11 Apr 2026 05:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Sebastian Reichel <sre@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [sre-misc:thinkpad-t14s-x1e 14/106]
 drivers/media/platform/qcom/camss/camss-csiphy.c:811:59: warning: variable
 'ret' is uninitialized when used here
Message-ID: <202604110532.VMi9eJxS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   c368130866898c0f67e75fb8e36b0708e623553b
commit: d31e377776c34b54a5a1c50a4dcd0e19437e65e5 [14/106] media: qcom: camss: Add support for PHY API devices
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604110532.VMi9eJxS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110532.VMi9eJxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110532.VMi9eJxS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss-csiphy.c:811:59: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     811 |                 dev_err(dev, "failed to get phy %s %d\n", csiphy->name, ret);
         |                                                                         ^~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:798:9: note: initialize the variable 'ret' to silence this warning
     798 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +811 drivers/media/platform/qcom/camss/camss-csiphy.c

   784	
   785	/*
   786	 * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
   787	 * @csiphy: CSIPHY device
   788	 * @res: CSIPHY module resources table
   789	 * @id: CSIPHY module id
   790	 *
   791	 * Return 0 on success or a negative error code otherwise
   792	 */
   793	int msm_csiphy_subdev_init(struct camss *camss,
   794				   struct csiphy_device *csiphy,
   795				   const struct camss_subdev_resources *res, u8 id)
   796	{
   797		struct device *dev = camss->dev;
   798		int ret;
   799	
   800		csiphy->camss = camss;
   801		csiphy->id = id;
   802		csiphy->cfg.combo_mode = 0;
   803		csiphy->res = &res->csiphy;
   804	
   805		snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d",
   806			 csiphy->id);
   807	
   808		csiphy->phy = devm_phy_get(dev, csiphy->name);
   809	
   810		if (IS_ERR(csiphy->phy)) {
 > 811			dev_err(dev, "failed to get phy %s %d\n", csiphy->name, ret);
   812			return PTR_ERR(csiphy->phy);
   813		}
   814	
   815		ret = phy_init(csiphy->phy);
   816		if (ret)
   817			dev_err(dev, "phy %s init fail %d\n", csiphy->name, ret);
   818	
   819		return ret;
   820	}
   821	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
