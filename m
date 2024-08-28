Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875E8139578;
	Wed, 28 Aug 2024 20:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724875410; cv=none; b=f7MsPmEB3kV1aoHjQ+WdilHAp09q6wi+M6uuueV8ze+nGWIAgsyswp2wQocpqekgxzgQUa0S8W2eXr3ggBa6hBX7PXYLsnp015kOweBXMhUk/E3C5fipvr22hCHeKFGTZRlvI9RcorJ8m0hPlgSFhDLQf6vdK1oYz1NlNQ0WbNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724875410; c=relaxed/simple;
	bh=S465orGNwX+novbsFvxpFDMGEoiZfuRVtpHrS9wMZtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oA4olLwpkJViZJP3wIaElryiww5mi1lAWawbvPw/xWv8tCat7m0How5viJikLHRNp7L7LmY8H0R/RuVjHCnuLi1Sw3dThi991SQKB4HpaAFWTjPmRF4ufFWCJxuUApcdZpkPs1R7wpuJH4qotktJguDYOuENkXtladGNzzpNAOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbKQNOJA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbKQNOJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724875409; x=1756411409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S465orGNwX+novbsFvxpFDMGEoiZfuRVtpHrS9wMZtE=;
  b=lbKQNOJAslz3dfAmA+k2zKZ+BJCFpqk3XHdUkovhueZ0lzf4QarveIuD
   tuVzOMwQN5LYsySh3eYBhuHZGZls/Yc12Uab5r7hUVkaR1mhhOieggSuj
   GSft0K5Ewv1Gw+60OnrOjuTQvAwrB4YQh4srGpYkvYxsKK7P0ch0ZBw5T
   F8dU/vhNFXQMNAAZsDfU7uKbvZw6ABGLrlgp3XsQd4QOb9QkDJRK24zVs
   stphEqTHB+7ijga0T+6uGX1PjZfiIVt44s0hOt4zgNMyWku12FBk1YH/j
   1Szfdhdz3RfbwkqJu09v0m6JA4xNfKKuaKJM8fNEycqKAcaffK7wEQXrM
   w==;
X-CSE-ConnectionGUID: yiacickbTDaWGIO3mGKeaw==
X-CSE-MsgGUID: EoEkgig2SdeSlA2cG5eDIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23393590"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="23393590"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 13:03:28 -0700
X-CSE-ConnectionGUID: g0yHb0OcRheebttttribBw==
X-CSE-MsgGUID: DIhPlNVcQ3SJZGhXvLiJBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="67484792"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Aug 2024 13:03:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjOt1-000LJ8-1v;
	Wed, 28 Aug 2024 20:03:23 +0000
Date: Thu, 29 Aug 2024 04:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: linmin <linmin@eswincomputing.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [esmil:eic7700 15/20] drivers/iommu/eswin/eic7700-sid.c:264:56:
 error: use of undeclared identifier 'eic7700_sid_soc'
Message-ID: <202408290457.V8Z3IwI1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux eic7700
head:   eb44174b12f99d320be704b45db6b994f6a014bd
commit: 8168e67adcf849dda6a557aeeae0061dd0ad7d94 [15/20] drivers: iommu: Add IOMMU driver for EIC7700
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240829/202408290457.V8Z3IwI1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408290457.V8Z3IwI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408290457.V8Z3IwI1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/eswin/eic7700-sid.c:9:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/iommu/eswin/eic7700-sid.c:9:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iommu/eswin/eic7700-sid.c:9:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/iommu/eswin/eic7700-sid.c:16:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iommu/eswin/eic7700-sid.c:94:5: warning: no previous prototype for function 'eic7700_dynm_sid_enable' [-Wmissing-prototypes]
      94 | int eic7700_dynm_sid_enable(int nid)
         |     ^
   drivers/iommu/eswin/eic7700-sid.c:94:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      94 | int eic7700_dynm_sid_enable(int nid)
         | ^
         | static 
>> drivers/iommu/eswin/eic7700-sid.c:134:5: warning: no previous prototype for function 'eic7700_aon_sid_cfg' [-Wmissing-prototypes]
     134 | int eic7700_aon_sid_cfg(struct device *dev)
         |     ^
   drivers/iommu/eswin/eic7700-sid.c:134:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     134 | int eic7700_aon_sid_cfg(struct device *dev)
         | ^
         | static 
>> drivers/iommu/eswin/eic7700-sid.c:264:56: error: use of undeclared identifier 'eic7700_sid_soc'
     264 |         { .compatible = "eswin,eic7700-scu-sys-con", .data = &eic7700_sid_soc },
         |                                                               ^
