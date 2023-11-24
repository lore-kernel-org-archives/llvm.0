Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E422511F;
	Fri, 24 Nov 2023 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSt5g6mq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700856292; x=1732392292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=venqs9i+EXz9B0hcw1eandPiBlvI7OxlKZkne1epeAQ=;
  b=gSt5g6mq8iooP2LmBXpEBoqdqm+YPgoB4qN7L2uYCHTrr6RUXGOwUkhZ
   NZQf4KdtW1gV2qIOC2VyQFhmrKMPgx0/T7b6y6K+TgV4eM3/zXAEnDmPf
   fwB5aZSEdLvZjAUWWI+YtLV6R7EdrYB/4eUOa89YCRJVGFzmH0dRTUzWE
   T2tHwKd4deB6qz4XpQMU7YNIBGHjpQS7HYjK0lSOGqYpaCIBBpq50zddB
   lMWKO93usfqf7RV6n4A4ii7kByM8t61ZXIIZP2SVvAHi1PK0vt7NDphBm
   3BdPPqNtuY3cEQBx7h6yEm7mB6fM9CfxKjo82kSCSILLx1pofSMYx+jr+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="392225832"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="392225832"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 12:04:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="761031431"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="761031431"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 12:04:49 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6cPu-0003F3-2V;
	Fri, 24 Nov 2023 20:04:46 +0000
Date: Sat, 25 Nov 2023 04:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: Donald Robson <donald.robson@imgtec.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 13/20] drm/imagination: Implement firmware
 infrastructure and META FW support
Message-ID: <202311250226.Da2yiSKp-lkp@intel.com>
References: <bb52a8dc84f296b37dc6668dfe8fbaf2ba551139.1700668843.git.donald.robson@imgtec.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb52a8dc84f296b37dc6668dfe8fbaf2ba551139.1700668843.git.donald.robson@imgtec.com>

Hi Donald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.7-rc2]
[cannot apply to drm/drm-next drm-tip/drm-tip next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donald-Robson/drm-gpuvm-Helper-to-get-range-of-unmap-from-a-remap-op/20231123-013514
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/bb52a8dc84f296b37dc6668dfe8fbaf2ba551139.1700668843.git.donald.robson%40imgtec.com
patch subject: [PATCH v9 13/20] drm/imagination: Implement firmware infrastructure and META FW support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311250226.Da2yiSKp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250226.Da2yiSKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250226.Da2yiSKp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imagination/pvr_fw_meta.c:33:1: warning: no previous prototype for function 'pvr_meta_cr_read32' [-Wmissing-prototypes]
      33 | pvr_meta_cr_read32(struct pvr_device *pvr_dev, u32 reg_addr, u32 *reg_value_out)
         | ^
   drivers/gpu/drm/imagination/pvr_fw_meta.c:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      32 | int
         | ^
         | static 
   1 warning generated.


vim +/pvr_meta_cr_read32 +33 drivers/gpu/drm/imagination/pvr_fw_meta.c

    21	
    22	/**
    23	 * pvr_meta_cr_read32() - Read a META register via the Slave Port
    24	 * @pvr_dev: Device pointer.
    25	 * @reg_addr: Address of register to read.
    26	 * @reg_value_out: Pointer to location to store register value.
    27	 *
    28	 * Returns:
    29	 *  * 0 on success, or
    30	 *  * Any error returned by pvr_cr_poll_reg32().
    31	 */
    32	int
  > 33	pvr_meta_cr_read32(struct pvr_device *pvr_dev, u32 reg_addr, u32 *reg_value_out)
    34	{
    35		int err;
    36	
    37		/* Wait for Slave Port to be Ready. */
    38		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL1,
    39					ROGUE_CR_META_SP_MSLVCTRL1_READY_EN |
    40						ROGUE_CR_META_SP_MSLVCTRL1_GBLPORT_IDLE_EN,
    41					ROGUE_CR_META_SP_MSLVCTRL1_READY_EN |
    42						ROGUE_CR_META_SP_MSLVCTRL1_GBLPORT_IDLE_EN,
    43					POLL_TIMEOUT_USEC);
    44		if (err)
    45			return err;
    46	
    47		/* Issue a Read. */
    48		pvr_cr_write32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL0,
    49			       reg_addr | ROGUE_CR_META_SP_MSLVCTRL0_RD_EN);
    50		(void)pvr_cr_read32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL0); /* Fence write. */
    51	
    52		/* Wait for Slave Port to be Ready. */
    53		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL1,
    54					ROGUE_CR_META_SP_MSLVCTRL1_READY_EN |
    55						ROGUE_CR_META_SP_MSLVCTRL1_GBLPORT_IDLE_EN,
    56					ROGUE_CR_META_SP_MSLVCTRL1_READY_EN |
    57						ROGUE_CR_META_SP_MSLVCTRL1_GBLPORT_IDLE_EN,
    58					POLL_TIMEOUT_USEC);
    59		if (err)
    60			return err;
    61	
    62		*reg_value_out = pvr_cr_read32(pvr_dev, ROGUE_CR_META_SP_MSLVDATAX);
    63	
    64		return 0;
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
