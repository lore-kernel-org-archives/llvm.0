Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A2033987;
	Thu, 30 Jan 2025 06:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218227; cv=none; b=oGRqAX9iJ4lT9u4TWbzltv8O17FMVvkuv1GxrWuk4QrivcqQd6lMOgfK5zUiV/b1ueVq29DVOmpN9SgJXFtU89oFl/HSnIu+riIrK19i4+jB92nWPajJRPpfiyqX6TlP2wIr+bPYebql235FcVIu4M8m5SZIdsY4r0EvZasZ+3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218227; c=relaxed/simple;
	bh=Nl/YWI1yKOVuCByauSXO2HREAsA55kmP4bTZqJ5HIPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DXFPHdmOlWwiGG9B3pt7jP+xWlM+q6vGzb3p/oFq041mVRJwv+PQXcIn1PfPkTLqYmAZt9cY40Xpqq6as0EVioLhlYvhtNuwta5Pm3XF1rVecIAlKgzZ2IFqxQsmUnFEKV3xu1Cm9gtyL30uEQAg0gS2eTuWjpuq8k14dRwMGz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JojvjWC7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JojvjWC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738218227; x=1769754227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nl/YWI1yKOVuCByauSXO2HREAsA55kmP4bTZqJ5HIPo=;
  b=JojvjWC7bxWzgEU+e4dW4QeOPEMjTG6wHbpKeKzDBXB2y2RfD0FVKqQR
   DsRz5BSO7I7cdHQDWfamGrMPazXPjK/V+9hIqmlg3TboQCNsjSsFBpCCb
   ToImOE1AkS/bst8ljbFG9+SH3Y9T8fkfzYDc6Os4xi/bU2B8xUxButkFQ
   w6ciZWNMngAViULxYYm8y2GshxrPSs7POBLbqTQr2bA29WEnzGUCce96t
   WXqNfH/7mxVFJF5DqHMrmBcbU4LrC6l/sv5h0N14Ox91snGh3hUEOXCs1
   SJTZyLSkPPh3lMhmnSXgZwVGQgGfc3kh9oudbtE3v9HEd6leYBtaT0zqs
   w==;
X-CSE-ConnectionGUID: eimVnbUJTZClTKIYz2T/kg==
X-CSE-MsgGUID: DmRof4HaQ4ytqeDa3+cqXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="61225400"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="61225400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 22:23:43 -0800
X-CSE-ConnectionGUID: S7eBHSxUQxm0ihZas/e9eQ==
X-CSE-MsgGUID: mhbBBZ+TRKeSMVE+4eNFRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113853400"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2025 22:23:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdNxj-000jkJ-0B;
	Thu, 30 Jan 2025 06:23:39 +0000
Date: Thu, 30 Jan 2025 14:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-devel:renesas-drivers-for-v6.15 4/6]
 drivers/soc/renesas/r9a09g047-sys.c:51:6: error: call to undeclared function
 'FIELD_GET'; ISO C99 and later do not support implicit function declarations
Message-ID: <202501301435.kjJVK6kR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.15
head:   106b182b2d7f05703d27e37cbcf23a6fb652872f
commit: 1e5827262bc7f29b3735889919009b744ea8f55d [4/6] soc: renesas: rz-sysc: Add support for RZ/G3E family
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250130/202501301435.kjJVK6kR-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301435.kjJVK6kR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301435.kjJVK6kR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/renesas/r9a09g047-sys.c:51:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |         if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
         |             ^
   1 error generated.


vim +/FIELD_GET +51 drivers/soc/renesas/r9a09g047-sys.c

    30	
    31	static void rzg3e_sys_print_id(struct device *dev,
    32					void __iomem *sysc_base,
    33					struct soc_device_attribute *soc_dev_attr)
    34	{
    35		bool is_quad_core, npu_enabled;
    36		u32 prr_val, mode_val;
    37	
    38		prr_val = readl(sysc_base + SYS_LSI_PRR);
    39		mode_val = readl(sysc_base + SYS_LSI_MODE);
    40	
    41		/* Check CPU and NPU configuration */
    42		is_quad_core = !(prr_val & SYS_LSI_PRR_CA55_DIS);
    43		npu_enabled = !(prr_val & SYS_LSI_PRR_NPU_DIS);
    44	
    45		dev_info(dev, "Detected Renesas %s Core %s %s Rev %s%s\n",
    46			 is_quad_core ? "Quad" : "Dual", soc_dev_attr->family,
    47			 soc_dev_attr->soc_id, soc_dev_attr->revision,
    48			 npu_enabled ? " with Ethos-U55" : "");
    49	
    50		/* Check CA55 PLL configuration */
  > 51		if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
    52			dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
