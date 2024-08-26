Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933014D8BB;
	Mon, 26 Aug 2024 17:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724693966; cv=none; b=jKmP0U/91mdEj/8mq5cPlGf/f5zfAmy0J8d9+IwpVXtXcBoblg0MbzEbnHha/mbvAo2xuBk0rfjVPeyl6eSZmpAX7Zl1VI30EFujphgcyPhBSkipVoKvooyQEtBv9d3PJVrm7cB4kDBcVXiVJV9MQzSFfU9AVLnaJl20VdUSnXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724693966; c=relaxed/simple;
	bh=pS4a/Irkl1eBtD6eTuJEJOJ6cle3GuqRVNbJ6t9Vkbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hU+TUJAHc6QoyWAeZ5WbnFrxVqYZ+9c8s6vIBPVWbWRXyPKSeaMoK4G+BbByqgzNP6jdtYwanKmAeD54CJgyYSxkNWt83xwIpr8ZzeXaI66oQr+DkPhXoM9LOaH4ex0v/iEgunyZy1M8//WoGnx7sBKnilbpBdPih6tyme7wupg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFDxKD+i; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFDxKD+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724693964; x=1756229964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pS4a/Irkl1eBtD6eTuJEJOJ6cle3GuqRVNbJ6t9Vkbs=;
  b=TFDxKD+ieBXYDWunyMRt1lu94PdPPyX2FA0gEjNU89vKIETbMuuwtO5f
   B3Z1Y0nWZCb44xbhmVH/nsohph7fDHf/JCkVWJa6TDYiadeTTRZ9nZ7Gm
   xSFKFKG7nhQL5Xo5JonKaJlbU/dzC74OruCBr/chDX40wEJVVIGFBZ/mq
   42z6Q8TKrLxrH/6IW2VnoGgZdXJuplPYjMruCtL2n75BH1w3oY8dwhMuG
   OR/Bjibj86J9rOrfJqE4PM6RJbp+FtgRkscWSCmsRomgaiOejWY/+OxdW
   +C8++JWw8avutwRAWT1e7Wu4iht159r7XxnT9Qiv2mm1dv95wlpCogaPB
   Q==;
X-CSE-ConnectionGUID: OgQYmNtRSD+v0bg2vdYKCA==
X-CSE-MsgGUID: VJJ85DiIRxi7gWAf+DVLng==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26928035"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="26928035"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 10:39:23 -0700
X-CSE-ConnectionGUID: DqFWMbXfSYSNiyozqC9QSg==
X-CSE-MsgGUID: VhVezAG1Sc6zUVOLX75l0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="63316472"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Aug 2024 10:39:22 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sidgV-000HRC-0w;
	Mon, 26 Aug 2024 17:39:19 +0000
Date: Tue, 27 Aug 2024 01:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/1] i2c: designware: Consolidate PM ops
Message-ID: <202408270152.HRQNfDNP-lkp@intel.com>
References: <20240823163057.1175381-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240823163057.1175381-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on next-20240826]
[cannot apply to linus/master v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-designware-Consolidate-PM-ops/20240826-171118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240823163057.1175381-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] i2c: designware: Consolidate PM ops
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240827/202408270152.HRQNfDNP-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408270152.HRQNfDNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408270152.HRQNfDNP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-designware-platdrv.c:11:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/i2c/busses/i2c-designware-platdrv.c:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/i2c/busses/i2c-designware-platdrv.c:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/i2c/busses/i2c-designware-platdrv.c:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/i2c/busses/i2c-designware-platdrv.c:383:17: error: use of undeclared identifier 'dw_i2c_dev_pm_ops'; did you mean 'i2c_dw_dev_pm_ops'?
     383 |                 .pm     = pm_ptr(&dw_i2c_dev_pm_ops),
         |                                   ^~~~~~~~~~~~~~~~~
         |                                   i2c_dw_dev_pm_ops
   include/linux/pm.h:475:53: note: expanded from macro 'pm_ptr'
     475 | #define pm_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM), (_ptr))
         |                                                     ^
   include/linux/kernel.h:48:38: note: expanded from macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^
   drivers/i2c/busses/i2c-designware-core.h:345:32: note: 'i2c_dw_dev_pm_ops' declared here
     345 | extern const struct dev_pm_ops i2c_dw_dev_pm_ops;
         |                                ^
   16 warnings and 1 error generated.


vim +383 drivers/i2c/busses/i2c-designware-platdrv.c

2373f6b9744d53 Dirk Brandewie   2011-10-29  375  
2373f6b9744d53 Dirk Brandewie   2011-10-29  376  static struct platform_driver dw_i2c_driver = {
6ad6fde3970c98 Jarkko Nikula    2015-08-31  377  	.probe = dw_i2c_plat_probe,
e190a0c389e601 Uwe Kleine-König 2023-05-08  378  	.remove_new = dw_i2c_plat_remove,
2373f6b9744d53 Dirk Brandewie   2011-10-29  379  	.driver		= {
2373f6b9744d53 Dirk Brandewie   2011-10-29  380  		.name	= "i2c_designware",
231da4058f0ae9 Andy Shevchenko  2024-08-19  381  		.of_match_table = dw_i2c_of_match,
231da4058f0ae9 Andy Shevchenko  2024-08-19  382  		.acpi_match_table = dw_i2c_acpi_match,
a9e4d8b641bc6c Paul Cercueil    2023-07-22 @383  		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
2373f6b9744d53 Dirk Brandewie   2011-10-29  384  	},
61e05bad821cb2 Andy Shevchenko  2024-04-25  385  	.id_table = dw_i2c_platform_ids,
2373f6b9744d53 Dirk Brandewie   2011-10-29  386  };
2373f6b9744d53 Dirk Brandewie   2011-10-29  387  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
