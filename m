Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D01459F3;
	Thu, 16 May 2024 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715873651; cv=none; b=M7wIFXgbymUjTk99fHuKgBnNlIgAK/vTy+m+ywi24aQADHc1Ps33bMjAqkverwFaQPslfdk2yrU4MrqRruwtlWIyLQpajYzRGZs87L8R0PfeLcW/u6t/S89TIrSy6t7HTXuKxnEazDaOlR+8j8cNwW2tnMuwVR95UeFg5C8adJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715873651; c=relaxed/simple;
	bh=IuOYls7NNFLlwdTf+lCs65OhhoXPYgnCM73dnbJpNX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q7KIdHnzCo961ymnmlZkKTHLvPOC/FtKOaysDFOvAQQM7ekPaDWFkYmmeYvmQ++T2rRqdMVPe7v7dfBHFh9OATpOrAyw0BubS0yv4GFa/m1Z90519JvULdXaiDu8H2ZlFgkLCOEVZE59GR/of/FRAqYcM1NFvkeNJAOz1l8bD6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0pcnREe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0pcnREe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715873649; x=1747409649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IuOYls7NNFLlwdTf+lCs65OhhoXPYgnCM73dnbJpNX0=;
  b=h0pcnREeLmKaBmmxzhrumQ5SJjHQ1raIzuYdUAhrvUXXFTL5CIDMuofr
   pJ4vGm9PlnOef+kubl+bdige/NdQHOVOhQ6iIJVxCjbS8/AU/JLVY/y0p
   2fsqC5LLik6Km+KH/NPq9UbMo62Xm/5YivY92YyF967YWgwGqR5VpGUNo
   RluNzYRbKyQ9Rd71Ev0AvaWisz6pphaQZysog3BYJfNgzEyHE8KLW6Z4Z
   Rqqza9U73HR5LPAYGA7Rd9ehxIUT7vcyyCVQENJ9kL+Yov2vvwYzqNLe/
   N297XdXfZuY3n33WuePKITb4u0bObFCPZruRCEQczcBH1EYKomSePmUAD
   A==;
X-CSE-ConnectionGUID: WEDiAAMXSxWyrVKyTDQuDA==
X-CSE-MsgGUID: CX8Aa827TyiKk4x96AqdRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11840698"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="11840698"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 08:34:08 -0700
X-CSE-ConnectionGUID: OZBcv+1sRSOkz8VYp1K6Gg==
X-CSE-MsgGUID: 7gjYl/hnQpy3kcHZPIrxAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="62678814"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2024 08:34:07 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7d7M-000EOR-12;
	Thu, 16 May 2024 15:34:04 +0000
Date: Thu, 16 May 2024 23:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 12978/13339]
 arch/riscv/errata/andes/errata.c:68:38: error: use of undeclared identifier
 'RISCV_VENDOR_EXT_ALTERNATIVES_BASE'
Message-ID: <202405162349.Zz8MMiJF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dbd9e2e056d8577375ae4b31ada94f8aa3769e8a
commit: 589e2fc8585098e66cf5dace3806b4737edd0fd1 [12978/13339] riscv: Convert xandespmu to use the vendor extension framework
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240516/202405162349.Zz8MMiJF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405162349.Zz8MMiJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405162349.Zz8MMiJF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/errata/andes/errata.c:14:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
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
>> arch/riscv/errata/andes/errata.c:68:38: error: use of undeclared identifier 'RISCV_VENDOR_EXT_ALTERNATIVES_BASE'
      68 |         BUILD_BUG_ON(ERRATA_ANDES_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
         |                                             ^
   5 warnings and 1 error generated.


vim +/RISCV_VENDOR_EXT_ALTERNATIVES_BASE +68 arch/riscv/errata/andes/errata.c

    63	
    64	void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
    65						      unsigned long archid, unsigned long impid,
    66						      unsigned int stage)
    67	{
  > 68		BUILD_BUG_ON(ERRATA_ANDES_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
