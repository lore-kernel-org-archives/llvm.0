Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573F1946C3;
	Mon, 27 Jan 2025 22:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738016400; cv=none; b=M61LA/cpRdKJ0CbvUFRJ86jDGweQl1tebaCI8UYNhNkfGkVHLy0dn+kf7yd4vXGqbEayYg21dU5ESUYnavzrLSJqtv7fN5/0o71O1v3cTUZPEyV2F7eGgGhDcwzC0exozQKWG+ChqzSJWgGS6MiqrmJDg0CwQc6+tGMrdx7VLdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738016400; c=relaxed/simple;
	bh=YOhchowGCl7t0+Lttz1nbJE/PMwLzThRPQ3MLN+D1IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+9MlYzEhZeSx9nIf16SNU5EbW4LyOF3v8rNdLIgAt0+N+6DCFRRH8nm6rnUBtoRUddUfTn5naqubodMiql5zXuuZsM/nmGQum2P03aXHKdP5vfO177IYSViIGq9uU5Ls9CKiUESg++AL3UDDlDz7fppM5o0QSev+sCBbTTMO9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsdFXJPv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsdFXJPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738016398; x=1769552398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YOhchowGCl7t0+Lttz1nbJE/PMwLzThRPQ3MLN+D1IU=;
  b=AsdFXJPvmw6UhtOxgIAJzdlI1lC2Wy2Cnwwzm8nmt61DDlvyy4X2NYNf
   3dp8mGZLGMg2/BJNCKJ4UW5COAvEh1qeZrpVVqtgcnkP95RxirUrqCVWX
   +XFtnwp5hqyUaC5XD2Wdnubj+/YdUwJwANB2k04s/GCEhfffrVD9VMpIp
   mgEUuqHnUQxDkgHE7x8z5gHgOrJkGWhKkuKoiu0LMbnsLU+TlaJjX8wrT
   DmePrihEUyE4S+mpWNTOfmBURtC4WV2Wq73P+Eodq/h8mJ8Fbh28t4zlG
   q3vLFqh7oLd9oqf4LzhZ1QotHooiV43K9BrrQ0BxT9Mw5B/U48WO8c23j
   w==;
X-CSE-ConnectionGUID: zWsCUZgZTouO73j2zwbAMQ==
X-CSE-MsgGUID: uP0LtzCyT3+4EA/Nz3Gd1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49088042"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="49088042"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 14:19:56 -0800
X-CSE-ConnectionGUID: 75uNRsCgTk2rZx+eESY6wQ==
X-CSE-MsgGUID: Ks+GbX6GTneKRqLJiQ4M9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="108530271"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jan 2025 14:19:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcXSS-000hDH-1A;
	Mon, 27 Jan 2025 22:19:52 +0000
Date: Tue, 28 Jan 2025 06:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 11/14] ahci: pata_arasan_cf: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
Message-ID: <202501280531.FN5QLnfR-lkp@intel.com>
References: <20250127-pm_ata-v1-11-f8f50c821a2a@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127-pm_ata-v1-11-f8f50c821a2a@gmail.com>

Hi Raphael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5ffa57f6eecefababb8cbe327222ef171943b183]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/ahci-brcm-Switch-from-CONFIG_PM_SLEEP-guards-to-pm_sleep_ptr/20250127-205128
base:   5ffa57f6eecefababb8cbe327222ef171943b183
patch link:    https://lore.kernel.org/r/20250127-pm_ata-v1-11-f8f50c821a2a%40gmail.com
patch subject: [PATCH RFC 11/14] ahci: pata_arasan_cf: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250128/202501280531.FN5QLnfR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501280531.FN5QLnfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280531.FN5QLnfR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ata/pata_arasan_cf.c:28:
   In file included from include/linux/dmaengine.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ata/pata_arasan_cf.c:938:2: error: call to undeclared function 'ata_host_suspend'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     938 |         ata_host_suspend(host, PMSG_SUSPEND);
         |         ^
>> drivers/ata/pata_arasan_cf.c:948:2: error: call to undeclared function 'ata_host_resume'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     948 |         ata_host_resume(host);
         |         ^
   3 warnings and 2 errors generated.


vim +/ata_host_suspend +938 drivers/ata/pata_arasan_cf.c

a480167b23ef9b3 Viresh Kumar    2011-02-22  928  
a480167b23ef9b3 Viresh Kumar    2011-02-22  929  static int arasan_cf_suspend(struct device *dev)
a480167b23ef9b3 Viresh Kumar    2011-02-22  930  {
90f0adf0936d464 Sergei Shtylyov 2011-10-12  931  	struct ata_host *host = dev_get_drvdata(dev);
a480167b23ef9b3 Viresh Kumar    2011-02-22  932  	struct arasan_cf_dev *acdev = host->ports[0]->private_data;
a480167b23ef9b3 Viresh Kumar    2011-02-22  933  
40679b3ce9d993e Viresh Kumar    2012-02-23  934  	if (acdev->dma_chan)
72b2caff4aac451 Vinod Koul      2014-10-11  935  		dmaengine_terminate_all(acdev->dma_chan);
40679b3ce9d993e Viresh Kumar    2012-02-23  936  
a480167b23ef9b3 Viresh Kumar    2011-02-22  937  	cf_exit(acdev);
ec87cf3782f7b05 Sergey Shtylyov 2022-02-02 @938  	ata_host_suspend(host, PMSG_SUSPEND);
ec87cf3782f7b05 Sergey Shtylyov 2022-02-02  939  	return 0;
a480167b23ef9b3 Viresh Kumar    2011-02-22  940  }
a480167b23ef9b3 Viresh Kumar    2011-02-22  941  
a480167b23ef9b3 Viresh Kumar    2011-02-22  942  static int arasan_cf_resume(struct device *dev)
a480167b23ef9b3 Viresh Kumar    2011-02-22  943  {
90f0adf0936d464 Sergei Shtylyov 2011-10-12  944  	struct ata_host *host = dev_get_drvdata(dev);
a480167b23ef9b3 Viresh Kumar    2011-02-22  945  	struct arasan_cf_dev *acdev = host->ports[0]->private_data;
a480167b23ef9b3 Viresh Kumar    2011-02-22  946  
a480167b23ef9b3 Viresh Kumar    2011-02-22  947  	cf_init(acdev);
a480167b23ef9b3 Viresh Kumar    2011-02-22 @948  	ata_host_resume(host);
a480167b23ef9b3 Viresh Kumar    2011-02-22  949  
a480167b23ef9b3 Viresh Kumar    2011-02-22  950  	return 0;
a480167b23ef9b3 Viresh Kumar    2011-02-22  951  }
a480167b23ef9b3 Viresh Kumar    2011-02-22  952  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