>> drivers/iommu/eswin/eic7700-sid.c:549:39: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     548 |         pr_debug("%s:%d, num_tbu=%d,sizeof(struct tbu_priv)=0x%lx, alloc_size=0x%x, tbu_priv_p=0x%px\n",
         |                                                               ~~~
         |                                                               %x
     549 |                 __func__, __LINE__, num_tbuClients, sizeof(struct tbu_priv), alloc_size, tbu_priv_p);
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:589:26: note: expanded from macro 'pr_debug'
     589 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |                          ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                   ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/iommu/eswin/eic7700-sid.c:556:151: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     556 |                 pr_debug("%s, nid %d, tbu 0x%02x, tbu_priv_p(0x%px), sizeof(struct tbu_priv)=0x%lx\n", __func__, nid, tbu_priv_p->tbu_client_p->tbu_id, tbu_priv_p, sizeof(struct tbu_priv));
         |                                                                                                ~~~                                                                  ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                                                                %x
   include/linux/printk.h:589:26: note: expanded from macro 'pr_debug'
     589 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |                          ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                   ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
>> drivers/iommu/eswin/eic7700-sid.c:608:5: warning: no previous prototype for function 'eic7700_tbu_power' [-Wmissing-prototypes]
     608 | int eic7700_tbu_power(struct device *dev, bool is_powerUp)
         |     ^
   drivers/iommu/eswin/eic7700-sid.c:608:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     608 | int eic7700_tbu_power(struct device *dev, bool is_powerUp)
         | ^
         | static 
   12 warnings and 1 error generated.


