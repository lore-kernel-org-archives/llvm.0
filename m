Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113445680;
	Wed, 11 Sep 2024 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726014200; cv=none; b=X5mEINX+yrMgFqHllre3USe1tTm68g0aPDO0ndFuI5YyGYAxeuyGewEfKHD+pW4NhVIt7hfYowE4zP0lFZeE6Xk/SeXW9LpUjhgNjJy3udXvNUAhG7vFGDVsT3QbQXX8yg+NrNqNTc2R+6u37x5ltoglVCMKKpzD5aHMqTPtbCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726014200; c=relaxed/simple;
	bh=r3QSKu+ksgtQ8scwAHaW6e889UqJTb38qTPgKM5i40M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dSL9impH1mHYU+CW9guUXbZ6pwAoh/LZYiPF6IrgqR2IHueJINHsKl2GTf718fBjs4DfumlbFaJsCoY1vPJESyBMaEPWv4qk5xLCA4wSA/PKWpbgWhm57aOp/lcF0SbxZ4FPmHvrR96ermp4Qw3TkTGaumblZo9w89jqxAy7qPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DI/M7MiU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DI/M7MiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726014199; x=1757550199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r3QSKu+ksgtQ8scwAHaW6e889UqJTb38qTPgKM5i40M=;
  b=DI/M7MiU4QeZIBp1+zZK6Qvw7ji2B5YALllbyFsDgnjagDaGRYyQndLv
   aBo4UDfGc/XBht/0T7dNNwyX0fu9fLnS8/jSH+LgjnEOd6U6/gPTRPwFi
   /3po/N5YhlvXMgbhgok/7vDUARJAXkJKLwmdt5S+pgT2S+hQBY9Jo4hMg
   6x7lJA8iqPeXtFaY3VppcIwfSn9qghkqzjzzOF/JwmSNA5qHiY/7pDhC2
   mhcIfT20r/ICObrJz41/ZC0ZYrd57Tyz9zkTX3XzFBlqTH6dbadQ9wCgs
   FlhaQ6iV4T6aCDCqGtreUKuQKnBFparLHIUPnaCyuM6dZRjy/1GzQ7iPc
   w==;
X-CSE-ConnectionGUID: 2pZ7L7CiR5yR2gPTK5J4Qg==
X-CSE-MsgGUID: 0Li5+xxbQ1KajbfZPRA95w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="27712569"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="27712569"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 17:23:18 -0700
X-CSE-ConnectionGUID: CS4C+GEHTXKjhPOospC9GQ==
X-CSE-MsgGUID: GrOvnGEtQ4e0LG4uDiPsAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="71570785"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Sep 2024 17:23:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soB8c-0002rg-2W;
	Wed, 11 Sep 2024 00:23:14 +0000
Date: Wed, 11 Sep 2024 08:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:gtmb_rfc_poc 2/2] drivers/irqchip/irq-acpi-gtmb.c:355:34:
 warning: format specifies type 'int' but the argument has type 'u64' (aka
 'unsigned long long')
