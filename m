Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0751333FF;
	Tue, 18 Jul 2023 07:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689664204; x=1721200204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OqLtRJ6qQeKtfNurpkODK/izY4xvf0W4nM32l7a8IKg=;
  b=fqI/JAwp2DlFUbX4QoVD5Esq1nvFIGvCOFqIdrxIYkb7IjI1TKSfR+1x
   8xnjE4M8whii0xDUbC+ow/wurl2vJ9bY63lfM8jaAtWjbeFJ+nEHHBV4k
   QJp/HRZbsUzUVBgaCBgdu5TEskeYUNCPxdwUYxCt4usiU893PfaGs8QFn
   wpPf29XQRKYnmpnqv2OB0RtAA5zKwp8NFb5NVkKhoWJrdyJysKx2fZ71w
   A/KKsnNowWkvQCbeBSmXiOGeKLiFsEkE9wsdct9QCod42U8deMB/nVbRf
   +C2tYkeeaEbl69dKD/3qhVKJJyxIYxuV5Mfl7jDerhnLuimrL0Fv0jVH+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432312914"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="432312914"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 00:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="753206292"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="753206292"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Jul 2023 00:09:51 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLeqE-0000JX-2Y;
	Tue, 18 Jul 2023 07:09:50 +0000
Date: Tue, 18 Jul 2023 15:09:01 +0800
From: kernel test robot <lkp@intel.com>
To: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [ambarus:spi-nor/next 9/15] drivers/mtd/spi-nor/spansion.c:928:4:
 warning: variable 'priv' is uninitialized when used here
Message-ID: <202307181511.GuBLaRAf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day spi-nor/next
head:   665be09f5a5735bb5dcb60043890682e20ac382f
commit: 8c49ad2ebb7ae23fef6859d3f326e82b8789fc09 [9/15] mtd: spi-nor: spansion: use CLPEF as an alternative to CLSR
config: i386-randconfig-i014-20230718 (https://download.01.org/0day-ci/archive/20230718/202307181511.GuBLaRAf-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307181511.GuBLaRAf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307181511.GuBLaRAf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/spansion.c:928:4: warning: variable 'priv' is uninitialized when used here [-Wuninitialized]
                           priv->clsr = SPINOR_OP_CLSR;
                           ^~~~
   drivers/mtd/spi-nor/spansion.c:911:34: note: initialize the variable 'priv' to silence this warning
           struct spansion_nor_params *priv;
                                           ^
                                            = NULL
   1 warning generated.


vim +/priv +928 drivers/mtd/spi-nor/spansion.c

   907	
   908	static int spansion_nor_late_init(struct spi_nor *nor)
   909	{
   910		struct spi_nor_flash_parameter *params = nor->params;
   911		struct spansion_nor_params *priv;
   912		u8 mfr_flags = nor->info->mfr_flags;
   913	
   914		if (params->size > SZ_16M) {
   915			nor->flags |= SNOR_F_4B_OPCODES;
   916			/* No small sector erase for 4-byte command set */
   917			nor->erase_opcode = SPINOR_OP_SE;
   918			nor->mtd.erasesize = nor->info->sector_size;
   919		}
   920	
   921		if (mfr_flags & (USE_CLSR | USE_CLPEF)) {
   922			params->priv = devm_kmalloc(nor->dev, sizeof(*priv),
   923						    GFP_KERNEL);
   924			if (!params->priv)
   925				return -ENOMEM;
   926	
   927			if (mfr_flags & USE_CLSR)
 > 928				priv->clsr = SPINOR_OP_CLSR;
   929			else if (mfr_flags & USE_CLPEF)
   930				priv->clsr = SPINOR_OP_CLPEF;
   931	
   932			nor->params->ready = spansion_nor_sr_ready_and_clear;
   933		}
   934	
   935		return 0;
   936	}
   937	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
