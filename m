Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30522F535;
	Sat, 25 Nov 2023 19:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5byQSpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700940148; x=1732476148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VZGLIOw6dLZ5Fua8ZAXrAyv+PxtlAMrrNMBtUOjqrJc=;
  b=g5byQSpSnJ2cra5+GuTXEqqpXb2zaoCpNJJglJW5nZMZban+9D+XzY84
   6T83EHBkrZIzH7GnNKS7XRDiiSEmcDsyLXUDxo4c/yzVl9lj5dJgi10yS
   e5v4b8xvFV7sESaFvqUeDPJP4GSVIcwSbzPPBDrCkQGurEaQnlzetV8x/
   1SzHgP0LsTQd6yh0I5G+8FwDeQp8DvyeuQa/tRnoOGIiYOEWz4wxMIkj2
   IquZjjn/XQodfhXOxmFQVjXGAIOzmpMnJSMD7uQB7J+FyyD7ECV3WvKJm
   xi/ua2IvPx33ICaIF4N3wQc7b/rOBgSbm5SRYvMatIB4+sOQ32P4Ut43y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="5768309"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="5768309"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 11:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="941182314"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="941182314"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Nov 2023 11:22:26 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6yES-0004Kw-1I;
	Sat, 25 Nov 2023 19:22:24 +0000
Date: Sun, 26 Nov 2023 03:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11 09/10] mtd: spi-nor: Add parallel memories support in
 spi-nor
Message-ID: <202311260121.vexJyGHo-lkp@intel.com>
References: <20231125092137.2948-10-amit.kumar-mahapatra@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125092137.2948-10-amit.kumar-mahapatra@amd.com>

Hi Amit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-linus]
[also build test WARNING on linus/master v6.7-rc2]
[cannot apply to mtd/spi-nor/next lee-mfd/for-mfd-fixes next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Kumar-Mahapatra/ALSA-hda-cs35l56-Use-set-get-APIs-to-access-spi-chip_select/20231125-182341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
patch link:    https://lore.kernel.org/r/20231125092137.2948-10-amit.kumar-mahapatra%40amd.com
patch subject: [PATCH v11 09/10] mtd: spi-nor: Add parallel memories support in spi-nor
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231126/202311260121.vexJyGHo-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260121.vexJyGHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260121.vexJyGHo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/core.c:1974:14: warning: variable 'offset' is uninitialized when used here [-Wuninitialized]
                           u64 aux = offset;
                                     ^~~~~~
   drivers/mtd/spi-nor/core.c:1837:23: note: initialize the variable 'offset' to silence this warning
           u32 addr, len, offset, cur_cs_num = 0;
                                ^
                                 = 0
>> drivers/mtd/spi-nor/core.c:3729:8: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                           if (ret)
                               ^~~
   drivers/mtd/spi-nor/core.c:3713:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   2 warnings generated.


vim +/ret +3729 drivers/mtd/spi-nor/core.c

  3709	
  3710	static void spi_nor_restore(struct spi_nor *nor)
  3711	{
  3712		u32 n_flash = 1;
  3713		int ret;
  3714		int idx;
  3715	
  3716		if (nor->num_flash)
  3717			n_flash = nor->num_flash;
  3718	
  3719		/* restore the addressing mode */
  3720		if (nor->addr_nbytes == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
  3721		    nor->flags & SNOR_F_BROKEN_RESET) {
  3722			if (nor->flags & SNOR_F_HAS_PARALLEL) {
  3723				/*
  3724				 * In parallel mode both chip selects i.e., CS0 &
  3725				 * CS1 need to be asserted simulatneously.
  3726				 */
  3727				nor->spimem->spi->cs_index_mask = SPI_NOR_ENABLE_MULTI_CS;
  3728				spi_nor_set_4byte_addr_mode(nor, false);
> 3729				if (ret)
  3730					/*
  3731					 * Do not stop the execution in the hope that the flash
  3732					 * will default to the 3-byte address mode after the
  3733					 * software reset.
  3734					 */
  3735					dev_err(nor->dev,
  3736						"Failed to exit 4-byte address mode, err = %d\n",
  3737						ret);
  3738			} else {
  3739				for (idx = 0; idx < n_flash; idx++) {
  3740					/*
  3741					 * Select the appropriate CS index before
  3742					 * issuing the command.
  3743					 */
  3744					nor->spimem->spi->cs_index_mask = 1 << idx;
  3745					ret = spi_nor_set_4byte_addr_mode(nor, false);
  3746					if (ret)
  3747						/*
  3748						 * Do not stop the execution in the hope that the
  3749						 * flash will default to the 3-byte address mode
  3750						 * after the software reset.
  3751						 */
  3752						dev_err(nor->dev,
  3753							"Failed to exit 4-byte address mode, err = %d\n",
  3754							ret);
  3755				}
  3756			}
  3757		}
  3758	
  3759		if (nor->flags & SNOR_F_SOFT_RESET)
  3760			spi_nor_soft_reset(nor);
  3761	}
  3762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
