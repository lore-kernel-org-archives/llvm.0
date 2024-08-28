Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7613BAC3;
	Wed, 28 Aug 2024 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724853981; cv=none; b=WXaYA275BH1BXqU5UDJUlGwEkFt373pryrc3qr0h+fTD9zitzBYWQLflNwO/FFsDUgSlMYBn9HFg8y8qccnQb3jh65DPj3Mw+wG3sxBFMhTUtaw7z2wQ+1DtD79Zvy4Tliezt93pOxbf28/PM39X23fF1JvSeANOL7IeU04Jea0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724853981; c=relaxed/simple;
	bh=p8fYRaYJbikNAFe75FNzV4FuQDGIYOp8Nf9NadyrPGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIXzu89jnVIUgpuZip8clRaRmPL2XvwJOb2BCcfmQWsTD96+8LeFnIYtgqJmZzh3P0deoBffSO2MxBdR4qVe/MELYraAHxrYkFX4P3rdR7TMH4l4cVicBabDDP/Dcy3+BdcIx0RN2Y8+ibQNJXWQ0PDJsrnIb/wGedZIir8pP3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNdGjSDw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNdGjSDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724853979; x=1756389979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p8fYRaYJbikNAFe75FNzV4FuQDGIYOp8Nf9NadyrPGE=;
  b=gNdGjSDwYKkHgKgz+NgQ1EpSavfsRm8fBgrB5y2NME/UlktjvIf9gPvW
   ABr/Ci5a5RZiye7PpMxO24mxck2DMxwalNarKoD0dampFXhtLf8IrM5yg
   z1iY2AnHLg2/VIvoOV4BnU4Kx4uiAEB+cBDAj2JbAQVbZ4J9GTmoP2JlT
   N9fjM3aq5QQfwFIovFuGocExZ6kQDBZNbM1Fd9FXnmXG32s+VQloBONss
   BCsJIESICvj9pk1CJaVRLyaXQyOH1XpnEiDOOA9+khchafmwAIs4JZrhW
   oNtCMFWG9buHuX1FcLuO2ZTkKSvNH3nTnMwSyWU1prg1stkiRYkGRyeqr
   Q==;
X-CSE-ConnectionGUID: Wa6cfArqRsyWE1BD/zjMXw==
X-CSE-MsgGUID: AI6JLGKcQbu4sKUqw9HEig==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="40860519"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="40860519"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 07:06:18 -0700
X-CSE-ConnectionGUID: 33rlizBuQT2V4yEvTqOMIg==
X-CSE-MsgGUID: lswcdQ5iTIuUqiPuz6sCFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="63217887"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Aug 2024 07:06:16 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjJJN-000L1m-2J;
	Wed, 28 Aug 2024 14:06:13 +0000
