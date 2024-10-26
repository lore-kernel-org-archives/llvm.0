Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A72320F;
	Sat, 26 Oct 2024 03:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729914109; cv=none; b=kjvBjuG7gZj4+W+dgquaC3Wi8azPEifFXYcDiN3iSpK1A7prOvZSh5FVH2/EZVZ/ZusM/zvBljTFsIoKKvgX+FMBrEJtNmncAmjbNR+v4gIR6xqQVd5hSAIjzArmImsTHMqpLVcVAvpbF9ZnjWtOpHCqS3MuQYFqAPtzEcXAPXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729914109; c=relaxed/simple;
	bh=P8BencE5W38GdO8AEzDNqYOac+bnH3ZK/qYZSlRt22U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X2mHw0lvyk0i4/EVNrjvVIq98CA9sKzj3umyyUch3wgihnlnJ+wMBH7tr61YZG4IolOZKbsgiLVAQFimPb8vRUvcB/MClhwI/EscBAD/vS991rn2tuz4eRcWUMxwpO4rsNvS9ZxxUFtTwvs2BDarWjmESBRVxMpnZkawzXzqbiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyFHXRyU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyFHXRyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729914107; x=1761450107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P8BencE5W38GdO8AEzDNqYOac+bnH3ZK/qYZSlRt22U=;
  b=CyFHXRyUI1MiZ/jekBsA4ix/fBsF1X+yXqjth4q6oWbUxJYFKAF7I7rt
   zOTk0YQ4B2mAKE2UmVMVaK+O2ED7AR+VDEDbvgZI/7u+3UGd/6SLhLvt7
   lCAimxIbWtOG0DmnriPN+eDHeZ0KX+3rmtaP1DYqh50v4CEUmZteqUPVa
   KZzmCoQj2qn7+qdXuRjYdJPv8BRARinJRlkZCmLEet0gUpsD8bPHAtWKs
   yPYiFd/KLeXYl0r1fsqKOJv4rKJEaoxYnAd0IYMoDdHkQWJ8NEdWNBxOJ
   +TimcTpHdjhO7f9Dxm3Q1CmQ+LdWb3AB3AGrlxMFCNSbOTmEnYbrbJqSn
   A==;
X-CSE-ConnectionGUID: peDHM9NBRsaqTSmsxsbjRQ==
X-CSE-MsgGUID: ieuUwBf3Sny3Qk3eFOagnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40207368"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="40207368"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 20:41:46 -0700
X-CSE-ConnectionGUID: Fwq0f7NNQeSovOi2wiKuSw==
X-CSE-MsgGUID: 6bPXzeA8RAiCRHVcJ2VBEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="85065261"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Oct 2024 20:41:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4XgM-000ZE8-18;
	Sat, 26 Oct 2024 03:41:42 +0000
Date: Sat, 26 Oct 2024 11:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:asoc-6.12 30/30]
 sound/soc/intel/atom/sst/sst_acpi.c:311:12: warning: variable 'ctx' is
 uninitialized when used here
Message-ID: <202410261106.EBx49ssy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-6.12
head:   6668610b4d8ce9a3ee3ed61a9471f62fb5f05bf9
commit: 6668610b4d8ce9a3ee3ed61a9471f62fb5f05bf9 [30/30] ASoC: Intel: sst: Support LPE0F28 ACPI HID
config: x86_64-buildonly-randconfig-004-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261106.EBx49ssy-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261106.EBx49ssy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261106.EBx49ssy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/intel/atom/sst/sst_acpi.c:24:
   In file included from include/sound/soc.h:26:
   In file included from include/sound/ac97_codec.h:17:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/intel/atom/sst/sst_acpi.c:311:12: warning: variable 'ctx' is uninitialized when used here [-Wuninitialized]
     311 |                         dev_err(ctx->dev, "Invalid SHIM base\n");
         |                                 ^~~
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                   ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/intel/atom/sst/sst_acpi.c:260:27: note: initialize the variable 'ctx' to silence this warning
     260 |         struct intel_sst_drv *ctx;
         |                                  ^
         |                                   = NULL
   2 warnings generated.


