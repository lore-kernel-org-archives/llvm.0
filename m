Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BB560279;
	Tue, 23 Apr 2024 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713867172; cv=none; b=TkmeC11T24fQPkoxVB7UScw4noB3E5rxCKrKoLATPmr+W6xRaMIcmsnr8F1DH94Qk9vrK0Kco8S+8CmJZEoeGrgtxC6tKMJof5/lepJegFtF1iQ1GxjNLdOtTMefat4WY30vZhG2utGpQrIaQlXUnqd79Se83SuSKLEWpNAL4Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713867172; c=relaxed/simple;
	bh=vZKKjmWLRhxb5IhsUVl21dx0btd++91EdMjGvQHTZcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aphRYF6u44nLXZq4x9KtAUgVIIKOWyyxgawzkj0uUcuRu8TxdriKJQ03Q4E/YLxspmnisC03vIQG+z5ouG25Go49yKrT9bIPoqWQZICU0wqTnFj0tUCEPQEGy6X9HNwNMrGoBv+4HbvzVqwEndaXq79cdqhsGCiaPycF0R8eDzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuXX4MEf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuXX4MEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713867170; x=1745403170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vZKKjmWLRhxb5IhsUVl21dx0btd++91EdMjGvQHTZcc=;
  b=iuXX4MEfx+xJArMVmgOI0fjYkAIDvl+4yy1VgTUqN11FUwg68jcCBPH1
   W5MvIA1fl0JhHMi8Czur/qICtKcj6eZ9pmF1IyzpKGbvlxA/W//QVule3
   l9HTKqxSFa/KxAX3GDGVeZRKRKu8kj003bybybSIRHonCtv/6BB9RAwR5
   KLM+j0BxGSI6uGyiaCZzGdtl60OaUA/UvNbPVYuL73ANM+yvRjEES1fdO
   g1UOVq564/jLppz5P1kxljdUaKrf3yGLz6YEts104nCYE0M7e5yQ+k5eM
   wSNQa6rKlmsqLW7Z9r6mmudu+va4K1ZXQMqypLMunQmNXbJqzgXfIZPDp
   Q==;
X-CSE-ConnectionGUID: QuYVWSNVRvK9oOaqp4H7Kw==
X-CSE-MsgGUID: gqn5zO9eR8yP/8rh7shVAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9613417"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9613417"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 03:12:28 -0700
X-CSE-ConnectionGUID: TH4a4z0nT1utmuVyX7SEjg==
X-CSE-MsgGUID: EoVKGZ8uTbaTHOsEW3lMXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24370028"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Apr 2024 03:12:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzD8T-00006C-03;
	Tue, 23 Apr 2024 10:12:25 +0000
Date: Tue, 23 Apr 2024 18:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [linux-next:master 6931/7876]
 drivers/remoteproc/xlnx_r5_remoteproc.c:914:11: warning: variable 'ret' is
 used uninitialized whenever 'if' condition is false
Message-ID: <202404231839.oHiY9Lw8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a59668a9397e7245b26e9be85d23f242ff757ae8
commit: a6b974b40f942b3e51124de588383009f6a42d2d [6931/7876] drivers: remoteproc: xlnx: Add Versal and Versal-NET support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240423/202404231839.oHiY9Lw8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404231839.oHiY9Lw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404231839.oHiY9Lw8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/remoteproc/xlnx_r5_remoteproc.c:8:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/remoteproc/xlnx_r5_remoteproc.c:914:11: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     914 |         else if (device_is_compatible(dev, "xlnx,zynqmp-r5fss"))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/xlnx_r5_remoteproc.c:917:6: note: uninitialized use occurs here
     917 |         if (ret) {
         |             ^~~
   drivers/remoteproc/xlnx_r5_remoteproc.c:914:7: note: remove the 'if' if its condition is always true
     914 |         else if (device_is_compatible(dev, "xlnx,zynqmp-r5fss"))
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     915 |                 ret = zynqmp_r5_get_tcm_node(cluster);
   drivers/remoteproc/xlnx_r5_remoteproc.c:907:9: note: initialize the variable 'ret' to silence this warning
     907 |         int ret, i;
         |                ^
         |                 = 0
   6 warnings generated.


vim +914 drivers/remoteproc/xlnx_r5_remoteproc.c

   890	
   891	/*
   892	 * zynqmp_r5_core_init()
   893	 * Create and initialize zynqmp_r5_core type object
   894	 *
   895	 * @cluster: pointer to zynqmp_r5_cluster type object
   896	 * @fw_reg_val: value expected by firmware to configure RPU cluster mode
   897	 * @tcm_mode: value expected by fw to configure TCM mode (lockstep or split)
   898	 *
   899	 * Return: 0 for success and error code for failure.
   900	 */
   901	static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
   902				       enum rpu_oper_mode fw_reg_val,
   903				       enum rpu_tcm_comb tcm_mode)
   904	{
   905		struct device *dev = cluster->dev;
   906		struct zynqmp_r5_core *r5_core;
   907		int ret, i;
   908	
   909		r5_core = cluster->r5_cores[0];
   910	
   911		/* Maintain backward compatibility for zynqmp by using hardcode TCM address. */
   912		if (of_find_property(r5_core->np, "reg", NULL))
   913			ret = zynqmp_r5_get_tcm_node_from_dt(cluster);
 > 914		else if (device_is_compatible(dev, "xlnx,zynqmp-r5fss"))
   915			ret = zynqmp_r5_get_tcm_node(cluster);
   916	
   917		if (ret) {
   918			dev_err(dev, "can't get tcm, err %d\n", ret);
   919			return ret;
   920		}
   921	
   922		for (i = 0; i < cluster->core_count; i++) {
   923			r5_core = cluster->r5_cores[i];
   924	
   925			/* Initialize r5 cores with power-domains parsed from dts */
   926			ret = of_property_read_u32_index(r5_core->np, "power-domains",
   927							 1, &r5_core->pm_domain_id);
   928			if (ret) {
   929				dev_err(dev, "failed to get power-domains property\n");
   930				return ret;
   931			}
   932	
   933			ret = zynqmp_pm_set_rpu_mode(r5_core->pm_domain_id, fw_reg_val);
   934			if (ret < 0) {
   935				dev_err(r5_core->dev, "failed to set RPU mode\n");
   936				return ret;
   937			}
   938	
   939			if (of_find_property(dev_of_node(dev), "xlnx,tcm-mode", NULL) ||
   940			    device_is_compatible(dev, "xlnx,zynqmp-r5fss")) {
   941				ret = zynqmp_pm_set_tcm_config(r5_core->pm_domain_id,
   942							       tcm_mode);
   943				if (ret < 0) {
   944					dev_err(r5_core->dev, "failed to configure TCM\n");
   945					return ret;
   946				}
   947			}
   948		}
   949	
   950		return 0;
   951	}
   952	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
