Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E47A1C693;
	Fri,  2 Aug 2024 01:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722563581; cv=none; b=JpxnFHQQ0H4DOSXtA5h8YjFYKi60USqzagyEv2BFa25pRvicpYkoktoKYFky8XuLFsorOxTxCXjaPxVkuI2lwn7W69LydiPKrtcYtkgscMOdiwpd4ftv2CntJfk8wiOkDSUyTzC0rN0PW00QOGgODroNXZwzDVYHXJEcAmzGzYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722563581; c=relaxed/simple;
	bh=lbNXSIuhZXRbwvuF28Thi4ODrbqHLer/uQxRyoWrvYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGojbbZT749xDoAxrSQT660uE5O+rsPrE6MCfdUp+oxbg240uOgbeTD1ln1pxyy4vAvgglSFEE1oyYiPiSL8Ft25EWA5PtmJ2Ir/Dc1gA3+eb/GkeheODEjce/tpjDGAcZpToey9Q5jVdIR/Q+N8eNa40lSYpiz+bcaUO/oItfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EhN6p6ok; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EhN6p6ok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722563579; x=1754099579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lbNXSIuhZXRbwvuF28Thi4ODrbqHLer/uQxRyoWrvYU=;
  b=EhN6p6ok5IsKouRY+64Ifh7DSyccazx70tqDvkOuJg315KCuFBsh5Qzs
   cI01MCU62YGWJpAtvqLnBMT8gdawyJFKzXxDp+837NbRVf4HJMfbhiYlW
   2IxG8IxX8ALiQrFiTYxtuMaUInch70iULaBqlTPPNiU0iD22sjrfbB6qY
   payLonLFlDRGBWY2NIF2eOeJjRo+1anJT4wq2cv22KUStKH6Y95CcGp4w
   lMm5Es1j2D25KOMASLeOKEmHW7HkGrnCWag7+jHDGakRhC9u/E5mJMDkD
   G7t7Lfeq36PBi1EBm0JYRNweCa0dXWPvTDBgwLYoxcZ4mzGwH9mkCM6vh
   w==;
X-CSE-ConnectionGUID: qMTkOHMNQTOT49i56/32IA==
X-CSE-MsgGUID: L7bZqbI7T4iGeCxfd/CZaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20448351"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="20448351"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 18:52:58 -0700
X-CSE-ConnectionGUID: kvkLNTqEQ9eeUmgG2QBO3Q==
X-CSE-MsgGUID: oP+Wvl/ZS9qvCL6R4AVkIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="55843966"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Aug 2024 18:52:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZhTS-000wDg-2O;
	Fri, 02 Aug 2024 01:52:54 +0000
Date: Fri, 2 Aug 2024 09:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/midr-cleanup 8/8]
 drivers/char/hw_random/cavium-rng-vf.c:41:47: error: use of undeclared
 identifier 'MIDR_THUNDERX_83XX'
Message-ID: <202408020930.Zx8WweiI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/midr-cleanup
head:   73db361e3b8efa037e9ab62740b8a67e095778f1
commit: 73db361e3b8efa037e9ab62740b8a67e095778f1 [8/8] WIP: delete unused MIDR definitions
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240802/202408020930.Zx8WweiI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 430b90f04533b099d788db2668176038be38c53b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020930.Zx8WweiI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408020930.Zx8WweiI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/hw_random/cavium-rng-vf.c:12:
   In file included from include/linux/pci.h:1646:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/char/hw_random/cavium-rng-vf.c:41:47: error: use of undeclared identifier 'MIDR_THUNDERX_83XX'
      41 |         if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
         |                                                      ^
>> drivers/char/hw_random/cavium-rng-vf.c:44:47: error: use of undeclared identifier 'MIDR_THUNDERX_81XX'
      44 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_81XX,
         |                                                      ^
>> drivers/char/hw_random/cavium-rng-vf.c:47:47: error: use of undeclared identifier 'MIDR_THUNDERX'
      47 |             midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX,
         |                                                      ^
   5 warnings and 3 errors generated.


vim +/MIDR_THUNDERX_83XX +41 drivers/char/hw_random/cavium-rng-vf.c

cc2f1908c6b8f6 Omer Khaliq   2016-08-23  38  
680efb33546be8 Sunil Goutham 2021-10-29  39  static inline bool is_octeontx(struct pci_dev *pdev)
680efb33546be8 Sunil Goutham 2021-10-29  40  {
680efb33546be8 Sunil Goutham 2021-10-29 @41  	if (midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_83XX,
680efb33546be8 Sunil Goutham 2021-10-29  42  				    MIDR_CPU_VAR_REV(0, 0),
680efb33546be8 Sunil Goutham 2021-10-29  43  				    MIDR_CPU_VAR_REV(3, 0)) ||
680efb33546be8 Sunil Goutham 2021-10-29 @44  	    midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX_81XX,
680efb33546be8 Sunil Goutham 2021-10-29  45  				    MIDR_CPU_VAR_REV(0, 0),
680efb33546be8 Sunil Goutham 2021-10-29  46  				    MIDR_CPU_VAR_REV(3, 0)) ||
680efb33546be8 Sunil Goutham 2021-10-29 @47  	    midr_is_cpu_model_range(read_cpuid_id(), MIDR_THUNDERX,
680efb33546be8 Sunil Goutham 2021-10-29  48  				    MIDR_CPU_VAR_REV(0, 0),
680efb33546be8 Sunil Goutham 2021-10-29  49  				    MIDR_CPU_VAR_REV(3, 0)))
680efb33546be8 Sunil Goutham 2021-10-29  50  		return true;
680efb33546be8 Sunil Goutham 2021-10-29  51  
680efb33546be8 Sunil Goutham 2021-10-29  52  	return false;
680efb33546be8 Sunil Goutham 2021-10-29  53  }
680efb33546be8 Sunil Goutham 2021-10-29  54  

:::::: The code at line 41 was first introduced by commit
:::::: 680efb33546be8960ccbb2f4e0e43034d9c93b30 hwrng: cavium - Check health status while reading random data

:::::: TO: Sunil Goutham <sgoutham@marvell.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
