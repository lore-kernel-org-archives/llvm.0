Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2282B657;
	Tue, 12 Mar 2024 07:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710229107; cv=none; b=bVLp7BpBX5jOixFH63F6QsfHcbcKDpnFjL1snplK7S60f2RZ+ARzqsUHbXYHPs52r0gKfaT5V/ISt8RB9U6zu8Rd07nCNWI5kvXv13/ZSQz36h89T5q+wrFq9pkX+J9fLgALxcXenq/tvprCMD9mJwKQ9GF2iODr4hceIwRzhFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710229107; c=relaxed/simple;
	bh=RNC/FGfanyPniGft439NS50bdt/swdKZwD3sGvPshdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pe+QORXuUYPski+51o/43u1uUwJwHjrzl24pbjuik2CzWgYsA6hC6nJ99aFTfTsCuLIoVkrzq2UFsACfH1W3bsL1W+xLdIaQEokt8MID6HpZJEiZ6NZnj1yTNuNrl5q/Er4yZoFKbEmibU/pxJcFNW9ALQAkO0d/XTjxfMAOnzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKGvZ2F3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKGvZ2F3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710229106; x=1741765106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RNC/FGfanyPniGft439NS50bdt/swdKZwD3sGvPshdA=;
  b=EKGvZ2F3aW94h/iJjgUSiv2xxLtbThige2hyhJ3Go7o8JZ1/mL/oGj8j
   1SEcy4z540xdCGlxwQnzEP7/eZnuM1dvp67VORbNm89KAjzj3aenR/TFa
   G8a2yM7qqa1waNRmqKXqoeG8sewObCe7dnmu5iWAwjVTWIIsaNv7iqFQ3
   QW3qD7eesig0nHN8wakTFMK+Q37Pldlhm8jxfAJqZ72nZF1JlNxwvOmy/
   QglHh+nNReyz/xIwm5sLZfeaLRlnvuRo7PAwGgVGsVvrdLLk+gNeVwtwJ
   dVuMSR+Hnk414jn0xV0V44uzrDcUJ+pPY/OusLT5z5M114KO+0AbrPYg4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4793876"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="4793876"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 00:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="11357579"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Mar 2024 00:38:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjwiL-0009vf-1u;
	Tue, 12 Mar 2024 07:38:21 +0000
Date: Tue, 12 Mar 2024 15:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:clearfog 80/94]
 drivers/net/ethernet/marvell/mvgmac.c:174:48: error: use of undeclared
 identifier 'MVNETA_GMAC_LINK_UP'; did you mean 'MVGMAC_LINK_UP'?
Message-ID: <202403121542.2V1myyKA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm clearfog
head:   9d1640e5aae3e685888788662bb7b33adb457f13
commit: 4e45e1b969facc484006a6998cd4d3daadca4fe2 [80/94] net: mvneta: split out GMAC
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240312/202403121542.2V1myyKA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121542.2V1myyKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121542.2V1myyKA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/marvell/mvgmac.c:174:48: error: use of undeclared identifier 'MVNETA_GMAC_LINK_UP'; did you mean 'MVGMAC_LINK_UP'?
           phylink_pcs_change(&gmac->pcs, !!(gmac_stat & MVNETA_GMAC_LINK_UP));
                                                         ^~~~~~~~~~~~~~~~~~~
                                                         MVGMAC_LINK_UP
   drivers/net/ethernet/marvell/mvgmac.c:52:2: note: 'MVGMAC_LINK_UP' declared here
           MVGMAC_LINK_UP                  = BIT(0),
           ^
   1 error generated.


vim +174 drivers/net/ethernet/marvell/mvgmac.c

   169	
   170	void mvgmac_link_change(struct mvgmac *gmac)
   171	{
   172		u32 gmac_stat = readl_relaxed(gmac->base + GMAC_STATUS_REG);
   173	
 > 174		phylink_pcs_change(&gmac->pcs, !!(gmac_stat & MVNETA_GMAC_LINK_UP));
   175	}
   176	EXPORT_SYMBOL_GPL(mvgmac_link_change);
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
