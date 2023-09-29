Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320564123A;
	Fri, 29 Sep 2023 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696006826; x=1727542826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vTPDHd04Yq+AmECJeKw05gjgTnYbHmBH7SKpEl716vQ=;
  b=Tr+rbOdZW3ZGUA+T2fjmW94B0Siz6hMSATDhKMazWAoXBpub3h9NAnpq
   Hcvy34HItkviUE6+x5BVjDTBrmHSYt6Hd+dh6C1lxnjMJEjwr6YA2WtiT
   pigKiNG6XhYfKo/YCxUl0mNPTHQ0AP2qneYlU+xSMGq1Vm+gFJdPHj+2I
   fA2O2MiyjC+yCfAn5OyK49FMOIa6i65tpsSyFNabJxJrmBs+vujN+MDtm
   vLyGFlC9dSm0LwyLuwfmbuzXBfqyWC8necFnXoP4csYhjGjvmGpdD8tKf
   v1d870Mb8ONDqp5GmuGDvRnbTcdq7h8F2ar+z2zzMEkUIR18zFoAIm4i2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="385163688"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="385163688"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 10:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="893478770"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="893478770"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2023 09:59:09 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmGqi-000353-17;
	Fri, 29 Sep 2023 17:00:20 +0000
Date: Sat, 30 Sep 2023 01:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>,
	Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>,
	=?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	JaimeLiao <jaimeliao.tw@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel@pengutronix.de,
	Rouven Czerwinski <r.czerwinski@pengutronix.de>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: check nand support for cache reads
Message-ID: <202309300033.zf83jfBL-lkp@intel.com>
References: <20230922100116.145090-1-r.czerwinski@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922100116.145090-1-r.czerwinski@pengutronix.de>

