Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC9C29A9;
	Sun, 22 Dec 2024 06:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734848737; cv=none; b=TNd6fXyBQ9ZhmteLFbzH8eaXTE1D7HGdjxEQO6/i0qXvJa+2nwtdXyXv8sxLYkPYGssk4osH3biB17kMmOlCPZxj8FD0ndz4NzHoI8keoe8iD6Q6d8VjI9vvu0GaQHd0A+AMKVPmnugx+aVyQewGC7kswriB8N1PC7lLGnHKuqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734848737; c=relaxed/simple;
	bh=W5kzsXoNfwgHyHOmU1UFjyJ7eAhIUDQJ3UH+jovAbZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0zISi9KwIq0HwW1A1i85VmyIH1trSeeQxdJappKF1JsVClvWU0CXl+JcT5lVrBAnDR6rgp8/HSKWCuLh4omvLstecLhp5xnNOPfjKB0NwqFQcvHXA4Dxyh8dqVLJqznomkYIB5Ot+LiLtPVBnEVjbnZcPFlxu51ihmlUukC6/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYh59wft; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYh59wft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734848735; x=1766384735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W5kzsXoNfwgHyHOmU1UFjyJ7eAhIUDQJ3UH+jovAbZE=;
  b=gYh59wftC6VzGuGql6cT8NxPrkqIlRRz/8v39ZoiM/0RDf98CAop37JW
   qCP8QAh6K0fibv2tdKXM4NmYjK4Rcn02p+ySLobXeYPRg/EqVVUm5RK5t
   pkcdkbPTGD6okJDViy8NGoB4Rb/Qo0e0LjZ+apLssG4rtlcv97sxlymqr
   1PlQD5E9gP+t5muLKaj6+BBKV93YjNkZj3WQwu5e5EH+TDipFd3Ox0xls
   FZ4nwo4gpH1k8J3WLaQi+mL1MlhYJSyIlVT9ygj9nUuIVzlAQZpk7mSpA
   xSbxQhS42cjhR/Jqo1nRgNiM9Ia3Z/pO3aupJ3udtwfP+UpNiq8GYypB5
   Q==;
X-CSE-ConnectionGUID: xK4yT7aIT/yZIIorjKCp9A==
X-CSE-MsgGUID: rcz4WV9AS8OJaJenatsuIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="39127470"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="39127470"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 22:25:35 -0800
X-CSE-ConnectionGUID: Kkk8hTKWQD2fAF+Cg4FMTw==
X-CSE-MsgGUID: mzzYk/u9RcS2yr4G0Xc+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="103763766"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Dec 2024 22:25:31 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPFP7-0002lT-00;
	Sun, 22 Dec 2024 06:25:29 +0000
Date: Sun, 22 Dec 2024 14:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nihar Chaithanya <niharchaithanya@gmail.com>, dpenkler@gmail.com,
	gregkh@linuxfoundation.org, roheetchavan@gmail.com, arnd@arndb.de,
	dan.carpenter@linaro.org, kees@ijzerbout.nl,
	m.omerfarukbulut@gmail.com, skhan@linuxfoundation.org,
	everestkc@everestkc.com.np, dominik.karol.piatkowski@protonmail.com,
	nathan@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] staging: gpib: Add error handling
Message-ID: <202412221339.S4dQNJOs-lkp@intel.com>
References: <20241221214822.163667-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221214822.163667-1-niharchaithanya@gmail.com>

Hi Nihar,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Nihar-Chaithanya/staging-gpib-Add-error-handling/20241222-060646
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241221214822.163667-1-niharchaithanya%40gmail.com
patch subject: [PATCH v3] staging: gpib: Add error handling
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241222/202412221339.S4dQNJOs-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221339.S4dQNJOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221339.S4dQNJOs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/gpib/fmh_gpib/fmh_gpib.c:15:
   In file included from drivers/staging/gpib/fmh_gpib/fmh_gpib.h:9:
   In file included from include/linux/dmaengine.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
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
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:162:45: warning: bitwise operation between different enumeration types ('enum fmh_gpib_auxmr_bits' and 'enum aux_reg_i_bits') [-Wenum-enum-conversion]
     162 |                 write_byte(&priv->nec7210_priv, AUX_I_REG | LOCAL_PPOLL_MODE_BIT, AUXMR);
         |                                                 ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1694:8: error: use of undeclared label 'err_platform_driver'
    1694 |                 goto err_platform_driver;
         |                      ^
   5 warnings and 1 error generated.


vim +/err_platform_driver +1694 drivers/staging/gpib/fmh_gpib/fmh_gpib.c

  1687	
  1688	static int __init fmh_gpib_init_module(void)
  1689	{
  1690		int result;
  1691	
  1692		result = platform_driver_register(&fmh_gpib_platform_driver);
  1693		if (result)
> 1694			goto err_platform_driver;
  1695	
  1696		result = pci_register_driver(&fmh_gpib_pci_driver);
  1697		if (result)
  1698			goto err_pci_driver;
  1699	
  1700		result = gpib_register_driver(&fmh_gpib_unaccel_interface, THIS_MODULE);
  1701		if (result)
  1702			goto err_unaccel;
  1703	
  1704		result = gpib_register_driver(&fmh_gpib_interface, THIS_MODULE);
  1705		if (result)
  1706			goto err_interface;
  1707	
  1708		result = gpib_register_driver(&fmh_gpib_pci_unaccel_interface, THIS_MODULE);
  1709		if (result)
  1710			goto err_pci_unaccel;
  1711	
  1712		result = gpib_register_driver(&fmh_gpib_pci_interface, THIS_MODULE);
  1713		if (result)
  1714			goto err_pci;
  1715	
  1716		return 0;
  1717	
  1718	err_pci:
  1719		gpib_unregister_driver(&fmh_gpib_pci_unaccel_interface);
  1720	err_pci_unaccel:
  1721		gpib_unregister_driver(&fmh_gpib_interface);
  1722	err_interface:
  1723		gpib_unregister_driver(&fmh_gpib_unaccel_interface);
  1724	err_unaccel:
  1725		pci_unregister_driver(&fmh_gpib_pci_driver);
  1726	err_pci_driver:
  1727		platform_driver_unregister(&fmh_gpib_platform_driver);
  1728	
  1729		return result;
  1730	}
  1731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