vim +/eic7700_sid_soc +264 drivers/iommu/eswin/eic7700-sid.c

    93	
  > 94	int eic7700_dynm_sid_enable(int nid)
    95	{
    96		unsigned long reg_val;
    97		struct eic7700_sid *mc = NULL;
    98	
    99		if (nid == NUMA_NO_NODE) {
   100		#ifdef CONFIG_NUMA
   101			pr_err("%s:%d, NUMA_NO_NODE\n", __func__, __LINE__);
   102			return -EFAULT;
   103		#else
   104			pr_info("%s:%d, NUMA_NO_NODE, single DIE\n", __func__, __LINE__);
   105			nid = 0;
   106		#endif
   107		}
   108	
   109		mc = syscon_sid_cfg[nid];
   110		if (mc == NULL)
   111			return -EFAULT;
   112	
   113		mutex_lock(&mc->eswin_dynm_sid_cfg_en_lock);
   114		reg_val = readl(mc->regs + DYMN_CSR_EN_REG_OFFSET);
   115		set_bit(MCPU_SP0_DYMN_CSR_EN_BIT, &reg_val);
   116		writel(reg_val, mc->regs + DYMN_CSR_EN_REG_OFFSET);
   117	
   118		while(1) {
   119			reg_val = readl(mc->regs + DYMN_CSR_GNT_REG_OFFSET) & (1 << MCPU_SP0_DYMN_CSR_GNT_BIT);
   120			if (reg_val)
   121				break;
   122	
   123			msleep(10);
   124		}
   125		reg_val = readl(mc->regs + DYMN_CSR_EN_REG_OFFSET);
   126		clear_bit(MCPU_SP0_DYMN_CSR_EN_BIT, &reg_val);
   127		writel(reg_val, mc->regs + DYMN_CSR_EN_REG_OFFSET);
   128		mutex_unlock(&mc->eswin_dynm_sid_cfg_en_lock);
   129	
   130		return 0;
   131	}
   132	EXPORT_SYMBOL(eic7700_dynm_sid_enable);
   133	
 > 134	int eic7700_aon_sid_cfg(struct device *dev)
   135	{
   136		int ret = 0;
   137		struct regmap *regmap;
   138		int aon_sid_reg;
   139		u32 rdwr_sid_ssid;
   140		u32 sid;
   141		int i,sid_count;
   142		struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
   143		struct device_node *np_syscon;
   144		int syscon_cell_size = 0;
   145	
   146		/* not behind smmu, use the default reset value(0x0) of the reg as streamID*/
   147		if (fwspec == NULL) {
   148			dev_info(dev, "dev is not behind smmu, skip configuration of sid\n");
   149			return 0;
   150		}
   151	
   152		regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "eswin,syscfg");
   153		if (IS_ERR(regmap)) {
   154			dev_err(dev, "No eswin,syscfg phandle specified\n");
   155			return -1;
   156		}
   157	
   158		np_syscon = of_parse_phandle(dev->of_node, "eswin,syscfg", 0);
   159		if (np_syscon) {
   160			if (of_property_read_u32(np_syscon, "#syscon-cells", &syscon_cell_size)) {
   161				of_node_put(np_syscon);
   162				dev_err(dev, "failed to get #syscon-cells of sys_con\n");
   163				return -1;
   164			}
   165			of_node_put(np_syscon);
   166		}
   167	
   168		sid_count = of_count_phandle_with_args(dev->of_node,
   169						"eswin,syscfg", "#syscon-cells");
   170	
   171		dev_dbg(dev, "sid_count=%d, fwspec->num_ids=%d, syscon_cell_size=%d\n",
   172				sid_count, fwspec->num_ids, syscon_cell_size);
   173	
   174		if (sid_count < 0) {
   175			dev_err(dev, "failed to parse eswin,syscfg property!\n");
   176			return -1;
   177		}
   178	
   179		if (fwspec->num_ids != sid_count) {
   180			dev_err(dev, "num_ids(%d) is NOT equal to num of sid regs(%d)!\n",
   181				fwspec->num_ids, sid_count);
   182			return -1;
   183		}
   184	
   185		for (i = 0; i < sid_count; i++) {
   186			sid = fwspec->ids[i];
   187			ret = of_property_read_u32_index(dev->of_node, "eswin,syscfg", (syscon_cell_size + 1)*i+1,
   188						&aon_sid_reg);
   189			if (ret) {
   190				dev_err(dev, "can't get sid cfg reg offset in sys_con(errno:%d)\n", ret);
   191				return ret;
   192			}
   193	
   194			/* make the reading sid the same as writing sid, ssid is fixed to zero */
   195			rdwr_sid_ssid  = FIELD_PREP(AWSMMUSID, sid);
   196			rdwr_sid_ssid |= FIELD_PREP(ARSMMUSID, sid);
   197			rdwr_sid_ssid |= FIELD_PREP(AWSMMUSSID, 0);
   198			rdwr_sid_ssid |= FIELD_PREP(ARSMMUSSID, 0);
   199			regmap_write(regmap, aon_sid_reg, rdwr_sid_ssid);
   200	
   201			ret = eic7700_dynm_sid_enable(dev_to_node(dev));
   202			if (ret < 0)
   203				dev_err(dev, "failed to config streamID(%d) for %s!\n", sid, of_node_full_name(dev->of_node));
   204			else
   205				dev_info(dev, "success to config dma streamID(%d) for %s!\n", sid, of_node_full_name(dev->of_node));
   206		}
   207	
   208		return ret;
   209	}
   210	EXPORT_SYMBOL(eic7700_aon_sid_cfg);
   211	
   212	static int of_parse_syscon_nodes(struct device_node *np, int *nid_p)
   213	{
   214		#ifdef CONFIG_NUMA
   215		int nid;
   216		int r;
   217	
   218		r = of_property_read_u32(np, "numa-node-id", &nid);
   219		if (r)
   220			return -EINVAL;
   221	
   222		pr_debug("Syscon on %u\n", nid);
   223		if (nid >= MAX_NUMNODES) {
   224			pr_warn("Node id %u exceeds maximum value\n", nid);
   225			return -EINVAL;
   226		}
   227		else
   228			*nid_p = nid;
   229		#else
   230			*nid_p = 0;
   231		#endif
   232	
   233		pr_debug("%s, nid = %d\n", __func__, *nid_p);
   234	
   235		return 0;
   236	}
   237	
   238	#if defined(CONFIG_RISCV)
   239	static const struct eic7700_sid_client eic7700_sid_clients[] = {
   240		{
   241			.name = "scpu",
   242			.sid = EIC7700_SID_SCPU,
   243			.reg_offset = SCPU_SID_REG_OFFSET,
   244		},
   245		{
   246			.name = "dma1",
   247			.sid = EIC7700_SID_DMA1,
   248			.reg_offset = DMA1_SID_REG_OFFSET,
   249		},
   250		//{
   251		//	.name = "crypt",
   252		//	.sid = EIC7700_SID_CRYPT,
   253		//	.reg_offset = CRYPT_SID_REG_OFFSET,
   254		//}
   255	};
   256	
   257	static const struct eic7700_sid_soc eic7700_sid_soc = {
   258		.num_clients = ARRAY_SIZE(eic7700_sid_clients),
   259		.clients = eic7700_sid_clients,
   260	};
   261	#endif
   262	
   263	static const struct of_device_id eic7700_sid_of_match[] = {
 > 264		{ .compatible = "eswin,eic7700-scu-sys-con", .data = &eic7700_sid_soc },
   265		{ /* sentinel */ }
   266	};
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