Hi Rouven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rouven-Czerwinski/mtd-rawnand-check-nand-support-for-cache-reads/20230922-180317
base:   linus/master
patch link:    https://lore.kernel.org/r/20230922100116.145090-1-r.czerwinski%40pengutronix.de
patch subject: [PATCH] mtd: rawnand: check nand support for cache reads
config: mips-qi_lb60_defconfig (https://download.01.org/0day-ci/archive/20230930/202309300033.zf83jfBL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309300033.zf83jfBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300033.zf83jfBL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/nand_onfi.c:307:20: warning: expression result unused [-Wunused-value]
     307 |                 chip->parameters.supports_read_cache;
         |                 ~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
>> drivers/mtd/nand/raw/nand_jedec.c:98:20: warning: expression result unused [-Wunused-value]
      98 |                 chip->parameters.supports_read_cache;
         |                 ~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +307 drivers/mtd/nand/raw/nand_onfi.c

   140	
   141	/*
   142	 * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
   143	 */
   144	int nand_onfi_detect(struct nand_chip *chip)
   145	{
   146		struct nand_device *base = &chip->base;
   147		struct mtd_info *mtd = nand_to_mtd(chip);
   148		struct nand_memory_organization *memorg;
   149		struct nand_onfi_params *p = NULL, *pbuf;
   150		struct onfi_params *onfi;
   151		bool use_datain = false;
   152		int onfi_version = 0;
   153		char id[4];
   154		int i, ret, val;
   155		u16 crc;
   156	
   157		memorg = nanddev_get_memorg(&chip->base);
   158	
   159		/* Try ONFI for unknown chip or LP */
   160		ret = nand_readid_op(chip, 0x20, id, sizeof(id));
   161		if (ret || strncmp(id, "ONFI", 4))
   162			return 0;
   163	
   164		/* ONFI chip: allocate a buffer to hold its parameter page */
   165		pbuf = kzalloc((sizeof(*pbuf) * ONFI_PARAM_PAGES), GFP_KERNEL);
   166		if (!pbuf)
   167			return -ENOMEM;
   168	
   169		if (!nand_has_exec_op(chip) || chip->controller->supported_op.data_only_read)
   170			use_datain = true;
   171	
   172		for (i = 0; i < ONFI_PARAM_PAGES; i++) {
   173			if (!i)
   174				ret = nand_read_param_page_op(chip, 0, &pbuf[i],
   175							      sizeof(*pbuf));
   176			else if (use_datain)
   177				ret = nand_read_data_op(chip, &pbuf[i], sizeof(*pbuf),
   178							true, false);
   179			else
   180				ret = nand_change_read_column_op(chip, sizeof(*pbuf) * i,
   181								 &pbuf[i], sizeof(*pbuf),
   182								 true);
   183			if (ret) {
   184				ret = 0;
   185				goto free_onfi_param_page;
   186			}
   187	
   188			crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)&pbuf[i], 254);
   189			if (crc == le16_to_cpu(pbuf[i].crc)) {
   190				p = &pbuf[i];
   191				break;
   192			}
   193		}
   194	
   195		if (i == ONFI_PARAM_PAGES) {
   196			const void *srcbufs[ONFI_PARAM_PAGES];
   197			unsigned int j;
   198	
   199			for (j = 0; j < ONFI_PARAM_PAGES; j++)
   200				srcbufs[j] = pbuf + j;
   201	
   202			pr_warn("Could not find a valid ONFI parameter page, trying bit-wise majority to recover it\n");
   203			nand_bit_wise_majority(srcbufs, ONFI_PARAM_PAGES, pbuf,
   204					       sizeof(*pbuf));
   205	
   206			crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)pbuf, 254);
   207			if (crc != le16_to_cpu(pbuf->crc)) {
   208				pr_err("ONFI parameter recovery failed, aborting\n");
   209				goto free_onfi_param_page;
   210			}
   211			p = pbuf;
   212		}
   213	
   214		if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
   215		    chip->manufacturer.desc->ops->fixup_onfi_param_page)
   216			chip->manufacturer.desc->ops->fixup_onfi_param_page(chip, p);
   217	
   218		/* Check version */
   219		val = le16_to_cpu(p->revision);
   220		if (val & ONFI_VERSION_2_3)
   221			onfi_version = 23;
   222		else if (val & ONFI_VERSION_2_2)
   223			onfi_version = 22;
   224		else if (val & ONFI_VERSION_2_1)
   225			onfi_version = 21;
   226		else if (val & ONFI_VERSION_2_0)
   227			onfi_version = 20;
   228		else if (val & ONFI_VERSION_1_0)
   229			onfi_version = 10;
   230	
   231		if (!onfi_version) {
   232			pr_info("unsupported ONFI version: %d\n", val);
   233			goto free_onfi_param_page;
   234		}
   235	
   236		sanitize_string(p->manufacturer, sizeof(p->manufacturer));
   237		sanitize_string(p->model, sizeof(p->model));
   238		chip->parameters.model = kstrdup(p->model, GFP_KERNEL);
   239		if (!chip->parameters.model) {
   240			ret = -ENOMEM;
   241			goto free_onfi_param_page;
   242		}
   243	
   244		memorg->pagesize = le32_to_cpu(p->byte_per_page);
   245		mtd->writesize = memorg->pagesize;
   246	
   247		/*
   248		 * pages_per_block and blocks_per_lun may not be a power-of-2 size
   249		 * (don't ask me who thought of this...). MTD assumes that these
   250		 * dimensions will be power-of-2, so just truncate the remaining area.
   251		 */
   252		memorg->pages_per_eraseblock =
   253				1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
   254		mtd->erasesize = memorg->pages_per_eraseblock * memorg->pagesize;
   255	
   256		memorg->oobsize = le16_to_cpu(p->spare_bytes_per_page);
   257		mtd->oobsize = memorg->oobsize;
   258	
   259		memorg->luns_per_target = p->lun_count;
   260		memorg->planes_per_lun = 1 << p->interleaved_bits;
   261	
   262		/* See erasesize comment */
   263		memorg->eraseblocks_per_lun =
   264			1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
   265		memorg->max_bad_eraseblocks_per_lun = le32_to_cpu(p->blocks_per_lun);
   266		memorg->bits_per_cell = p->bits_per_cell;
   267	
   268		if (le16_to_cpu(p->features) & ONFI_FEATURE_16_BIT_BUS)
   269			chip->options |= NAND_BUSWIDTH_16;
   270	
   271		if (p->ecc_bits != 0xff) {
   272			struct nand_ecc_props requirements = {
   273				.strength = p->ecc_bits,
   274				.step_size = 512,
   275			};
   276	
   277			nanddev_set_ecc_requirements(base, &requirements);
   278		} else if (onfi_version >= 21 &&
   279			(le16_to_cpu(p->features) & ONFI_FEATURE_EXT_PARAM_PAGE)) {
   280	
   281			/*
   282			 * The nand_flash_detect_ext_param_page() uses the
   283			 * Change Read Column command which maybe not supported
   284			 * by the chip->legacy.cmdfunc. So try to update the
   285			 * chip->legacy.cmdfunc now. We do not replace user supplied
   286			 * command function.
   287			 */
   288			nand_legacy_adjust_cmdfunc(chip);
   289	
   290			/* The Extended Parameter Page is supported since ONFI 2.1. */
   291			if (nand_flash_detect_ext_param_page(chip, p))
   292				pr_warn("Failed to detect ONFI extended param page\n");
   293		} else {
   294			pr_warn("Could not retrieve ONFI ECC requirements\n");
   295		}
   296	
   297		/* Save some parameters from the parameter page for future use */
   298		if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_SET_GET_FEATURES) {
   299			chip->parameters.supports_set_get_features = true;
   300			bitmap_set(chip->parameters.get_feature_list,
   301				   ONFI_FEATURE_ADDR_TIMING_MODE, 1);
   302			bitmap_set(chip->parameters.set_feature_list,
   303				   ONFI_FEATURE_ADDR_TIMING_MODE, 1);
   304		}
   305	
   306		if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_READ_CACHE)
 > 307			chip->parameters.supports_read_cache;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