Message-ID: <202409110802.wbMg86QB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux gtmb_rfc_poc
head:   d975d1fc71375296874c62007464dd2a87b861af
commit: d975d1fc71375296874c62007464dd2a87b861af [2/2] drivers/irqchip: Add GTMB driver for GSI based ACPI devices
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240911/202409110802.wbMg86QB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110802.wbMg86QB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110802.wbMg86QB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-acpi-gtmb.c:11:
   In file included from include/linux/irq.h:23:
   In file included from arch/riscv/include/asm/irq.h:10:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/irqchip/irq-acpi-gtmb.c:355:34: warning: format specifies type 'int' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     355 |                 pr_info("Registered GSI %d\n", res->gsino);
         |                                         ~~     ^~~~~~~~~~
         |                                         %llu
   include/linux/printk.h:538:34: note: expanded from macro 'pr_info'
     538 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +355 drivers/irqchip/irq-acpi-gtmb.c

   262	
   263	static int gtmb_parse_package_resource(struct platform_device *pdev, struct gtmb_data *data)
   264	{
   265		struct device *dev = &pdev->dev;
   266		int result = -EFAULT;
   267		acpi_status status = AE_OK;
   268		struct acpi_buffer buffer = {ACPI_ALLOCATE_BUFFER, NULL};
   269		union acpi_object *gtmb_obj = NULL, *tmp_obj, *gsi_num_obj, *gtmb_reg_obj;
   270		struct gtmb_dev_res *res;
   271		struct gtmb_reg *gas_t;
   272		int i,j;
   273	
   274		struct acpi_handle *handle = ACPI_HANDLE_FWNODE(dev->fwnode);
   275		status = acpi_evaluate_object_typed(handle, "_GMA", NULL,
   276						    &buffer, ACPI_TYPE_PACKAGE);
   277		if (status == AE_NOT_FOUND)
   278			return 0;
   279		if (ACPI_FAILURE(status))
   280			return -ENODEV;
   281	
   282		gtmb_obj = buffer.pointer;
   283		if (!gtmb_obj) {
   284			pr_err("Invalid GTMB data\n");
   285			goto end;
   286		}
   287	
   288		/* Validate the version */
   289		if (gtmb_obj->package.elements[0].integer.value != ACPI_GTMB_VERSION){
   290			pr_err("Invalid GTMB Version\n");
   291			goto end;
   292		}
   293	
   294		for (i = 1; i < gtmb_obj->package.count; i++) {
   295			tmp_obj = &gtmb_obj->package.elements[i];
   296			if (tmp_obj->type != ACPI_TYPE_PACKAGE) {
   297				pr_err("Unsupported _GMA object found at %i index of type %d\n", i, tmp_obj->type);
   298				goto end;
   299			}
   300			if(tmp_obj->package.count != (GTMB_MSI_INDEX_MAX + 1)) {
   301				pr_err("Unsupported _GMA object found at %i with package elements %d\n",
   302					i, tmp_obj->package.count);
   303				goto end;
   304			}
   305	
   306			res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
   307			if (!res)
   308				goto end_nomem;
   309	
   310			gsi_num_obj = &tmp_obj->package.elements[0];
   311			if (gsi_num_obj->type != ACPI_TYPE_INTEGER) {
   312				pr_err("Unsupported _GMA object found at %i with invalid first element type %d\n",
   313					i, gsi_num_obj->type);
   314				goto end;
   315			}
   316	
   317			res->gsino = gsi_num_obj->integer.value;
   318			for(j = 0; j < GTMB_MSI_INDEX_MAX; j++) {
   319				gtmb_reg_obj = &tmp_obj->package.elements[j+1];
   320				if (gtmb_reg_obj->type == ACPI_TYPE_INTEGER) {
   321					if ((j == GTMB_MSI_RETRIGGER_REG_INDEX) ||
   322					    (j >= GTMB_MSI_TRIG_TYPE_EDGE_RISING_INDEX &&
   323					    j <= GTMB_MSI_TRIG_TYPE_LEVEL_LOW_INDEX)){
   324					    	res->regs[j].type = ACPI_TYPE_INTEGER;
   325						res->regs[j].int_val = gtmb_reg_obj->integer.value;
   326					    } else {
   327						pr_err("Invalid _GMA object at %i type %d\n",
   328							j, gtmb_reg_obj->type);
   329						goto free_list;
   330					    }
   331				}
   332				else if (gtmb_reg_obj->type == ACPI_TYPE_BUFFER) {
   333					gas_t = (struct gtmb_reg *)gtmb_reg_obj->buffer.pointer;
   334					if (gas_t->space_id == ACPI_ADR_SPACE_SYSTEM_MEMORY) {
   335						if (gas_t->address) {
   336							void __iomem *addr;
   337							size_t access_width;
   338							access_width = GET_BIT_WIDTH(gas_t) / 8;
   339							addr = ioremap(gas_t->address, access_width);
   340							if (!addr)
   341								goto free_list;
   342							res->regs[j].type = ACPI_ADR_SPACE_SYSTEM_MEMORY;
   343							res->regs[j].sysmem_va = addr;
   344						}
   345					} else {
   346						pr_err("Unsupported register type(%d) in _SMC object at index(%d)\n", gas_t->space_id, j);
   347						goto end;
   348					}
   349				} else {
   350					pr_err("Unsupported _GMA object found at %i with invalid element type %d\n",
   351						i, gtmb_reg_obj->type);
   352					goto free_list;
   353				}
   354			}
 > 355			pr_info("Registered GSI %d\n", res->gsino);
   356			list_add(&res->list, &data->dev_res_list);
   357		}
   358		kfree(buffer.pointer);
   359		return 0;
   360	
   361	end_nomem:
   362		result = -ENOMEM;
   363	free_list:
   364		gtmb_free_devres_list(data);
   365	end:
   366		kfree(buffer.pointer);
   367		return result;
   368	}
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