vim +/ctx +311 sound/soc/intel/atom/sst/sst_acpi.c

   255	
   256	static int sst_acpi_probe(struct platform_device *pdev)
   257	{
   258		struct device *dev = &pdev->dev;
   259		int ret = 0;
   260		struct intel_sst_drv *ctx;
   261		const struct acpi_device_id *id;
   262		struct snd_soc_acpi_mach *mach;
   263		struct platform_device *mdev;
   264		struct platform_device *plat_dev;
   265		struct sst_platform_info *pdata;
   266		unsigned int dev_id;
   267	
   268		id = acpi_match_device(dev->driver->acpi_match_table, dev);
   269		if (!id)
   270			return -ENODEV;
   271	
   272		ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
   273		if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SST) {
   274			dev_dbg(dev, "SST ACPI driver not selected, aborting probe\n");
   275			return -ENODEV;
   276		}
   277	
   278		dev_dbg(dev, "for %s\n", id->id);
   279	
   280		mach = (struct snd_soc_acpi_mach *)id->driver_data;
   281		mach = snd_soc_acpi_find_machine(mach);
   282		if (mach == NULL) {
   283			dev_err(dev, "No matching machine driver found\n");
   284			return -ENODEV;
   285		}
   286	
   287		if (soc_intel_is_byt())
   288			mach->pdata = &byt_rvp_platform_data;
   289		else
   290			mach->pdata = &chv_platform_data;
   291		pdata = mach->pdata;
   292	
   293		if (!strcmp(id->id, "LPE0F28")) {
   294			struct resource *rsrc;
   295	
   296			/* Use regular BYT SST PCI VID:PID */
   297			dev_id = 0x80860F28;
   298			byt_rvp_platform_data.res_info = &lpe8086_res_info;
   299	
   300			/*
   301			 * The "LPE0F28" ACPI device has separate IO-mem resources for:
   302			 * DDR, SHIM, MBOX, IRAM, DRAM, CFG
   303			 * None of which covers the entire LPE base address range.
   304			 * lpe8086_res_info.acpi_lpe_res_index points to the SHIM.
   305			 * Patch this to cover the entire base address range as expected
   306			 * by sst_platform_get_resources().
   307			 */
   308			rsrc = platform_get_resource(pdev, IORESOURCE_MEM,
   309						     pdata->res_info->acpi_lpe_res_index);
   310			if (!rsrc) {
 > 311				dev_err(ctx->dev, "Invalid SHIM base\n");
   312				return -EIO;
   313			}
   314			rsrc->start -= pdata->res_info->shim_offset;
   315			rsrc->end = rsrc->start + 0x200000 - 1;
   316		} else {
   317			ret = kstrtouint(id->id, 16, &dev_id);
   318			if (ret < 0) {
   319				dev_err(dev, "Unique device id conversion error: %d\n", ret);
   320				return ret;
   321			}
   322	
   323			if (soc_intel_is_byt_cr(pdev))
   324				byt_rvp_platform_data.res_info = &bytcr_res_info;
   325		}
   326	
   327		dev_dbg(dev, "ACPI device id: %x\n", dev_id);
   328	
   329		ret = sst_alloc_drv_context(&ctx, dev, dev_id);
   330		if (ret < 0)
   331			return ret;
   332	
   333		/* update machine parameters */
   334		mach->mach_params.acpi_ipc_irq_index =
   335			pdata->res_info->acpi_ipc_irq_index;
   336	
   337		plat_dev = platform_device_register_data(dev, pdata->platform, -1,
   338							NULL, 0);
   339		if (IS_ERR(plat_dev)) {
   340			dev_err(dev, "Failed to create machine device: %s\n",
   341				pdata->platform);
   342			return PTR_ERR(plat_dev);
   343		}
   344	
   345		/*
   346		 * Create platform device for sst machine driver,
   347		 * pass machine info as pdata
   348		 */
   349		mdev = platform_device_register_data(dev, mach->drv_name, -1,
   350						(const void *)mach, sizeof(*mach));
   351		if (IS_ERR(mdev)) {
   352			dev_err(dev, "Failed to create machine device: %s\n",
   353				mach->drv_name);
   354			return PTR_ERR(mdev);
   355		}
   356	
   357		/* Fill sst platform data */
   358		ctx->pdata = pdata;
   359		strcpy(ctx->firmware_name, mach->fw_filename);
   360	
   361		ret = sst_platform_get_resources(ctx);
   362		if (ret)
   363			return ret;
   364	
   365		ret = sst_context_init(ctx);
   366		if (ret < 0)
   367			return ret;
   368	
   369		sst_configure_runtime_pm(ctx);
   370		platform_set_drvdata(pdev, ctx);
   371		return ret;
   372	}
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