Date: Wed, 28 Aug 2024 22:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] soc: qcom: pmic_glink: simplify locking with guard()
Message-ID: <202408282155.g3NXNW3R-lkp@intel.com>
References: <20240822163345.223787-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822163345.223787-2-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240823]
[cannot apply to linus/master v6.11-rc5 v6.11-rc4 v6.11-rc3 v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/soc-qcom-pmic_glink-simplify-locking-with-guard/20240826-115806
base:   next-20240823
patch link:    https://lore.kernel.org/r/20240822163345.223787-2-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 2/2] soc: qcom: pmic_glink: simplify locking with guard()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240828/202408282155.g3NXNW3R-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408282155.g3NXNW3R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408282155.g3NXNW3R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/qcom/pmic_glink.c:6:
   In file included from include/linux/auxiliary_bus.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2202:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/qcom/pmic_glink.c:311:3: error: cannot jump from this goto statement to its label
     311 |                 goto out_release_aux_devices;
         |                 ^
   drivers/soc/qcom/pmic_glink.c:314:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     314 |         guard(mutex)(&__pmic_glink_lock);
         |         ^
   include/linux/cleanup.h:303:15: note: expanded from macro 'guard'
     303 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:131:1: note: expanded from here
     131 | __UNIQUE_ID_guard502
         | ^
   drivers/soc/qcom/pmic_glink.c:304:4: error: cannot jump from this goto statement to its label
     304 |                         goto out_release_altmode_aux;
         |                         ^
   drivers/soc/qcom/pmic_glink.c:314:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     314 |         guard(mutex)(&__pmic_glink_lock);
         |         ^
   include/linux/cleanup.h:303:15: note: expanded from macro 'guard'
     303 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:131:1: note: expanded from here
     131 | __UNIQUE_ID_guard502
         | ^
   drivers/soc/qcom/pmic_glink.c:299:4: error: cannot jump from this goto statement to its label
     299 |                         goto out_release_ucsi_aux;
         |                         ^
   drivers/soc/qcom/pmic_glink.c:314:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     314 |         guard(mutex)(&__pmic_glink_lock);
         |         ^
   include/linux/cleanup.h:303:15: note: expanded from macro 'guard'
     303 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:131:1: note: expanded from here
     131 | __UNIQUE_ID_guard502
         | ^
   drivers/soc/qcom/pmic_glink.c:294:4: error: cannot jump from this goto statement to its label
     294 |                         goto out_release_pdr_handle;
         |                         ^
   drivers/soc/qcom/pmic_glink.c:314:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     314 |         guard(mutex)(&__pmic_glink_lock);
         |         ^
   include/linux/cleanup.h:303:15: note: expanded from macro 'guard'
     303 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:131:1: note: expanded from here
     131 | __UNIQUE_ID_guard502
         | ^
   4 warnings and 4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +311 drivers/soc/qcom/pmic_glink.c

58ef4ece1e41ac Bjorn Andersson     2023-01-31  258  
58ef4ece1e41ac Bjorn Andersson     2023-01-31  259  static int pmic_glink_probe(struct platform_device *pdev)
58ef4ece1e41ac Bjorn Andersson     2023-01-31  260  {
ff642773b6b5b8 Neil Armstrong      2023-03-21  261  	const unsigned long *match_data;
58ef4ece1e41ac Bjorn Andersson     2023-01-31  262  	struct pdr_service *service;
58ef4ece1e41ac Bjorn Andersson     2023-01-31  263  	struct pmic_glink *pg;
58ef4ece1e41ac Bjorn Andersson     2023-01-31  264  	int ret;
58ef4ece1e41ac Bjorn Andersson     2023-01-31  265  
58ef4ece1e41ac Bjorn Andersson     2023-01-31  266  	pg = devm_kzalloc(&pdev->dev, sizeof(*pg), GFP_KERNEL);
58ef4ece1e41ac Bjorn Andersson     2023-01-31  267  	if (!pg)
58ef4ece1e41ac Bjorn Andersson     2023-01-31  268  		return -ENOMEM;
58ef4ece1e41ac Bjorn Andersson     2023-01-31  269  
58ef4ece1e41ac Bjorn Andersson     2023-01-31  270  	dev_set_drvdata(&pdev->dev, pg);
58ef4ece1e41ac Bjorn Andersson     2023-01-31  271  
58ef4ece1e41ac Bjorn Andersson     2023-01-31  272  	pg->dev = &pdev->dev;
58ef4ece1e41ac Bjorn Andersson     2023-01-31  273  
58ef4ece1e41ac Bjorn Andersson     2023-01-31  274  	INIT_LIST_HEAD(&pg->clients);
9329933699b32d Bjorn Andersson     2024-04-30  275  	spin_lock_init(&pg->client_lock);
58ef4ece1e41ac Bjorn Andersson     2023-01-31  276  	mutex_init(&pg->state_lock);
58ef4ece1e41ac Bjorn Andersson     2023-01-31  277  
ff642773b6b5b8 Neil Armstrong      2023-03-21  278  	match_data = (unsigned long *)of_device_get_match_data(&pdev->dev);
4db09e7b967b90 Dmitry Baryshkov    2023-10-25  279  	if (!match_data)
4db09e7b967b90 Dmitry Baryshkov    2023-10-25  280  		return -EINVAL;
4db09e7b967b90 Dmitry Baryshkov    2023-10-25  281  
ff642773b6b5b8 Neil Armstrong      2023-03-21  282  	pg->client_mask = *match_data;
ff642773b6b5b8 Neil Armstrong      2023-03-21  283  
f79ee78767ca60 Rob Clark           2024-02-17  284  	pg->pdr = pdr_handle_alloc(pmic_glink_pdr_callback, pg);
f79ee78767ca60 Rob Clark           2024-02-17  285  	if (IS_ERR(pg->pdr)) {
f79ee78767ca60 Rob Clark           2024-02-17  286  		ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->pdr),
f79ee78767ca60 Rob Clark           2024-02-17  287  				    "failed to initialize pdr\n");
f79ee78767ca60 Rob Clark           2024-02-17  288  		return ret;
f79ee78767ca60 Rob Clark           2024-02-17  289  	}
f79ee78767ca60 Rob Clark           2024-02-17  290  
ff642773b6b5b8 Neil Armstrong      2023-03-21  291  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
ff642773b6b5b8 Neil Armstrong      2023-03-21  292  		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi");
58ef4ece1e41ac Bjorn Andersson     2023-01-31  293  		if (ret)
f79ee78767ca60 Rob Clark           2024-02-17  294  			goto out_release_pdr_handle;
ff642773b6b5b8 Neil Armstrong      2023-03-21  295  	}
ff642773b6b5b8 Neil Armstrong      2023-03-21  296  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
ff642773b6b5b8 Neil Armstrong      2023-03-21  297  		ret = pmic_glink_add_aux_device(pg, &pg->altmode_aux, "altmode");
ff642773b6b5b8 Neil Armstrong      2023-03-21  298  		if (ret)
ff642773b6b5b8 Neil Armstrong      2023-03-21  299  			goto out_release_ucsi_aux;
ff642773b6b5b8 Neil Armstrong      2023-03-21  300  	}
ff642773b6b5b8 Neil Armstrong      2023-03-21  301  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT)) {
58ef4ece1e41ac Bjorn Andersson     2023-01-31  302  		ret = pmic_glink_add_aux_device(pg, &pg->ps_aux, "power-supply");
58ef4ece1e41ac Bjorn Andersson     2023-01-31  303  		if (ret)
58ef4ece1e41ac Bjorn Andersson     2023-01-31  304  			goto out_release_altmode_aux;
ff642773b6b5b8 Neil Armstrong      2023-03-21  305  	}
58ef4ece1e41ac Bjorn Andersson     2023-01-31  306  
58ef4ece1e41ac Bjorn Andersson     2023-01-31  307  	service = pdr_add_lookup(pg->pdr, "tms/servreg", "msm/adsp/charger_pd");
58ef4ece1e41ac Bjorn Andersson     2023-01-31  308  	if (IS_ERR(service)) {
58ef4ece1e41ac Bjorn Andersson     2023-01-31  309  		ret = dev_err_probe(&pdev->dev, PTR_ERR(service),
58ef4ece1e41ac Bjorn Andersson     2023-01-31  310  				    "failed adding pdr lookup for charger_pd\n");
f79ee78767ca60 Rob Clark           2024-02-17 @311  		goto out_release_aux_devices;
58ef4ece1e41ac Bjorn Andersson     2023-01-31  312  	}
58ef4ece1e41ac Bjorn Andersson     2023-01-31  313  
1570ad52d5c0f4 Krzysztof Kozlowski 2024-08-22  314  	guard(mutex)(&__pmic_glink_lock);
58ef4ece1e41ac Bjorn Andersson     2023-01-31  315  	__pmic_glink = pg;
58ef4ece1e41ac Bjorn Andersson     2023-01-31  316  
58ef4ece1e41ac Bjorn Andersson     2023-01-31  317  	return 0;
58ef4ece1e41ac Bjorn Andersson     2023-01-31  318  
58ef4ece1e41ac Bjorn Andersson     2023-01-31  319  out_release_aux_devices:
ff642773b6b5b8 Neil Armstrong      2023-03-21  320  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
58ef4ece1e41ac Bjorn Andersson     2023-01-31  321  		pmic_glink_del_aux_device(pg, &pg->ps_aux);
58ef4ece1e41ac Bjorn Andersson     2023-01-31  322  out_release_altmode_aux:
ff642773b6b5b8 Neil Armstrong      2023-03-21  323  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
58ef4ece1e41ac Bjorn Andersson     2023-01-31  324  		pmic_glink_del_aux_device(pg, &pg->altmode_aux);
ff642773b6b5b8 Neil Armstrong      2023-03-21  325  out_release_ucsi_aux:
ff642773b6b5b8 Neil Armstrong      2023-03-21  326  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
ff642773b6b5b8 Neil Armstrong      2023-03-21  327  		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
f79ee78767ca60 Rob Clark           2024-02-17  328  out_release_pdr_handle:
f79ee78767ca60 Rob Clark           2024-02-17  329  	pdr_handle_release(pg->pdr);
58ef4ece1e41ac Bjorn Andersson     2023-01-31  330  
58ef4ece1e41ac Bjorn Andersson     2023-01-31  331  	return ret;
58ef4ece1e41ac Bjorn Andersson     2023-01-31  332  }
58ef4ece1e41ac Bjorn Andersson     2023-01-31  333  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
